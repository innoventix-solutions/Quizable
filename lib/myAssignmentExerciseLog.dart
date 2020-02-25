import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';
import 'Pojo/pojo_getassignment.dart';

class MyAssignmentExerciseLog extends StatefulWidget {
  @override
  _MyAssignmentExerciseLogState createState() => _MyAssignmentExerciseLogState();
}

class _MyAssignmentExerciseLogState extends State<MyAssignmentExerciseLog> {
  List<Pojo_getassignment> assignment_list = new List();
  bool isloading = true;

  GetTest() async{
    isloading = true;
    setState(() {

    });
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
    isloading = false;
    setState(() {

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
              "Assignment Exercises Log",
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

       

        body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
            fontSize: 18
        ),)):
        Column(
          children: <Widget>[
            Expanded(
              child:assignment_list.isEmpty ? Center(child: Text('No Assignment Exercises Log')) :
              ListView.builder(
                  itemCount: assignment_list.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.AssignmentID=assignment_list[i].id;
                        //GlobalData.QuizLevels=assignment_list[i].no_of_levels;
                        GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                        //GlobalData.DurationofEachLevel=assignment_list[i].dur_each_level;
                        GlobalData.CurrentStudentID=GlobalData.uid;
                        Navigator.of(context).pushNamed('AssignmentAnswerLog');
                      },
                      child: assignment_list[i].is_taken==true?
                      AssignmentExerciseLog(
                        color: GlobalData.pinkred,
                        heading: assignment_list[i].assignment_title+" - "+assignment_list[i].id,
                        paragraph: assignment_list[i].teacher_instruction,
                        title: assignment_list[i].assignment_title,
                        id: assignment_list[i].id,
                        is_taken: assignment_list[i].is_taken,
                        progresslabel: assignment_list[i].progresslabel,
                      ):SizedBox(),
                    );
                  }),
            ),
          ],
        )


    );
  }
}
