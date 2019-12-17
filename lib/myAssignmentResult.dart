import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';
import 'Pojo/pojo_getassignment.dart';

class MyAssignmentResult extends StatefulWidget {
  @override
  _MyAssignmentResultState createState() => _MyAssignmentResultState();
}

class _MyAssignmentResultState extends State<MyAssignmentResult> {
  List<Pojo_getassignment> assignment_list = new List();



  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_assignments_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      assignment_list = (ParsedJson['assignmentdata'] as List).map((data)=>Pojo_getassignment.fromJson(data)).toList();



      assignment_list.sort((a, b) {
        return b.takendate.toLowerCase().compareTo(a.takendate.toLowerCase());
      });


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
              "My Assignment Result",
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



        body:
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

                        GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                        GlobalData.NosofQuesassignment=assignment_list[i].total_que;
                        GlobalData.CurrentStudentID=GlobalData.uid;
                        Navigator.of(context).pushNamed('AssignmentAnswerLog'); },
                      child: assignment_list[i].is_taken==true?
                      AssignmentResult(
                        color: GlobalData.pinkred,
                        heading: assignment_list[i].assignment_title+" - "+assignment_list[i].id,
                        paragraph: assignment_list[i].teacher_instruction,
                        title: assignment_list[i].takendate.toString(),
                        id: assignment_list[i].id,
                        is_taken: assignment_list[i].is_taken,
                        percent: assignment_list[i].percentage.toString(),
                        progresslabel:assignment_list[i].progresslabel,
                        timetaken: assignment_list[i].totaltime.toString(),
                      ):SizedBox(),
                    );
                  }
              ),
            ),
          ],
        )


    );
  }
}
