import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class questionmenuGlobal extends StatefulWidget {
  @override
  _questionmenuGlobalState createState() => _questionmenuGlobalState();
}

class _questionmenuGlobalState extends State<questionmenuGlobal> {

  List<Pojo_quizzes> Quizz_List = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_global_quizzes.php",
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
    GetTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Global Quiz",
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
                child: ListView.builder(
                    itemCount: Quizz_List.length,
                    itemBuilder: (c,i){
                  return  GestureDetector(
                    onTap: (){
                      GlobalData.QuizID=Quizz_List[i].id;
                      GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                      Navigator.of(context).pushNamed('Question_List');
                    },
                    child: classactivitys(
                      color: GlobalData.pinkred,
                      heading: Quizz_List[i].quiz_title+" - "+Quizz_List[i].id,
                      paragraph: Quizz_List[i].quiz_subject,
                    ),
                  );
                }),
              ),
            ],
          )


    );
  }
}
