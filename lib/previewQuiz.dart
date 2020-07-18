import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class PreviewQuiz extends StatefulWidget {
  @override
  _PreviewQuizState createState() => _PreviewQuizState();
}

class _PreviewQuizState extends State<PreviewQuiz> {

  List<Pojo_quizzes> Quizz_List = new List();
  bool isloading = true;

  GetTest() async{

    isloading = true;
    setState(() {

    });
    await http.post(GlobalData.applink+"get_quizzes.php",
        body: {
          "UserId":GlobalData.uid,
          //"Class_id":GlobalData.classid,
          //"publish_onhold_both":"dd"
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if(ParsedJson['quizdata']==false){

      }
      else {
        Quizz_List = (ParsedJson['quizdata'] as List).
        map((data) => Pojo_quizzes.fromJson(data)).toList();
      }

      print(Quizz_List.length);
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
    return WillPopScope(onWillPop: () async => true,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,

            title: Center(
              child: Text(
                "Quiz Exercise Log",
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
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed('dashboard');

                    },child: Icon(Icons.exit_to_app))
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


                    int totalQuestions=  int.parse(Quizz_List[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level);




                      return GestureDetector(
                        onTap: (){
                          GlobalData.EditQuiz=false;
                          GlobalData.QuizID=Quizz_List[i].id;
                          GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                          GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level;
                          GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                          GlobalData.QuizTitle=Quizz_List[i].quiz_title;
                          GlobalData.NosofQuesPerLevel = Quizz_List[i].que_each_level;
                          GlobalData.Selected_class=Quizz_List[i].classes;
                          GlobalData.age=Quizz_List[i].age;
                          GlobalData.quizstatus=Quizz_List[i].status;
                          GlobalData.quiztecherid=Quizz_List[i].techer_id;

                          print((Quizz_List[i].total_fill_question<int.parse(Quizz_List[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level)));

                          if((Quizz_List[i].total_fill_question<int.parse(Quizz_List[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level))){
                            //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                            GlobalData.QuestionNumber=Quizz_List[i].total_fill_question;

                            Navigator.of(context).pushNamed('questions');
                          }else {
                              //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                            print("asdfasdf");
                              Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'previewQuizlevellists');
                            }

                        },
                        child:  Quizz_List[i].is_taken==false?
                        PreviewQuizs(
                          color: GlobalData.pinkred,
                          heading: Quizz_List[i].quiz_title+"  "+Quizz_List[i].total_fill_question.toString()+""+(int.parse(Quizz_List[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level)).toString(),
                          paragraph: Quizz_List[i].publish_date,
                          id:Quizz_List[i].id ,
                          title: Quizz_List[i].quiz_title,
                          //is_taken: Quizz_List[i].is_taken,
                          duration: Quizz_List[i].dur_each_level,
                          levels: Quizz_List[i].no_of_levels,
                          isActive: Quizz_List[i].status.toLowerCase()=="publish"?true:false,
                          incomplete: (Quizz_List[i].total_fill_question<int.parse(Quizz_List[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level)),
                          continueTo:Quizz_List[i].total_fill_question,
                          publishedDate: Quizz_List[i].publish_date,
                          Quiz: Quizz_List[i],


                        ): SizedBox()
                      );
                    }),
              ),

                   Padding(
                          padding: const EdgeInsets.only(bottom: 25, right: 15,top: 15),
                          child: GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                   Row(children: <Widget>[

                                     Icon(
                                     Icons.add_circle,
                                     color: GlobalData.lightblue,
                                     size: 20,
                                   ),

                                     Text(
                                       'Add New Quiz Topic',
                                       style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                           color: GlobalData.lightblue),
                                     ),],

                                   ),
                              ],
                            ),
                            onTap: () async{
                              GlobalData.QuizTitle="";
                              GlobalData.QuizLevels="";
                              GlobalData.NosofQuesPerLevel="";
                              GlobalData.DurationofEachLevel="";
                              GlobalData.Selected_subject=null ;
                              GlobalData.Selected_class=null;

                              Navigator.of(context)
                                  .pushNamed('setquizquestions');
                            },
                          ),
                        ),
            ],
          )
      ),
    );
  }
}



