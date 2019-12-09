import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_questions.dart';
import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_getassignment.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class AssignmentReport extends StatefulWidget {
  @override
  _AssignmentReportState createState() => _AssignmentReportState();
}

class _AssignmentReportState extends State<AssignmentReport> {

  List<Pojo_getassignment> assignment_list = new List();

    List<Pojo_questions> Quetions = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_assignments_by_class.php",
        body: {
          "user_id":GlobalData.uid,
          "Class_id":GlobalData.classid,
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      assignment_list = (ParsedJson['assignmentdata'] as List).map((data)=>Pojo_getassignment.fromJson(data)).toList();

      print(assignment_list.length);
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
              "Assignment Report",
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

        /*drawer:
      drawerquiz(),*/

        body:
        Column(
          children: <Widget>[
            Expanded(
              child: assignment_list.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: assignment_list.length,
                  itemBuilder: (c,i){
                    return GestureDetector(
                      onTap: (){
                        GlobalData.AssignmentID=assignment_list[i].id;

                        GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                        GlobalData.NosofQuesassignment= assignment_list[i].total_que;

                        //GlobalData.questionid = Quetions[i].id;
                        Navigator.of(context).pushNamed('StudentListByAssignment');
                      },
                      child: StudentAssignmentActivityReport(
                        color: GlobalData.pinkred,
                        heading: assignment_list[i].assignment_title,
                        paragraph: assignment_list[i].teacher_instruction,
                        id:assignment_list[i].id ,
                        title: assignment_list[i].assignment_title,
                        is_taken: assignment_list[i].is_taken,


                      ),
                    );
                  }),
            ),
          ],
        )
    );
  }
}
