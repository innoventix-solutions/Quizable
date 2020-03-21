import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class questionmenu extends StatefulWidget {
  @override
  _questionmenuState createState() => _questionmenuState();
}

class _questionmenuState extends State<questionmenu> {

  List<Pojo_quizzes> Quizz_List = new List();
  bool isloading = true;

  GetTest() async{


    isloading = true;
    setState(() {

    });

    await http.post("http://edusupportapp.com/api/get_quizzes_by_class.php",
    body: {
      "UserId":GlobalData.uid,
      "Class_id":GlobalData.classid
    }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if(ParsedJson['quizdata']==false){

      }
      else {
        Quizz_List = (ParsedJson['quizdata'] as List).map((data) =>
            Pojo_quizzes.fromJson(data)).toList();
      }
      print(Quizz_List.length);
      setState(() {

      });

      isloading = false;
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
            "Quiz Report",
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

      /*drawer:
      drawerquiz(),*/

      body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
          fontSize: 18
      ),)):
          Column(
            children: <Widget>[
              Expanded(
                child: Quizz_List.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
                ListView.builder(
                    itemCount: Quizz_List.length,
                    itemBuilder: (c,i){
                    return GestureDetector(
                    onTap: (){GlobalData.isGlobal=false;
                    GlobalData.QuizID=Quizz_List[i].id;
                    GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                    GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                    GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level;
                      Navigator.of(context).pushNamed('StudentListByQuiz');
                    },
                    child: StudentActivityReport(
                      color: GlobalData.pinkred,
                      heading: Quizz_List[i].quiz_title,
                      paragraph: Quizz_List[i].quiz_subject,
                      id:Quizz_List[i].id ,
                      title: Quizz_List[i].publish_date,
                      is_taken: Quizz_List[i].is_taken,
                      duration: Quizz_List[i].dur_each_level,
                      levels: Quizz_List[i].no_of_levels,
                    ),
                  );
                }),
              ),
            ],
          )
    );
  }
}
