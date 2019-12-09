import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Pojo/pojo_anslog.dart';
import 'Pojo/pojo_matchs.dart';
import 'Pojo/pojo_questions.dart';
import 'global.dart';


class AssignmentAnswerLog extends StatefulWidget {
  @override
  _AssignmentAnswerLogState createState() => _AssignmentAnswerLogState();
}

class _AssignmentAnswerLogState extends State<AssignmentAnswerLog> {


  List<pojo_anslog> anslist = new List();

 // TextEditingController point = new TextEditingController();

  anslog() async{
    http.post("http://edusupportapp.com/api/get_user_assignment_question_answer.php",
        body: {
          "user_id" : GlobalData.CurrentStudentID,
          "assignment_id" : GlobalData.AssignmentID
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
                GlobalData.ExamQuiz,
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
              questionid: anslist[i].id,
              //level:  anslist[i].level_no,
              que:  anslist[i].question,
              que_no:  anslist[i].que_no,
              user_ans:  anslist[i].useranswer,
              result: anslist[i].is_true,
              anwer_options: anslist[i].anwer_options,
              afg:anslist[i].json,
              User_anwer_options: anslist[i].user_anwer_options,
              answertype: anslist[i].answer_type,
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
 // final String level;
  final String questionid;
  final String que_no;
  final String que;
  final String correct_ans;
  final String user_ans;
  final int result;
  final String afg;
  final String answertype;
  List<Pojo_Matchs> User_anwer_options;
  List<Pojo_Matchs> anwer_options;

  MyResultBlock({this.questionid,this.que_no, this.que, this.correct_ans,
    this.user_ans,this.result,this.anwer_options,this.afg,
    this.User_anwer_options,this.answertype});

  List<point> Pointessay = new List();

  List<Pojo_questions> Quetions = new List();
  int i=0;



  void Pointdialog(BuildContext context)  {

    TextEditingController points = new TextEditingController();
    giveessaypoint() async{
      http.post("http://edusupportapp.com/api/story_point.php",
          body: {
            "user_id" : GlobalData.CurrentStudentID,
            "question_id" : GlobalData.questionid,
            "assignment_id" : GlobalData.AssignmentID,
            "point": points.text.toString(),
          }

      ).then((response){


        Navigator.of(context).pop();
        print(response.body);
        print("userid: " +GlobalData.CurrentStudentID);
        print("point: " +points.text.toString());
        print("assignmentid: " +GlobalData.AssignmentID);
        print("questionid: " +GlobalData.questionid);


      });
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Colors.transparent,
            elevation: 0,
            content: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(

                              child: Column(
                                children: <Widget>[
                                  Center(child: Padding(
                                    padding: const EdgeInsets.only(top:15),

                                    child: Text('Add Point',textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),


                                  new Divider(
                                    color: GlobalData.gray,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(30),
                                    child: Column(
                                      children: <Widget>[

                                        Row(
                                          children: <Widget>[
                                            Expanded(child: TextField(controller: points,decoration: InputDecoration(hintText: "Option Text"),))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){

                                                GlobalData.questionid=questionid;
                                                giveessaypoint();


                                              }
                                              ,linearGradient:
                                            LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]),
                                              text: Text('Add',style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,fontSize: 12,),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                        ),




                                      ],
                                    ),
                                  )],

                              ),

                            ),



                          ],


                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),


          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(

        child: Card(
          child: Column(
            children: <Widget>[
           
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

                           Expanded(child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Container(child: Text("Your Answer: " +(anwer_options.isEmpty?user_ans:""),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                           )),


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

                    answertype=="Short Essay"?
                    RaisedButton(child: Text("Give Point"),onPressed:(){
                      Pointdialog(context);

                    },):
                    SizedBox(),

                    /*Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Container(child: Text(answertype,style: TextStyle(fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  ),*/
                ],
              ),



            ],
          ),
        ),
      ),
    );

  }
}
