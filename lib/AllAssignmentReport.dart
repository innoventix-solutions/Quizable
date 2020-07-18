import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_questions.dart';
import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_getassignment.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class AllsAssignmentReport extends StatefulWidget {
  @override
  _AllsAssignmentReportState createState() => _AllsAssignmentReportState();
}

class _AllsAssignmentReportState extends State<AllsAssignmentReport> {

  List<Pojo_getassignment> assignment_list = new List();

  List<Pojo_questions> Quetions = new List();

  bool isloading = true;


  GetTest() async{

    isloading = true;
    setState(() {

    });

    await http.post(GlobalData.applink+"get_assignments_by_class.php",
        body: {
          "user_id":GlobalData.uid,
          "Class_id":GlobalData.classid,
          "publish_onhold_both":""
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if(ParsedJson['assignmentdata']== false) {

      }
      else{
        assignment_list = (ParsedJson['assignmentdata'] as List).map((data) =>
            Pojo_getassignment.fromJson(data)).toList();
      }
      print(assignment_list.length);
      setState(() {

      });

      isloading = false;
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
    return WillPopScope(onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(onTap:(){
              Navigator.of(context)
                  .pushNamed('dashboard');
            },child: Icon(Icons.exit_to_app)),
            automaticallyImplyLeading: false,

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

          body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
              fontSize: 18
          ),)):
          Column(
            children: <Widget>[
              Expanded(
                child: assignment_list.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
                ListView.builder(
                    itemCount: assignment_list.length,
                    itemBuilder: (c,i){
                      return GestureDetector(
                        onTap: (){
                          isloading=true;
                          GlobalData.AssignmentID=assignment_list[i].id;

                          GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                          GlobalData.NosofQuesassignment= assignment_list[i].total_que;
                          GlobalData.essayteacherid=assignment_list[i].techer_id;
                          print(GlobalData.essayteacherid);
                          //GlobalData.questionid = Quetions[i].id;
                          Navigator.of(context).pushNamed('StudentListByAssignment');
                          isloading=false;
                        },
                        child: StudentAssignmentActivityReport(
                          color: GlobalData.pinkred,
                          heading: assignment_list[i].assignment_title,
                          paragraph: assignment_list[i].teacher_instruction,
                          id:assignment_list[i].id ,
                          title: assignment_list[i].publish_date,
                          is_taken: assignment_list[i].is_taken,


                        ),
                      );
                    }),
              ),
            ],
          )
      ),
    );
  }
}
