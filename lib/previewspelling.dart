import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_getspelling.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class PreviewSpelling extends StatefulWidget {
  @override
  _PreviewSpellingState createState() => _PreviewSpellingState();
}

class _PreviewSpellingState extends State<PreviewSpelling> {

  List<Pojo_spelling> spellinglist = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_spellings.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      spellinglist = (ParsedJson['quizdata'] as List).map((data)=>Pojo_spelling.fromJson(data)).toList();

      print(spellinglist.length);
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
    /*return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Spelling Exercise Log",
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

        body:
        Column(
          children: <Widget>[
            Expanded(
              child: spellinglist.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: spellinglist.length,
                  itemBuilder: (c,i){


                    int totalQuestions=  int.parse(spellinglist[i].no_of_levels) * int.parse(spellinglist[i].que_each_level);




                    return GestureDetector(
                        onTap: (){
                          GlobalData.EditQuiz=false;
                          GlobalData.spellingid=spellinglist[i].id;
                          GlobalData.ExamQuiz=spellinglist[i].spelling_title;
                          GlobalData.spellDurationofEachLevel=spellinglist[i].dur_each_level;
                          GlobalData.spellLevels=spellinglist[i].no_of_levels;
                          GlobalData.spelltitle=spellinglist[i].spelling_title;
                          GlobalData.spellNosofQuesPerLevel = spellinglist[i].que_each_level;
                          GlobalData.Selected_class=spellinglist[i].classes;



                          print((spellinglist[i].total_fill_question<int.parse(spellinglist[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level)));

                          if((Quizz_List[i].total_fill_question<int.parse(Quizz_List[i].no_of_levels) * int.parse(Quizz_List[i].que_each_level))){
                            //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                            GlobalData.QuestionNumber=Quizz_List[i].total_fill_question;

                            Navigator.of(context).pushNamed('questions');
                          }else {
                            //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                            print("asdfasdf");
                            Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'levelsList');
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
                onTap: () {
                  Navigator.of(context).pushNamed('setquizquestions');
                },
              ),
            ),
          ],
        )
    );*/
  }
}


