import 'dart:convert';
import 'package:flutter/material.dart';
//import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_getassignment.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';

class AssignmentListStudents extends StatefulWidget {
  @override
  _AssignmentListStudentsState createState() => _AssignmentListStudentsState();
}

class _AssignmentListStudentsState extends State<AssignmentListStudents> {
  List<Pojo_getassignment> assignment_list = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_assignments_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      assignment_list = (ParsedJson['assignmentdata'] as List).map((data)=>Pojo_getassignment.fromJson(data)).toList();

      print(assignment_list.length);
      print(jsonEncode(assignment_list).toString());
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "My Assignment Exercises",
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

       /* drawer: Drawer(
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

                            Container(
                              child: Text(GlobalData.activeclass!=null?GlobalData.activeclass.classname:"No Class Selected",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 12),),
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
                  child: Row(children: <Widget>[Icon(Icons.assignment,color: GlobalData.lightblue,),
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
                ),onTap: (){
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
                ),onTap: (){},
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
                ),onTap: ()async{
                LogoutFunction(context);
              },

              ),





            ],
          ),
        ),*/

        body:
        Column(
          children: <Widget>[
            Expanded(
              child:assignment_list.isEmpty ? Center(child: Text('No Assignment Exercises published yet')) :  //22-8-19 a
              ListView.builder(
                  itemCount: assignment_list.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                        onTap: (){
                          GlobalData.AssignmentID=assignment_list[i].id;
                          //GlobalData.QuizLevels=assignment_list[i].no_of_levels;
                          GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                          //GlobalData.DurationofEachLevel=assignment_list[i].dur_each_level;
                          Navigator.of(context).pushNamed(assignment_list[i].is_taken==true?'AnswerLog':'assignmentexam');
                        },
                        child: //assignment_list[i].is_taken==false?       //22-8-19 a
                        classactivitys(
                          color: GlobalData.pinkred,
                          heading: assignment_list[i].assignment_title+" - "+assignment_list[i].id,
                          paragraph: assignment_list[i].teacher_instruction,
                          title: assignment_list[i].assignment_title,
                          id: assignment_list[i].id,
                          is_taken: assignment_list[i].is_taken,
                        ),//:SizedBox()
                    );
                  }),
            ),
          ],
        )


    );
  }
}
