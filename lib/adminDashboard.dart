import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';


class admindashboard extends StatefulWidget {
  @override
  _admindashboardState createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {


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
                        right: 30
                    ),
                    child: GestureDetector(
                        onTap: () async {
                          LogoutFunction(context);
                         // Navigator.of(context).pushNamed('dashboard');
                        },child: new Text("Ok")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('admindashboard');
                      },child: new Text("Cancel")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Admin Dashboard",
            style: TextStyle(fontSize: 20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [GlobalData.darkblue, GlobalData.darkpurple],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),


      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: bg12,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                      radius: 35.0,
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(GlobalData.Username,style:
                  TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(GlobalData.class_name,style:
                  TextStyle(fontSize: 15,color: Colors.white),),
                ),
              ],
            ),
          ),



          Center(
            child: Container(

              child: Column(

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      <Widget>[


                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            child: Container(height: 100,width: 150,


                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:GlobalData.bluecard,),


                                child:Center(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.settings,size: 50,color: Colors.white,),
                                      Text("Manage My",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                      Text("Classrooms",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ),onTap: (){
                              Navigator.of(context).pushReplacementNamed('StudentList');
                              },
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: GestureDetector(
                            child: Container(height: 100,width: 150,


                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:GlobalData.pinkcard,),


                                child:Center(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.crop_square,size: 60,color: Colors.white,),
                                      Text("Teacher's Board",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ),onTap: (){
                            Navigator.of(context).pushReplacementNamed('TeacherList');
                          },
                          ),

                        )



                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 15),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(height: 100,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:GlobalData.greencard,),





                            child:Center(
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.local_activity,size: 50,color: Colors.white,),
                                  Text("Manage Class",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                  Text('Activities',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),


                          ),onTap: (){
                          Navigator.of(context)
                              .pushNamed('manageclassactivities');
                        },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Container(height: 100,width: 150,


                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:GlobalData.orange,),


                              child:Center(
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.speaker_notes,size: 50,color: Colors.white,),
                                    Text("Report",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ),
          ),













          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
                child: Text("Switch Classroom", style: TextStyle(decoration: TextDecoration.underline,
                    color: GlobalData.lightblue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('teacherSelectClass');
                }
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
              padding: const EdgeInsets.only(bottom: 40,top: 25),
              child: DrawerHeader(child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
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
                                fontSize: 20),),
                        ),


                          Text(GlobalData.class_name,
                            style: TextStyle(color: Colors.white,fontSize: 15),)
                        ],),
                    )
                  ],),
              ),),
            ),decoration: bg12,),

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
                  .pushNamed('admindashboard');
            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:30),
                child: Row(children: <Widget>[Icon(Icons.share,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Share Class Code',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('TeacherClassList');
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
              ),onTap: (){ Navigator.of(context)
                .pushNamed('AboutEduSupport');
              },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.dehaze,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Switch Classroom',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){Navigator.of(context).pushReplacementNamed('teacherSelectClass');
            }
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.person,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Edit Profile',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('EditProfile');
            },
            ),

           /* Padding(
              padding: const EdgeInsets.only(left: 45,top:20),
              child: Row(children: <Widget>[Icon(Icons.settings,color: lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Manage Account',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                )],),
            ),*/

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.notifications,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Announcements',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('Announcements');
            },
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45,top:20),
              child: Row(children: <Widget>[Icon(Icons.share,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(onTap: (){

                    Share.share(GlobalData.Username +" is Sharing App - "+ "https://play.google.com/store/apps/details?id=com.innoventixsolutions.quizable");
                  },
                    child: Text('Share App',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),

                )],),
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.power_settings_new,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Log out',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: ()
           {
             showDialog1(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
