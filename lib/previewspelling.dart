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
  bool isloading = true;

  GetTest() async{

    isloading = true;
    setState(() {

    });
    await http.post(GlobalData.applink+"get_spellings.php",
        body: {
          "UserId":GlobalData.uid,
         // "Class_id":GlobalData.classid,
          //"publish_onhold_both":"dd"
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if(ParsedJson['spellingdata']==false){

      }
      else {
        spellinglist = (ParsedJson['spellingdata'] as List).
        map((data) => Pojo_spelling.fromJson(data)).toList();
      }

      print(spellinglist.length);
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
          automaticallyImplyLeading: false,

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
                          GlobalData.spellingstatus=spellinglist[i].status;
                          GlobalData.spellteacherid=spellinglist[i].techer_id;



                          print((spellinglist[i].total_fill_question<int.parse(spellinglist[i].no_of_levels) * int.parse(spellinglist[i].que_each_level)));

                          if((spellinglist[i].total_fill_question<int.parse(spellinglist[i].no_of_levels) * int.parse(spellinglist[i].que_each_level))){
                            //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                            GlobalData.QuestionNumber=spellinglist[i].total_fill_question;

                            Navigator.of(context).pushNamed('spellque');
                          }else {
                            //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                            print("asdfasdf");
                            Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'previewspellinglevellist');
                          }

                        },
                        child:  spellinglist[i].is_taken==false?
                        PreviewSpellingss(
                          color: GlobalData.pinkred,
                          heading: spellinglist[i].spelling_title+"  "+spellinglist[i].total_fill_question.toString()+""+(int.parse(spellinglist[i].no_of_levels) * int.parse(spellinglist[i].que_each_level)).toString(),
                          paragraph: spellinglist[i].publish_date,
                          id:spellinglist[i].id ,
                          title: spellinglist[i].spelling_title,
                          //is_taken: Quizz_List[i].is_taken,
                          duration: spellinglist[i].dur_each_level,
                          levels: spellinglist[i].no_of_levels,
                          isActive: spellinglist[i].status.toLowerCase()=="publish"?true:false,
                          incomplete: (spellinglist[i].total_fill_question<int.parse(spellinglist[i].no_of_levels) * int.parse(spellinglist[i].que_each_level)),
                          continueTo:spellinglist[i].total_fill_question,
                          publishedDate: spellinglist[i].publish_date,
                         Spelling: spellinglist[i],


                        ):
                      SizedBox()
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
                        'Add New Spelling Topic',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: GlobalData.lightblue),
                      ),],

                    ),




                  ],
                ),
                onTap: () async{
                  GlobalData.spelltitle = "";
                  GlobalData.spellLevels = "";
                  GlobalData.spellNosofQuesPerLevel = "";
                  GlobalData.spellDurationofEachLevel = "";
                  GlobalData.teacherguide = "";
                  GlobalData.Selected_subject = null ;
                  GlobalData.Selected_class = null;
                  Navigator.of(context)
                      .pushNamed('setspellingque');


                },
              ),
            ),
          ],
        )
    );
  }
}



