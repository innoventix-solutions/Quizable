import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'Pojo/pojo_getspelling.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';

class StudentSpellingResult extends StatefulWidget {
  @override
  _StudentSpellingResultState createState() => _StudentSpellingResultState();
}

class _StudentSpellingResultState extends State<StudentSpellingResult> {
  List<Pojo_spelling> spellinglist = new List();



  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_spelling_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      spellinglist = (ParsedJson['spellingdata'] as List).map((data)=>Pojo_spelling.fromJson(data)).toList();

      print(spellinglist.length);
      print(jsonEncode(spellinglist).toString());
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
              "My Spelling Result",
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
              child:spellinglist.isEmpty ? Center(child: Text('No Spelling Exercises Log')) :
              ListView.builder(
                  itemCount: spellinglist.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                         GlobalData.spellingid=spellinglist[i].id;
                        GlobalData.QuizLevels=spellinglist[i].no_of_levels;
                        GlobalData.ExamQuiz=spellinglist[i].spelling_title;
                        GlobalData.spellDurationofEachLevel=spellinglist[i].dur_each_level;
                        GlobalData.CurrentStudentID=GlobalData.uid;
                        Navigator.of(context).pushNamed('spellinglevelsList');
                      },
                      child: spellinglist[i].is_taken==true?
                      SpellingResult(
                        color: GlobalData.pinkred,
                        heading: spellinglist[i].spelling_title+" - "+spellinglist[i].id,
                        paragraph: spellinglist[i].spelling_subject,
                        title: spellinglist[i].takendate.toString(),
                        id: spellinglist[i].id,
                        is_taken: spellinglist[i].is_taken,
                        percent: spellinglist[i].percentage.toString(),
                        progresslabel:spellinglist[i].progresslabel,
                        timetaken: spellinglist[i].totaltime.toString(),
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