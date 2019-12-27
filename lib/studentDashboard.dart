import 'dart:convert';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'Pojo/pojo_leaderboard.dart';
import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_getassignment.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Pojo/pojo_getspelling.dart';




class studentdashboard extends StatefulWidget {
  @override
  _studentdashboardState createState() => _studentdashboardState();
}

class _studentdashboardState extends State<studentdashboard> {


  int _current = 0;
  GlobalData globalData = new GlobalData();

  //final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  List<Pojo_quizzes> Quizz_List = new List();
  List<Pojo_getassignment> assignment_list = new List();
  List<Pojo_spelling> spellinglist = new List();

  List<leaderboard> leader = new List();


  leaderboards()async{
    await http.post("http://edusupportapp.com/api/get_class_leaderboard.php",
        body: {
          "clsss_id":GlobalData.classid,

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


  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_quizzes_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      Quizz_List = (ParsedJson['quizdata'] as List).map((data)=>Pojo_quizzes.fromJson(data)).toList();

      print(Quizz_List.length);
      setState(() {

      });
    });
  }


  GetAssignment() async{

    await http.post("http://edusupportapp.com/api/get_user_assignments_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      if(ParsedJson['assignmentdata'].toString()!="false") {
        assignment_list = (ParsedJson['assignmentdata'] as List).map((data) =>
            Pojo_getassignment.fromJson(data)).toList();

        print(assignment_list.length);
        setState(() {

        });
      }
    });
  }

  GetSpelling()async{


    await http.post("http://edusupportapp.com/api/get_user_spelling_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      if(ParsedJson['spellingdata'].toString()!="false") {
        spellinglist = (ParsedJson['spellingdata'] as List).map((data) =>
            Pojo_spelling.fromJson(data)).toList();

        print(spellinglist.length);
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
                //Navigator.of(context).pop();
              },
            )

          ],
        );
      },
    );
  }



  void globalalert() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Information",style: TextStyle(color: Colors.red),),
          content: new Text("This is a paid feature an annual fee of N500 to access all Global exercises.\nCan attend one level of global"
              " excercise.",textAlign: TextAlign.center,),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
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
        timeInSecForIos:60,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTest();
    GetAssignment();
    GetSpelling();
    leaderboards();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Student Dashboard",
            style: TextStyle(fontSize: 20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [GlobalData.darkblue, GlobalData.darkpurple],
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
              padding: const EdgeInsets.only(bottom: 40,top: 25),
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
                                  fontSize: 14),),
                          ),

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
                  .pushNamed('studentdashboard');
            },
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.info,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('About eduSupport',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),onTap: (){
              Navigator.of(context)
                  .pushNamed('AboutEduSupport');
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


            GestureDetector(
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
            ),
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
              Share.share(GlobalData.Username +" is Sharing App - "+ "https://play.google.com/store/apps/details?id=com.innoventixsolutions.edusupport&hl=en");

            },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
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
                    padding: const EdgeInsets.only(top: 15),
                    child: Stack(children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          backgroundImage:GlobalData.Userphoto!=""?
                        NetworkImage(GlobalData.Userphoto):globalData.getgender(),
                          radius: 35.0,
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
                    padding: const EdgeInsets.only(bottom: 5,top: 10),
                    child: Text(GlobalData.Username,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                          fontSize: 20),),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Text(GlobalData.activeclass!=null?GlobalData.activeclass.classname:"No Class Selected",style:
                    TextStyle(fontSize: 20,color:GlobalData.gray,fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).pushReplacementNamed('studentselectclass');
                    },
                      child: Text('Switch Classroom',style:
                      TextStyle(fontSize: 15,fontWeight:FontWeight.bold,
                          color: GlobalData.lightblue,decoration: TextDecoration.underline),),
                    ),
                  ),

                 /* Padding(
                    padding: const EdgeInsets.only(top: 10,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("Global Quiz",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                                Navigator.of(context).pushNamed('GlobalQuiz');

                              },)),
                      ],
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[

                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("View my Class Activities",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                                Navigator.of(context).pushNamed('MyClassActivities');

                              },)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(

                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                              text: Text("Enter my Classroom",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                                Navigator.of(context).pushNamed('StudentList');
                                },)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.pinkred,GlobalData.yellow]) ,
                              text: Text("See my Results",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                                Navigator.of(context).pushNamed('myclassresults');
                               },)
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),



            CarouselSlider(autoPlay: true,height: 220.0,
              //aspectRatio: 21/9,
              viewportFraction: 0.9,
              initialPage: 0,
              onPageChanged: (index){
              setState(() {
                _current=index;
              });
              },
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              items: <Widget>[
                Container(height: 600,
                  width: MediaQuery.of(context).size.width,

                  decoration: bg12,

                  child: Column(

                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(left: 20,right:20,top:15),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:LinearGradient(begin:Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[GlobalData.yellow,GlobalData.pinkred]) ,
                                text: Text("Quiz",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 15,),
                                  textAlign: TextAlign.center,),
                                ButtonClick: (){
                                  if(Quizz_List.isEmpty){
                                    CustomShowDialog(context,title: "Unavailable",msg:
                                    "No Quiz Exercise published yet");
                                  }
                                  else{
                                    GlobalData.QuizID=Quizz_List[0].id;
                                    GlobalData.ExamQuiz=Quizz_List[0].quiz_title;
                                    GlobalData.DurationofEachLevel=Quizz_List[0].dur_each_level;
                                    GlobalData.QuizLevels=Quizz_List[0].no_of_levels;
                                    //studentLevelList
                                    // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                                    Navigator.of(context).pushNamed('studentLevelList');
                                  }
                                },),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20,top:4),
                        child: Row(
                          children: <Widget>[
                            Text(Quizz_List.isNotEmpty?Quizz_List[0].quiz_title:"No Quiz Available",style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(Quizz_List.isNotEmpty?Quizz_List[0].quiz_subject:"",style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(Quizz_List.isNotEmpty?Quizz_List[0].classes:"",style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:15,left: 20,right: 20,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:LinearGradient(begin:Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[GlobalData.pinkred,GlobalData.lightpink]) ,
                                text: Text("Closing",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 15,),
                                  textAlign: TextAlign.center,),
                                ButtonClick: (){
                                },),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 20),
                              child: Text(Quizz_List.isNotEmpty?Quizz_List[0].closing_date.substring(0,19):"",style:TextStyle(
                                  fontSize: 15,color: GlobalData.white
                              ) ,),
                            )
                          ],
                        ),
                      ),


                    ],
                  ),

                ),


                Container(height: 600,
                  width: MediaQuery.of(context).size.width,

                  decoration: bg12,

                  child: Column(

                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(top:15,left: 20,right:20,bottom: 5),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 150,
                              child: GradientButtonText(
                                linearGradient:LinearGradient(begin:Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[GlobalData.yellow,GlobalData.pinkred]) ,
                                text: Text("Assignment",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 15,),
                                  textAlign: TextAlign.center,),
                                ButtonClick: (){
                                  if(assignment_list.isEmpty){
                                    CustomShowDialog(context,title: "Unavailable",msg:
                                    "No Assignment Exercise published yet");
                                  }
                                  else{
                                    GlobalData.AssignmentID.toString();
                                    GlobalData.NosofQuesassignment.toString();
                                    GlobalData.ExamQuiz.toString();
                                    GlobalData.teacherobjective.toString();
                                    GlobalData.teacherinstruction.toString();
                                    // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                                    Navigator.of(context).pushNamed('AssignmentListStudents');
                                  }
                                },),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 05,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(assignment_list.isNotEmpty?assignment_list[0].assignment_title:"No Assignment Available",style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(assignment_list.isNotEmpty?assignment_list[0].teacher_instruction:"",style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(assignment_list.isNotEmpty?assignment_list[0].classes:"",style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:10,left: 20,right: 20),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:LinearGradient(begin:Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[GlobalData.pinkred,GlobalData.lightpink]) ,
                                text: Text("Closing",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 15,),
                                  textAlign: TextAlign.center,),
                                ButtonClick: (){
                                },),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(assignment_list.isNotEmpty?assignment_list[0].closing_date.substring(0,19):"",style:TextStyle(
                                  fontSize: 15,color: GlobalData.white
                              ) ,),
                            )
                          ],
                        ),
                      ),


                    ],
                  ),

                ),



                Container(height: 600,
                  width: MediaQuery.of(context).size.width,

                  decoration: bg12,

                  child: Column(

                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(left: 20,right:20,bottom: 5,top: 15),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:LinearGradient(begin:Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[GlobalData.yellow,GlobalData.pinkred]) ,
                                text: Text("Spelling",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 15,),
                                  textAlign: TextAlign.center,),
                                ButtonClick: (){
                                  if(spellinglist.isEmpty){
                                    CustomShowDialog(context,title: "Unavailable",msg:
                                    "No Spelling Exercise published yet");
                                  }
                                  else{
                                    GlobalData.isGlobal=false;
                                    GlobalData.spellingid=spellinglist[0].id;
                                    GlobalData.spellLevels=spellinglist[0].no_of_levels;
                                    GlobalData.ExamQuiz=spellinglist[0].spelling_title;
                                    GlobalData.spellDurationofEachLevel=spellinglist[0].dur_each_level;
                                    GlobalData.spellNosofQuesPerLevel=spellinglist[0].que_each_level;
                                    // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                                    Navigator.of(context).pushNamed('studentspellingLevelList');
                                  }
                                },),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(spellinglist.isNotEmpty?spellinglist[0].spelling_title:"No Spelling Available",style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(spellinglist.isNotEmpty?spellinglist[0].spelling_subject:"",style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:5,left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(spellinglist.isNotEmpty?spellinglist[0].classes:"",style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top:10),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:LinearGradient(begin:Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[GlobalData.pinkred,GlobalData.lightpink]) ,
                                text: Text("Closing",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 15,),
                                  textAlign: TextAlign.center,),
                                ButtonClick: (){
                                },),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(spellinglist.isNotEmpty?spellinglist[0].closing_date.substring(0,19):"",style:TextStyle(
                                  fontSize: 15,color: GlobalData.white
                              ) ,),
                            )
                          ],
                        ),
                      ),


                    ],
                  ),

                ),
            ],

            ),


            Padding(
              padding: const EdgeInsets.only(left:30,top: 20,bottom: 10),
              child: Row(
                children: <Widget>[
                  Text("Classroom Leaderboard",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),


                ],
              ),
            ),

            Container(height: 200,
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
                                      Text(leader[index].username),


                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:30,top: 5),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(leader[index].percentage + " %"),


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

            GestureDetector(
              onTap: (){Navigator.of(context)
                  .pushNamed('GlobalDashboard');
              globalalert();},
              child: Container(padding: EdgeInsets.only(top: 0,bottom: 20),
                  child: Text('Global Quiz & Spelling Bee',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),)),
            ),

          ],
        ),
      ),
    );
  }
}
