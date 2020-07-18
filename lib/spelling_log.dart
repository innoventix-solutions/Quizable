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

  bool isloading = true;


  GetTest() async{

    isloading = true;
    setState(() {

    });
    await http.post(GlobalData.applink+"get_spelling_by_class.php",
        body: {
          "UserId":GlobalData.uid,
          "Class_id":GlobalData.classid,
          "publish_onhold_both":"",
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if(ParsedJson['spellingdata']==false){

      }
      else {
        spellingList = (ParsedJson['spellingdata'] as List).map((data) =>
            Pojo_spelling.fromJson(data)).toList();
      }

      spellingList.sort((a, b) {
        return b.takendate.toLowerCase().compareTo(a.takendate.toLowerCase());
      });

      print(spellingList.length);
      print(jsonEncode(spellingList).toString());
      setState(() {

      });
    });

    isloading = false;
    setState(() {

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
              "Spelling Exercises Log",
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



        body: isloading==true?Center(child: Text("Loading...",style: TextStyle(
            fontSize: 18
        ),)):
        Column(
          children: <Widget>[
            Expanded(
              child:spellingList.isEmpty ? Center(child: Text('No exercises in Spelling Log')) :
              ListView.builder(
                  itemCount: spellingList.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.spellingid=spellingList[i].id;
                        GlobalData.QuizLevels=spellingList[i].no_of_levels;
                        GlobalData.ExamQuiz=spellingList[i].spelling_title;
                        GlobalData.spellDurationofEachLevel=spellingList[i].dur_each_level;
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
