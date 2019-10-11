import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newpro/global.dart' as prefix0;
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



      body:
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: Quizz_List.length,
                    itemBuilder: (c,i){
                      GlobalData.isGlobal=true;
                  return  GestureDetector(
                    onTap: (){


                      GlobalData.EditQuiz=false;
                      GlobalData.QuizID=Quizz_List[i].id;
                      GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                      GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level;
                      GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                      Navigator.of(context).pushNamed(GlobalData.userType=="student"?'studentLevelList':'Question_List');
                    },
                    child: classactivitys(
                      color: GlobalData.green,
                      heading: Quizz_List[i].quiz_title,
                      paragraph: Quizz_List[i].quiz_subject,
                      id:Quizz_List[i].id ,
                      title: Quizz_List[i].quiz_title,
                      is_taken: Quizz_List[i].is_taken,
                      duration: Quizz_List[i].dur_each_level,
                      levels: Quizz_List[i].no_of_levels,
                      closingdate: Quizz_List[i].closing_date,
                    ),
                  );
                }),
              ),
            ],
          )


    );
  }
}
