import 'package:flutter/material.dart';
import 'package:newpro/MyQuizResult.dart';
import 'package:newpro/Preview_Assignment_QuestionList.dart';
import 'package:newpro/previewAssignment.dart';
import 'package:newpro/quizListStudent.dart';
import 'package:newpro/setSpellingQue.dart';
import 'package:newpro/spelling_log.dart';
import 'package:newpro/studentBySpelling.dart';
import 'package:newpro/studentDetail.dart';
import 'package:newpro/studentQuizLevelList.dart';
import 'package:newpro/studentRegister.dart';
import 'package:newpro/studentSelectcCass.dart';
import 'package:newpro/studentSpellingLevelList.dart';
import 'package:newpro/teacherdetail.dart';
import 'package:newpro/testingarun.dart';
import 'package:newpro/testpurpose/testing.dart';
import 'package:share/share.dart';

import 'GlobalspellingSelectSubject.dart';
import 'ParentLogin.dart';
import 'ParentsStudent.dart';
import 'Questions.dart';
import 'Questions_list_new.dart';

import 'RecentQuestion.dart';
import 'Register.dart';
import 'StudentByQuiz.dart';
import 'TeacherClassList.dart';
import 'adminDashboard.dart';

import 'editQuestion.dart';

import 'QuizlevelsList.dart';
import 'GlobalQuizExercise.dart';


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
import 'Developmentpage.dart';
import 'techerjoinclass.dart';
import 'infoofedusupport.dart';

import 'studentjoinclass.dart';
import 'greenclassroom.dart';
import 'TeacherList.dart';
import 'viewteacherdropdown.dart';
import 'addteacher.dart';
import 'adminprofile.dart';
import 'setquizquestion.dart';
import 'StudentsQuizReport.dart';
import 'assignmentquestionbank.dart';
import 'json.dart';

import 'quizquestion.dart';
import 'selectquizsubject.dart';
import 'selectquizclass.dart';
import 'studentdashboard.dart';
import 'myclassactivities.dart';
import 'level1complete.dart';
import 'alllevelcomplete.dart';
import 'myclassroom.dart';
import 'StudentsQuizReport.dart';
//import 'Questions.dart';
import 'questionsNew.dart';
import 'myquizexercise.dart';
import 'exam.dart';
import 'functionclass.dart';

import 'adminprofile.dart';

import 'TeacherSelectClass.dart';
import 'AdminClassShare.dart';
import 'Announcement.dart';
import 'AssignmentComplete.dart';
import 'SpellingChallange.dart';
import 'ManageAccount.dart';
import 'StudentList.dart';
import 'AboutEdusupport.dart';
import 'adminprofile.dart';
import 'StudentEditProfile.dart';
import 'StudentInviteCode.dart';
import 'TeacherInviteCode.dart';
import 'TeacherList.dart';
import 'GameRoom.dart';
import 'AnswerLog.dart';
import 'SetAssignmentQuestion.dart';    //19-8-19
import 'Selectassignmentclass.dart';    //19-8-19
import 'MyQuizExerciseLog.dart';        //22-8-19
import 'PreviewQuiz.dart';              //23-8-19
      //03-9-19
import 'AssignmentQuestionList.dart';   //04-9-19
import 'EditAssignmentQuestion.dart';   //04-9-19
import 'AssignmentQuestionList.dart';   //05-9-19
import 'AssignmentListStudents.dart';   //05-9-19
import 'AssignmentExam.dart';
import 'ReportDashboard.dart';
import 'StudentAssignmentReport.dart';
//import 'setspellingque.dart';
import 'spellingQue.dart';
import 'trialsubscription.dart';

