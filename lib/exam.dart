import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_matchs.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_questions.dart';

class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {

  List<Pojo_questions> Quetions = new List();
  int i=0;
  List<Pojo_Matchs> matchs = new List();


  ScrollController controller = new ScrollController();

  GetQuestions() async{

    print(GlobalData.QuizID);
    http.post("http://edusupportapp.com/api/get_quiz_questions.php",body: {
      "QuizId":GlobalData.QuizID
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Quetions = (ParsedJson['quizquestionsdata'] as List).map((data)=>Pojo_questions.fromJson(data)).toList();
      setState(() {

      });
    });






  }


  Widget AnswerNow(String type,var Data)
  {
    switch (type)
    {
          case "Match Type":

            /*List<Pojo_Matchs> matchs = new List();
            matchs = (Quetions[i].anwer_options as List).map((data)=>Pojo_Matchs.fromJson((data))).toList();*/

            return null;
            default:
    }
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetQuestions();
  }





  @override
  Widget build(BuildContext context) {


    List<String> Value1 = List();
    List<String> Value2 = List();



    for(var item in Quetions[0].anwer_options){
      Value1.add(item.val1);
      Value2.add(item.val2);
    }


    print(Value2.length);
    print(Value1.length);

    return Scaffold(
      body: ListView.builder(itemBuilder: (c,i){
        return Card(
          child: Column(
            children: <Widget>[
              Text(i.toString()),

              Text(Quetions[i].answer_type.toString()),
              Text(Quetions[i].question.toString()),
              Text(Quetions[i].anwer_options.length.toString())
            ],
          ),
        );
      })




      /*SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        controller:controller ,itemCount: Value1.length,itemBuilder: (c,i){
                      return ListTile(title: Text(Value1[i]),leading: Icon(Icons.menu),);
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReorderableListView(


                      children:  Value2.map((item) => ListTile(key: Key("${item}"), title: Text("${item}"), trailing: Icon(Icons.menu),)).toList(), onReorder: (int start, int current) {
                      // dragging from top to bottom
                      if (start < current) {
                        int end = current - 1;
                        String startItem = Value2[start];
                        int i = 0;
                        int local = start;
                        do {
                          Value2[local] = Value2[++local];
                          i++;
                        } while (i < end - start);
                        Value2[end] = startItem;
                      }
                      // dragging from bottom to top
                      else if (start > current) {
                        String startItem = Value2[start];
                        for (int i = start; i > current; i--) {
                          Value2[i] = Value2[i - 1];
                        }
                        Value2[current] = startItem;
                      }
                      setState(() {});
                    },),
                  ),
                ],
              ),
            ),
          ],
        ),
      )*/

    );
  }
}
