import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'Questions_list.dart';
import 'Quiz_list_student.dart';
import 'globalvar.dart';
import 'manageclassactivitesGlobal.dart';
import 'sec.dart';
import 'card.dart';
import 'teacheroption.dart';
import 'accounttype.dart';
import 'drawer.dart';
import 'login.dart';
import 'splash.dart';
import 'loginandsignup.dart';
import 'select.dart';
import 'addstudent.dart';
import 'classroomstudent.dart';
import 'welcome.dart';
import 'createnewclass.dart';
import 'invitecode.dart';
import 'teacherdashboard.dart';
import 'screen101.dart';
import 'techerjoinclass.dart';
import 'infoofedusupport.dart';
import 'studentreg.dart';
import 'studentjoinclass.dart';
import 'greenclassroom.dart';
import 'viewteacher.dart';
import 'viewteacherdropdown.dart';
import 'addteacher.dart';
import 'adminprofile.dart';
import 'setquizquestion.dart';
import 'manageclassactivites.dart';
import 'assignmentquestionbank.dart';
import 'json.dart';
import 'cal.dart';
import 'quizquestion.dart';
import 'cal3.dart';
import 'selectquizsubject.dart';
import 'selectquizclass.dart';
import 'studentdashboard.dart';
import 'myclassactivities.dart';
import 'level1complete.dart';
import 'alllevelcomplete.dart';
import 'myclassroom.dart';
import 'manageclassactivites.dart';
//import 'Questions.dart';
import 'Questions_new.dart';
import 'myquizexercise.dart';
import 'exam.dart';
import 'functionclass.dart';
import 'admindashboard.dart';
import 'adminprofile.dart';
import 'studentselectclass.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'yu'),
      home:splash(),
      debugShowCheckedModeBanner: false,
      routes: {
       // 'signup_teacher': (context) => sec(),
        'login': (context) => login(),
        'teacher': (context) => infoofedusupport(),
        'loging_selection': (context) => loginandsignup(),
        'signup_selection': (context) => select(),
        'signup_teacher': (context) => teacheroption(),
        'accouttypeselect': (context) => accounttype(),
        'signup': (context)=> sec(),
        'welcome': (context)=> welcome(),
        'createnewclass': (context)=> createnewclass(),
        'invitecode': (context)=> invitecode(),
        'admindashboard': (context)=> admindashboard(),
        'techerjoinclass': (context) => techerjoinclass(),
        'studentjoinclass': (context) => studentjoin(),
        'register': (context) => sec(),
        'signup_student': (context) => studentreg(),
        'studentjoin': (context) => studentjoin(),
        'studentdashboard': (context) => studentdashboard(),
        'studentjoinclass ': (context) => studentjoin(),
        'adminteacherjoinclass': (context) => techerjoinclass(),
        'teacherjoinclass': (context) => teacherdashboard(),
        'teacherdashboard': (context) => teacherdashboard(),
        'manageclassactivities': (context) => questionmenu(),
        'GlobalQuiz': (context) => questionmenuGlobal(),
        'setquizquestions':(context) => setquizquestion(),
        'selectsubject':(context) => selectquizsubject(),
        'selectclass':(context) => quizclass(),
        'dashboard':(context) => teacherdashboard(),
        'setquestion':(context) => quizquestion(),
        'questions':(context)=>Questions(),
        'exam':(context)=>Exam(),
        'Quiz_List_student':(context)=>Quiz_List_student(),
        'Question_List':(context)=>Question_List(),
        'classroomstudent':(context)=>classroomstudent(),
        'myclassroom':(context)=>myclassroom(),
        'studentselectclass':(context)=>studentselectclass(),
        'returnsignup':(context)=>select(),
        'admindashboard':(context)=>admindashboard(),
      },
    );
  }
}

class Myapplication extends StatefulWidget {
  @override
  _MyapplicationState createState() => _MyapplicationState();
}

class _MyapplicationState extends State<Myapplication> {
  var bluecolor=Color(0xff575DFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            RaisedButton(
                color: Colors.white,
                padding: EdgeInsets.only(left: 80, right: 80),
                child: new Text(
                  "I'm a Teacher",
                  style: TextStyle(color: bluecolor),
                ),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            RaisedButton(
                color: bluecolor,
                padding: EdgeInsets.only(left: 80, right: 80),
                child: new Text(
                  "I'm a Student",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ],
        )),
      ),
    );
  }
}
