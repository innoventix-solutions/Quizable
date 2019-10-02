import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class level1 extends StatefulWidget {
  @override
  _level1State createState() => _level1State();
}

class _level1State extends State<level1> {

  List<Pojo_quizzes> Quizz_List = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_quizzes.php",
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




  bool QuizComplete()
  {
    if(((GlobalData.QuestionNumber /
        int.parse(
            GlobalData.NosofQuesPerLevel))
        .floor())>=int.parse(GlobalData.QuizLevels))
      {
        return true;
      }else
        {
          return false;
        }
  }
  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(
            child: new Text(
              "Confirmation",
              style: TextStyle(
                  color: GlobalData.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          content: new Text(
            "You have completed all the \nquestions levels for this Quiz \nexercise.\nDo you want to preview \nquestions before publishiing?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: GlobalData.gray,
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: RaisedButton(
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
                onPressed: () {


                  if(Quizz_List.isNotEmpty) {
                    GlobalData.EditQuiz = false;
                    GlobalData.QuizID = Quizz_List[0].id;
                    GlobalData.ExamQuiz = Quizz_List[0].quiz_title;
                    GlobalData.DurationofEachLevel =
                        Quizz_List[0].dur_each_level;
                    GlobalData.QuizLevels = Quizz_List[0].no_of_levels;
                    //  Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');
                    Navigator.of(context).pushReplacementNamed('levelsList');
                  }else{
                    Show_toast_Now("Please Try after few Seconds", Colors.red);
                  }
                },
                child: Text(
                  'Preview',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: RaisedButton(
                color: Colors.red,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('publishquiz');

                },
                child: Text(
                  'Publish',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            /*FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30
                    ),
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('Question_List');
                        },child: RaisedButton(color: GlobalData.blue,child: new Text("Preview"))),


                  ),
                  GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pushReplacementNamed('Recentque');
                        ClearRegisterData();
                        setState(() {

                        });
                      },child: new Text("Publish")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),*/
          ],
        );
      },
    );
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
            "Set Quiz Questions",
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
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: levelcomplete(
                          color: GlobalData.blue,
                          heading: QuizComplete() ?
                              "Quiz Completed":

                          "Level " +
                              ((GlobalData.QuestionNumber /
                                          int.parse(
                                              GlobalData.NosofQuesPerLevel))
                                      .floor())
                                  .toString() +
                              " Completed",
                          paragraph:QuizComplete() ?
                              "Congratulations!...\n You have Completed all Levels of Quiz.":
                              "Congratulations! You have completed the questions for Level " +
                                  ((GlobalData.QuestionNumber /
                                              int.parse(
                                                  GlobalData.NosofQuesPerLevel))
                                          .floor())
                                      .toString() +
                                  " Quiz. Use the Next button to continue to set questions for Level " +
                                  ((GlobalData.QuestionNumber /
                                                  int.parse(GlobalData
                                                      .NosofQuesPerLevel))
                                              .floor() +
                                          1)
                                      .toString() +
                                  " Quiz.",
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GlobalData.QuestionNumber >=
                                      (int.parse(GlobalData.NosofQuesPerLevel) *
                                          int.parse(GlobalData.QuizLevels))
                                  ? Expanded(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25, bottom: 40),
                                          child: GradientButtonText(
                                            ButtonClick: () {
                                              showDialog1(context);
                                            },
                                            linearGradient: LinearGradient(
                                                colors: <Color>[
                                                  GlobalData.purple,
                                                  GlobalData.pink
                                                ]),
                                            text: Text(
                                              "Finish",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25, bottom: 40),
                                          child: GradientButtonText(
                                            ButtonClick: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      'questions');
                                            },
                                            linearGradient: LinearGradient(
                                                colors: <Color>[
                                                  GlobalData.purple,
                                                  GlobalData.pink
                                                ]),
                                            text: Text(
                                              "Next Level",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
