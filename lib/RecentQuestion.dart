import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_getassignment.dart';



class RecentQuestion extends StatefulWidget {
  @override
  _RecentQuestionState createState() => _RecentQuestionState();
}

class _RecentQuestionState extends State<RecentQuestion> {

  List<Pojo_quizzes> Quizz_List = new List();
  List<Pojo_getassignment>  assignment_list = new List();

  GetAssignment() async{

    await http.post("http://edusupportapp.com/api/get_assignments.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      assignment_list = (ParsedJson['assignmentsdata'] as List).map((data)=>Pojo_getassignment.fromJson(data)).toList();

      print(assignment_list.length);
      setState(() {

      });
    });
  }



  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_quizzes.php",
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAssignment();
    GetTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Recent Questions",
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

        drawer:
        drawerquiz(),

        body:
        Column(
          children: <Widget>[
            Expanded(
              child: assignment_list.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: 1,
                  itemBuilder: (c,i){
                    return GestureDetector(
                      onTap: (){

                      },
                      child: recentquestions(
                        color: GlobalData.pinkred,
                        heading: assignment_list[i].assignment_title,
                        paragraph: assignment_list[i].teacher_instruction,
                        id:assignment_list[i].id ,
                        title: assignment_list[i].assignment_title,

                      ),
                    );
                  }),
            ),
            Expanded(
              child:Quizz_List.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: 1,
                  itemBuilder: (c,i){
                    return GestureDetector(
                      onTap: (){
                         },
                      child: recentquestions(
                        color: GlobalData.pinkred,
                        heading: Quizz_List[i].quiz_title,
                        paragraph: Quizz_List[i].quiz_subject,
                        id:Quizz_List[i].id ,
                        title: Quizz_List[i].quiz_title,

                      ),
                    );
                  }),
            ),
            Expanded(
              child:Quizz_List.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: 1,
                  itemBuilder: (c,i){
                    return GestureDetector(
                      onTap: (){
                       },
                      child: recentquestions(
                        color: GlobalData.pinkred,
                        heading: Quizz_List[i].quiz_title,
                        paragraph: Quizz_List[i].quiz_subject,
                        id:Quizz_List[i].id ,
                        title: Quizz_List[i].quiz_title,

                      ),
                    );
                  }),
            ),
          ],
        )
    );
  }
}
