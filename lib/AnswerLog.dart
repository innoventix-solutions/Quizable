import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Pojo/pojo_anslog.dart';
import 'Pojo/pojo_matchs.dart';
import 'global.dart';


class AnswerLog extends StatefulWidget {
  @override
  _AnswerLogState createState() => _AnswerLogState();
}

class _AnswerLogState extends State<AnswerLog> {

  List<pojo_anslog> anslist = new List();

  anslog() async{
    http.post("http://edusupportapp.com/api/get_user_quiz_question_answer.php",
    body: {
      "user_id" : GlobalData.QuizID,
      "quiz_id" : GlobalData.CurrentStudentID
    }

    ).then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      anslist = (pass['data'] as List)
          .map((data) => pojo_anslog.fromJson(data))
          .toList();

      print(anslist.length);

      setState(() {


      });
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anslog();
  }


  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),
        body:
          ListView.builder(itemBuilder: (c,i){
            return MyResultBlock(correct_ans: anslist[i].trueans,
            level:  anslist[i].level_no,
            que:  anslist[i].question,
            que_no:  anslist[i].que_no,
            user_ans:  anslist[i].useranswer,
            result: anslist[i].is_true,
            anwer_options: anslist[i].anwer_options,
            afg:anslist[i].json,
            User_anwer_options: anslist[i].user_anwer_options,
            );
          },
          itemCount: anslist.length,)

      ),
    );
  }


/*


 */
}



class MyResultBlock extends StatelessWidget {
  final String level;
  final String que_no;
  final String que;
  final String correct_ans;
  final String user_ans;
  final int result;
  final String afg;
  List<Pojo_Matchs> User_anwer_options;
  List<Pojo_Matchs> anwer_options;

  MyResultBlock({this.level, this.que_no, this.que, this.correct_ans,
      this.user_ans,this.result,this.anwer_options,this.afg,this.User_anwer_options});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(

        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Level "+level,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    )),
                  ],
                ),
              ),
              Container(

                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(color: Colors.brown,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Question "+que_no,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(width: 50,),

                    Container(color: result==1?Colors.green:Colors.red,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(result==1?"Right":"Wrong",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(

                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(child: Text(que,style: TextStyle(fontWeight: FontWeight.bold),)),
                    )),

                  ],
                ),

              ),

              Column(
                children: <Widget>[
                  Container(

                    child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(child: Text("Your Answer: " +(anwer_options.isEmpty?user_ans:""),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                        ),

                      ],
                    ),
                  ),
                  anwer_options.isNotEmpty?Container(
                    height: anwer_options.isEmpty?20.0:anwer_options.length*50.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(

                                  itemCount: anwer_options.length,
                                  itemBuilder: (c,i){
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(

                                        child: Card(
                                          color: Colors.green[300],
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(child: Text( anwer_options[i].val1+" - "+ anwer_options[i].val2,style: TextStyle(color: Colors.white),)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),),

                      ],
                    ),
                  ):SizedBox(),
                  Container(

                    child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(child: Text("Correct Answer: "+(anwer_options.isEmpty?correct_ans:""),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                        ),

                      ],
                    ),
                  ),
                  anwer_options.isNotEmpty?Container(
                    height: User_anwer_options.isEmpty?20.0:User_anwer_options.length*50.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(

                                  itemCount: User_anwer_options.length,
                                  itemBuilder: (c,i){
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(

                                        child: Card(
                                          color: Colors.green[300],
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(child: Text( User_anwer_options[i].val1+" - "+ User_anwer_options[i].val2,style: TextStyle(color: Colors.white),)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),),

                      ],
                    ),
                  ):SizedBox(),
                ],
              ),



            ],
          ),
        ),
      ),
    );

  }
}