import 'StudentListByAssignment.dart';
import 'AssignmentAnswerLog.dart';
import 'MyAssignmentExerciseLog.dart';
import 'MyQuizResult.dart';
import 'PublishQuiz.dart';
import 'GlobalspellingBeeResult.dart';
import 'GlobalExercisesDashboard.dart';
import 'GlobalSpellingBee.dart';
import 'tabForQuizAndSpelling.dart';
import 'GlobalQuizExerciseLog.dart';
import 'studentQuizSelectSubject.dart';
import 'myClassResult.dart';
import 'temp.dart';
import 'pojo/pojo_subject.dart';
import 'StudentsQuizLevelsAnswer.dart';
import 'GlobalQuizSelectSubject.dart';
import 'spelling_answer.dart';
import 'selectspellingclass.dart';
import 'selectspellingsubject.dart';
import 'package:newpro/publishSpelling.dart';
import 'spellinglevelcomplete.dart';
import 'spellingQue.dart';
import 'previewspelling.dart';
import 'SpellingQuestionList.dart';
import 'EditSpellingQuestion.dart';
import 'SpellinglevelList.dart';
import 'studentSpellingSelectSubject.dart';
import 'spellingListStudent.dart';
import 'spellinganswerlog.dart';
import 'StudentSpellingResult.dart';
import 'StudentsSpellingReport.dart';
import 'StudentsQuizLevelsAnswer.dart';
import 'StudentSpellingLevelAnswer.dart';
import 'PublishAssignment.dart';
import 'AssignmentComplete.dart';
import 'myAssignmentResult.dart';
import 'ForgetPassword.dart';
import 'NewPassword.dart';
import 'audiorecord.dart';
import 'package:newpro/OTP.dart';
import 'audiorecorder.dart';
import 'doubletap.dart';
import 'StudentClassroom.dart';
import 'OTP.dart';
import 'Set_Exercise.dart';
import 'Assignment_Dashboard.dart';
import 'Quiz_Dashboard.dart';
import 'Spelling_Dashboard.dart';
import 'AllAssignmentLog.dart';
import 'AllAssignmentReport.dart';
import 'AllQuizLog.dart';
import 'AllQuizReport.dart';
import 'AllSpellingLog.dart';
import 'AllSpellingReport.dart';
import 'testingarun.dart';
import 'PreviewQuizlevelList.dart';
import 'PreviewQuestionList.dart';
import 'PreviewSpellingLevelList.dart';
import 'PreviewSpellingQuestinList.dart';

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
        'testing':(context)=>Testing(),
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
        'teacherjoinclass': (context) => techerjoinclass(),
        'teacherdashboard': (context) => teacherdashboard(),
        'manageclassactivities': (context) => questionmenu(),
        'GlobalQuiz': (context) => questionmenuGlobal(),
        'setquizquestions':(context) => setquizquestion(),
        'selectsubject':(context) => selectquizsubject(),
        'selectclass':(context) => quizclass(),
        'dashboard':(context) => teacherdashboard(),
        'setquestion':(context) => quizquestion(),
        'questions':(context)=>Questionsnew(),
        'exam':(context)=>Exam(),
        'Quiz_List_student':(context)=>Quiz_List_student(),
        'Question_List':(context)=>Question_List(),
        'classroomstudent':(context)=>classroomstudent(),
        'myclassroom':(context)=>myclassroom(),
        'studentselectclass':(context)=>studentselectclass(),
        'teacherSelectClass':(context)=>TeacherSelectClass(),
        'returnsignup':(context)=>select(),
        'admindashboard':(context)=>admindashboard(),
        'edit_question':(context)=>Edit_Question(),
        'adminshareclass':(context)=>AdminClassShare(),
        'TeacherClassList':(context)=>TeacherClassList(),
        'Announcements':(context)=>Announcement(),
        'AboutQuizable':(context)=>AboutEdusupport(),
        'ManageAccount':(context)=>ManageAccount(),
        'EditProfile':(context)=>adminprofile(),
        'EditProfileStudent':(context)=>StudentEditProfile(),
        'SetAssignment':(contexontext)=>assignmentquestionbank(),
        'GameRoom':(context)=>GameRoom(),
        'StudentList':(context)=>assignmentquestionbank(),
        //'SetSpelling':(context)=>setspellingque(),
        'TeacherInviteCode':(context)=>TeacherInviteCode(),

        'StudentInviteCode':(ct)=>StudentList(),

        'StudentInviteCode':(context)=>StudentInviteCode(),
        'GameRoom':(context)=>GameRoom(),
        'StudentList':(context)=>StudentList(),
        'TeacherList':(context)=>TeacherList(),
        'AnswerLog':(context)=>AnswerLog(),
        'StudentListByQuiz':(context)=>StudentListByQuiz(),
        'selectassignmentclass':(context)=>Selectassignmentclass(),  //20-8-19
        'SetAssignmentQuestion':(context)=>SetAssignmentQuestion(),  //20-8-19
        'AssignmentQuestionBank':(context)=>assignmentquestionbank(),//20-8-19
        'Recentque':(context)=>RecentQuestion(),                     //21-8-19
        'MyClassActivities':(context)=>myclassactivities(),          //22-8-19
        'MyQuizExerciseLog':(context)=>MyQuizExerciseLog(),          //22-8-19
        'previewQuiz':(context)=>PreviewQuiz(),                      //23-8-19
        'Previewassignment' : (context)=>PreviewAssignment(),        //03-9-19
        'AssignmentQuestionList': (context)=>AssignmentQuestionList(),  //04-9-19
        'EditAssignmentQuestions': (context)=>EditAssignmentQuestions(),//04-9-19
        'AssignmentListStudents': (context)=>AssignmentListStudents(),  //05-9-19
        'assignmentexam': (context)=>AssignmentExam(),
        'ReportDashboard': (context)=>ReportDashboard(),
        'AssignmentReport': (context)=>AssignmentReport(),
      //  'setspellque':(context)=>setspellque(),
        'trialsub':(context)=>trialsubscription(),
        'userdetail':(context)=>userdetail(),
        'StudentListByAssignment':(context)=>StudentListByAssignment(),
        'AssignmentAnswerLog':(context)=>AssignmentAnswerLog(),
        'MyAssignmentExerciseLog':(context)=>MyAssignmentExerciseLog(),
        'level':(context)=>level1(),
        'levelsList':(context)=>LevelsLists(),
        'studentLevelList':(context)=>StudentLevelList(),
        'publishquiz':(context)=>publishquiz(),
        'parentlogin':(context)=>parentlogin(),
        'parentstudent':(context)=>parentstudent(),
        'myquizresult':(context)=>MyQuizResult(),
        'GlobalDashboard':(context)=>GlobalDashboard(),
        'GlobalSpellingstudentsubject':(context)=>GlobalSpellingsselectsubject(),
        'GlobalResults':(context)=>tabforms(),
        'GlobalQuizLog':(context)=>GlobalQuizExerciseLog(),
        'studentselectsubject':(context)=>QuizExamSelectSubject(),
        'studentdetail':(context)=>studentdetail(),
        'myclassresults':(context)=>MyClassResult(),
        'StudentsLevelsAnswer':(context)=>StudentsLevelsAnswer(),
        'globalstudentsubject':(context)=>Globalselectsubject(),
        'developpage':(context)=>develop(),
        'setspellingque':(context)=>setspellingquestion(),
        'spellque':(context)=>setspellque(),
        'spellans':(context)=>spelling_ans(),
        'spellingclass':(context)=>selectspellingclass(),
        'spellingsubject':(context)=>selectspellingsubject(),
        'publishspelling':(context)=>publishspellingbee(),
        'spellinglevel':(context)=>spelllevel(),
        'previewspelling':(context)=>PreviewSpelling(),
        'spellingquestionlist':(context)=>SpellingQuestion_List(),
        'spellinglevelsList':(context)=>SpellingLevelLists(),
        'editspellingquestion':(context)=>EditSpellingQuestions(),
        'spellingexamselectsubject':(context)=>SpellingExamSelectSubject(),
        'Spelling_List_student':(context)=>Spelling_List_student(),
        'studentspellingLevelList':(context)=>StudentsSpellingLevelList(),
        'spellinglog':(context)=>spellinglog(),
        'spellinganswerlog':(context)=>SpellingAnswerLog(),
        'spellingresult':(context)=>StudentSpellingResult(),
        'GlobalSpelling':(context)=>GlobalSpellinglist(),
        'Spellingreports':(context)=>StudentReportSpelling(),
        'StudentListBySpelling':(context)=>StudentListBySpelling(),
        'StudentsspellingLevelsAnswer':(context)=>StudentsspellLevelsAnswer(),
        'publishassignment':(context)=>publishassignments(),
        'assignmentcomplete':(context)=>assignmentcomplete(),
        'myassignmentresult':(context)=>MyAssignmentResult(),
        'forgetpassword':(context)=>Forgetpassword(),
        'newpassword':(context)=>Newpassword(),
        //'audio':(context)=>audio(),
        'otp':(context)=>onetimepassword(),
        'audiorecords':(context)=>audiorecords(),
        'studentsclassroom':(context)=>studentssclassroom(),
        'otp':(context)=>onetimepassword(),
        'setexercise':(context)=>SetExercise(),
        'assignmentboard':(context)=>Assignmentboard(),
        'quizboard':(context)=>Quizboard(),
        'spellingboard':(context)=>Spellingboard(),
        'allassignment':(context)=>AllAssignment(),
        'allassignmentreport':(context)=>AllsAssignmentReport(),
        'allquizlog':(context)=>AllQuiz(),
        'allquizresult':(context)=>AllsQuizReport(),
        'allspellinglog':(context)=>AllSpelling(),
        'allspellingreport':(context)=>AllsSpellingReport(),
        'demo':(context)=>demo(),
        'previewQuizlevellists':(context)=>PreviewLevelsLists(),
        'previewQuizquestionlist':(context)=>PreviewQuizQuestion_List(),
        'previewspellinglevellist':(context)=>PreviewSpellingLevelListss(),
        'previewspellingquestionslist':(context)=>PreviewSpellingQuestionListss(),
        'previewassignmentquestionlist':(context)=>PreviewAssignmentQuestionList()


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

//flutter pub run flutter_launcher_icons:main -f pubspec.yaml