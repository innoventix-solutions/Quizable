import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';
import 'Pojo/pojo_getspelling.dart';

class spellinglog extends StatefulWidget {
  @override
  _spellinglogState createState() => _spellinglogState();
}

class _spellinglogState extends State<spellinglog> {
  List<Pojo_spelling> spellingList = new List();



  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_spelling_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      spellingList = (ParsedJson['spellingdata'] as List).map((data)=>Pojo_spelling.fromJson(data)).toList();

      print(spellingList.length);
      print(jsonEncode(spellingList).toString());
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
              "Quiz Exercises Log",
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
              child:spellingList.isEmpty ? Center(child: Text('No exercises in Quiz Log')) :
              ListView.builder(
                  itemCount: spellingList.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.QuizID=spellingList[i].id;
                        GlobalData.QuizLevels=spellingList[i].no_of_levels;
                        GlobalData.ExamQuiz=spellingList[i].spelling_title;
                        GlobalData.DurationofEachLevel=spellingList[i].dur_each_level;
                        GlobalData.CurrentStudentID=GlobalData.uid;
                        Navigator.of(context).pushNamed('spellinglevelsList');
                      },
                      child: spellingList[i].is_taken==true?
                      QuizExerciseLog(
                          color: GlobalData.pinkred,
                          heading: spellingList[i].spelling_title+" - "+spellingList[i].id,
                          paragraph: spellingList[i].spelling_subject,
                          title: spellingList[i].spelling_title,
                          id: spellingList[i].id,
                          is_taken: spellingList[i].is_taken,
                          //percent: Quizz_List[i].percentage.toString(),
                          progresslabel:spellingList[i].progresslabel,
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
