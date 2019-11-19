import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';

class GlobalQuizExerciseLog extends StatefulWidget {
  @override
  _GlobalQuizExerciseLogState createState() => _GlobalQuizExerciseLogState();
}

class _GlobalQuizExerciseLogState extends State<GlobalQuizExerciseLog> {
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
      print(jsonEncode(Quizz_List).toString());
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
              "Global Quiz Exercises Log",
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
              child:Quizz_List.isEmpty ? Center(child: Text('No Global Quiz Exercises Log')) :
              ListView.builder(
                  itemCount: Quizz_List.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.QuizID=Quizz_List[i].id;
                        GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                        GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                        GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level;
                        GlobalData.CurrentStudentID=GlobalData.uid;

                        print(GlobalData.ExamQuiz);
                        Navigator.of(context).pushNamed('levelsList');



                      },
                      child: Quizz_List[i].is_taken==true?
                      QuizExerciseLog(
                          color: GlobalData.pinkred,
                          heading: Quizz_List[i].quiz_title+" - "+Quizz_List[i].id,
                          paragraph: Quizz_List[i].quiz_subject,
                          title: Quizz_List[i].quiz_title,
                          id: Quizz_List[i].id,
                          is_taken: Quizz_List[i].is_taken,
                          //percent: Quizz_List[i].percentage.toString(),
                          progresslabel:Quizz_List[i].progresslabel
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
