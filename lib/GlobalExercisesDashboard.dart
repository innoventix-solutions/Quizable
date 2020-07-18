import 'dart:convert';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_getassignment.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newpro/Pojo/pojo_leaderboard.dart';
import 'Pojo/pojo_leaderboard.dart';
import 'package:fluttertoast/fluttertoast.dart';




class GlobalDashboard extends StatefulWidget {
  @override
  _GlobalDashboardState createState() => _GlobalDashboardState();
}

class _GlobalDashboardState extends State<GlobalDashboard> {


  GlobalData globalData = new GlobalData();

  //final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  List<Pojo_quizzes> Quizz_List = new List();
  List<Pojo_getassignment> assignment_list = new List();


  List<leaderboard> leader = new List();
  leaderboards()async{
    await http.post(GlobalData.applink+"get_leaderboard.php",
        body: {


        }).then((response) {
      print(response.body);

      var parsedjson = jsonDecode(response.body);
      print("Leader " + parsedjson['student_data'].toString());

      if(parsedjson['student_data'].toString()!="false") {
        leader = (parsedjson['student_data'] as List).map((data) =>
            leaderboard.fromJson(data)).toList();

        setState(() {

        });
      }

    });

  }





  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Log Out"),
          content: new Text("Are You Sure Want To Log Out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20
                    ),
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('studentdashboard');
                        },child: new Text("Cancel")),


                  ),

                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            FlatButton(
              child: Row(
                children: <Widget>[

                  GestureDetector(
                      onTap: () async {
                        LogoutFunction(context);
                        // Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),
                ],
              ),
              onPressed: () async{
                LogoutFunction(context);
//                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb	:60,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    leaderboards();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Global Exercises Dashboard",
            style: TextStyle(fontSize: 17),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [GlobalData.pinkred, GlobalData.pinkred],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),



      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(child: Padding(
              padding: const EdgeInsets.only(bottom: 10,top: 25),
              child: DrawerHeader(child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(backgroundImage:GlobalData.Userphoto!=""?
                      NetworkImage(GlobalData.Userphoto):globalData.getgender(),
                        radius: 35.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(GlobalData.Username,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                fontSize: 14),),

                        ),


                          Container(
                            child: Text(GlobalData.activeclass!=null?GlobalData.activeclass.classname:"No Class Selected",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                  fontSize: 12),),
                          ),

                        ],),
                    )
                  ],),
              ),),
            ),color: GlobalData.pinkred,),



            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:30),
                child: Row(children: <Widget>[Icon(Icons.home,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Home',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context)
                  .pop();
            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.info,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('About Quizable',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('AboutQuizable');
            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.subject,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Go to Classroom',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context).pushNamed('studentselectclass');
            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.account_circle,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Edit Profile',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ), onTap: (){
              Navigator.of(context)
                  .pushNamed('EditProfileStudent');
            },
            ),

           /* GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.gamepad,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Game Room',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('GameRoom');
            },
            ),*/

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.surround_sound,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Announcements',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('Announcements');
              Show_toast("Thank you for registering. We’re glad to have you in our learning community."+GlobalData.signupdate, Colors.green);

            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.share,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Share App',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),],),
              ),onTap: (){
              Share.share(GlobalData.Username +" is Sharing App - "+ "https://play.google.com/store/apps/details?id=com.innoventixsolutions.quizable");

            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.settings,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Manage My Subscription',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),],),
              ),onTap: (){

              Navigator.of(context)
                  .pushNamed('developpage');
              /*Navigator.of(context)
                  .pushNamed('ManageAccount');*/
            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20,bottom: 28),
                child: Row(children: <Widget>[Icon(Icons.power_settings_new,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Log Out',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),],),
              ),onTap: (){
              showDialog1(context);
            },



            ),





          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 180,
              //decoration: bg12,
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5,top: 20),
                    child: Text("Hello, " + GlobalData.Username,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                          fontSize: 20),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Stack(children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          backgroundImage:GlobalData.Userphoto!=""?
                          NetworkImage(GlobalData.Userphoto):globalData.getgender(),
                          radius: 50.0,
                        ),
                      ),
                      Positioned(
                        right: 0,bottom: 0,
                        child: GestureDetector(onTap: (){

                          Navigator.of(context)
                              .pushNamed('EditProfileStudent');

                        },
                          child: Card(color: Colors.black,elevation: 5.0,
                            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(




                                child:Icon(
                                  Icons.file_upload,
                                  color: Colors.white,
                                  size: 12.0,

                                ),),
                            ),
                          ),
                        ),
                      ),
                    ],

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Welcome to \n Quizable Global Exercises",style:
                    TextStyle(fontSize: 21,color:GlobalData.lightblue,fontWeight: FontWeight.bold,height: 1.1),
                      textAlign: TextAlign.center,),
                  ),

                ],
              ),
            ),


                Container(
                  child: Column(
                    children: <Widget>[

                      SizedBox(width: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(top:10,left: 40,right: 40,bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: GradientButtonText(
                                    linearGradient:LinearGradient(colors: <Color>[GlobalData.lightblue,GlobalData.lightblue]) ,
                                    text: Text("Global Quiz",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                          fontSize: 18),textAlign: TextAlign.center,),
                                    ButtonClick: (){

                                      Navigator.of(context).pushNamed('globalstudentsubject');

                                    },)),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: GradientButtonText(

                                    linearGradient:LinearGradient(
                                        colors: <Color>[GlobalData.lightblue,GlobalData.lightblue]) ,
                                    text: Text("Global Spelling Bee",
                                      style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,fontSize: 18,),
                                      textAlign: TextAlign.center,),
                                    ButtonClick: (){
                                      Navigator.of(context).pushNamed('GlobalSpellingstudentsubject');
                                    },)
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      SizedBox(width: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: GradientButtonText(
                                    linearGradient:LinearGradient(
                                        colors: <Color>[GlobalData.lightblue,GlobalData.lightblue]) ,
                                    text: Text("My Results",
                                      style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,fontSize: 18,),
                                      textAlign: TextAlign.center,),
                                    ButtonClick: (){
                                      Navigator.of(context).pushNamed('GlobalResults');
                                    },)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),



                /*Student Leaderboard*/


            Padding(
              padding: const EdgeInsets.only(left:30,top: 20,bottom: 10),
              child: Row(
                children: <Widget>[
                  Text("Leaderboard",style: TextStyle(color: Colors.black,
                      fontSize: 18,fontWeight: FontWeight.bold),),


                ],
              ),
            ),

            Container(height: 200,color: GlobalData.pinkred,
                width: MediaQuery.of(context).size.width,
              child: leader.isEmpty?
              Center
                (child:
              Text("No Student's joined yet",style:
              TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),)

              ) :
              new ListView.builder
                (scrollDirection: Axis.horizontal,
                  itemCount: leader.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return
                      Container(

                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[

                                    GestureDetector(onTap: (){

                                    },
                                      child: Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 20,bottom: 10),
                                        decoration: new BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image:leader[index].userphoto!=""?
                                            NetworkImage(leader[index].userphoto):
                                            globalData.getUserGender(leader[index].gender),
                                          ),

                                        ),),
                                    ),


                                Padding(
                                  padding: const EdgeInsets.only(left:30),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(leader[index].username,style: TextStyle(color: Colors.white,
                                          fontWeight:FontWeight.bold ),),


                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:30,top: 5),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(leader[index].percentage + " %",style: TextStyle(color: Colors.white,
                                          fontWeight:FontWeight.bold ),),


                                    ],
                                  ),
                                ),



                              ], ),

                          ],
                        ),
                      );


                  }
              ),
            ),



          ],
        ),
      ),
    );
  }
}

