import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newpro/Pojo/pojo_quizzes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentSelectSubject extends StatefulWidget {
  @override
  _StudentSelectSubjectState createState() => _StudentSelectSubjectState();
}

class _StudentSelectSubjectState extends State<StudentSelectSubject> {

  List<Pojo_quizzes> Quizz_List = new List();



  List<String> Textvalues = ["Religion","Arts & Literature","Current Affairs","Entertainment & Sports","Geography","History","Mathematics","Science","General Knowledge"];




  getsubject
      ()
  async {

    await http.post("http://edusupportapp.com/api/get_user_quizzes_by_join_class.php",
        body: {
          "UserId": GlobalData.uid,
          "subject": Textvalues
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      Quizz_List= (pass['quizdata'] as List)
          .map((data) => Pojo_quizzes.fromJson(data))
          .toList();

      print(Quizz_List.length);
      print(jsonEncode(Quizz_List).toString());
      setState(() {

      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Select Quiz Subject",
              style: TextStyle(fontSize: 22),textAlign: TextAlign.center,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 35,left: 25),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        GestureDetector(onTap: (){
                          getsubject();
                          GlobalData.isGlobal=false;
                          GlobalData.QuizID=Quizz_List[0].id;
                          GlobalData.QuizLevels=Quizz_List[0].no_of_levels;
                          GlobalData.ExamQuiz=Quizz_List[0].quiz_title;
                          GlobalData.DurationofEachLevel=Quizz_List[0].dur_each_level;
                          Navigator.of(context).pushNamed('Quiz_List_student');
                        },
                            child: Text("Religion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),

                      ],
                    ),



                  ],
                ),
              ),
            ),
          )


      ),

    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsubject();
  }
}
