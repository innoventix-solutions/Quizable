import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_questions.dart';

class Question_List extends StatefulWidget {
  @override
  _Question_ListState createState() => _Question_ListState();
}

class _Question_ListState extends State<Question_List> {







  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_questions> Quetions = new List();
  int i=0;
  List<Pojo_Matchs> matchs = new List();
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  List<Pojo_Answers> Options = List();
  List<MatchClass> Matchs = List();
  List<Pojo_Matchs> Matches = List();
  int Selected =0;
  List<int> Selecteditem=new List();
  String TrueorFalse = "";
  List<String> _list = new List();
  bool isloading = true;

  GetQuestions() async{
    isloading = true;
    setState(() {

    });
    print(GlobalData.QuizID);
    await http.post("http://edusupportapp.com/api/get_quiz_questions.php",body: {
      "QuizId":GlobalData.QuizID
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Quetions = (ParsedJson['quizquestionsdata'] as List).map((data)=>Pojo_questions.fromJson(data)).toList();
      setState(() {
      });
    });
    isloading=false;
    setState(() {

    });
  }





  Widget AnswerNow(String type,List<Pojo_Matchs> Data,List<Pojo_Answers> Answers,int index)
  {

    print(jsonEncode(Answers).toString());


    print(GlobalData.LoadData.toString());

    if(_list.length==0) {
      for (var item in Matches) {
        _list.add(item.val2);
      }
      print(_list.length);
    }


    switch (type)
    {
      case "Match Type":

        return Data.isEmpty? Text(""): Container(
          height: Data.isEmpty?50.0:Data.length*60.0,
          child: Row(
            children: <Widget>[
              Expanded(child: Container(
                color:Colors.green[300],
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                        key:Key("MatchType"+index.toString()),
                          controller: controller,
                          itemCount: Data.length,
                          itemBuilder: (c,i){
                            return Column(
                              children: <Widget>[

                                Row(
                                  children: <Widget>[
                                    Expanded(child: Card(

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 35,
                                          child: Row(children: <Widget>[
                                            Expanded(child: Text( Data[i].val1),),
                            Expanded(child: Text( Data[i].val2),)
                                          ],),
                                        ),
                                      ),
                                    )),
                                  ],
                                )
                              ],
                            );

                          }),
                    ),
                  ],
                ),
              ),),


            ],
          ),
        );
      case "True False":

        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text("Select Answer",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 110.0,
                      child: Column(
                        children: <Widget>[
                          Container(child: Row(
                            children: <Widget>[
                              Radio(value: "true", groupValue: Answers[0].trueanswer.toString(), ),
                              Text(Answers[0].value.toUpperCase())
                            ],),),
                          Container(child: Row(
                            children: <Widget>[
                              Radio(value: "true", groupValue: Answers[1].trueanswer.toString(), ),
                              Text(Answers[1].value.toUpperCase())
                            ],),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),);
      default:
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: Answers.isEmpty?50.0:Answers.length*50.0,

                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Answers.isEmpty?Text(""): ListView.builder(
                                shrinkWrap: true,
                                key:Key(type+index.toString()),
                                itemCount: Answers.length,
                                itemBuilder: (context,index){
                              return Container(
                               
                                child: Row(
                                children: <Widget>[
                                  Checkbox(value: Answers[index].trueanswer, ),
                                  Text(Answers[index].value,maxLines: 4,)
],),);}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetQuestions();

  }

  /* 28-8 delete question*/

  Delete() async{

    await http.post("http://edusupportapp.com/api/delete_quiz_question.php",
        body: {
          "quiz_id":GlobalData.QuizID,
          "question_id":Quetions[i].id
        }).then((res){
      print(res.body);

      setState(() {

      });

    });
  }



  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert!!!"),
          content: new Text("Are You Sure Want To Delete Question?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Delete();
                          Show_toast("Delete Successfully", Colors.green);
                          Navigator.of(context).pushNamed('previewQuiz');
                        },child: new Text("YES")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('Question_List');
                      },child: new Text("No")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }



  @override
  dispose();  //23-8-19

  Widget MYQue(){
    return SafeArea(
      child: ListView.builder(
        itemCount: Quetions.length,
        itemBuilder: (c,i){
        return Padding(

          key: Key(i.toString()),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Level ${Quetions[i].level_no.toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            )),
                           GlobalData.EditQuiz==false?Text(""): GestureDetector(
                            onTap:(){

                              GlobalData.Current_Que_To_Edit = Quetions[i];
                              Navigator.of(context).pushNamed('edit_question');

                            },child: Icon(Icons.edit,color: Colors.white,))
                            ,SizedBox(width: 10,),

                            GestureDetector(
                                onTap: (){

                                  _showDialog();


                                },child: Icon(Icons.cancel,color: Colors.white,)),
                            SizedBox(width: 10,),

                          ],
                        ),
                      ),
                      Container(
                        color: Colors.brown,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Question ${i+1} of ${Quetions.length}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            )),
                          ],
                        ),
                      ),
                      Container(

                        child: Row(
                          children: <Widget>[
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(child: Text(Quetions[i].question,style: TextStyle(fontWeight: FontWeight.bold),)),
                            )),
                          ],
                        ),
                      ),
                      AnswerNow(Quetions[i].answer_type,Quetions[i].anwer_options,Quetions[i].Options,i),
                      Container(

                        child: Row(
                          children: <Widget>[
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(child: Text(Quetions[i].answer_type,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(color: Colors.blue,child: Padding(
                                padding: const EdgeInsets.fromLTRB(10,4, 10, 4),
                                child: Text(Quetions[i].point_awarded+" Pts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              )),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),



            ],
          ),
        );
  }
      ),
    );
  }



  getExamResult()async{
    http.post("http://edusupportapp.com/api/get_user_quiz_result.php",body:{
      "quiz_id":GlobalData.QuizID,
      "user_id":GlobalData.uid
    }).then((res){
      print(res.body);
      var parsedJson = jsonDecode(res.body);
      print(parsedJson['useranswedata']['point_awarded']);

      ExamCompleted(context,parsedJson['useranswedata']['point_awarded'].toString());
    });
  }


  @override
  Widget build(BuildContext context) {

/*
    List<String> Value1 = List();
    List<String> Value2 = List();



    for(var item in Quetions[0].anwer_options){
      Value1.add(item.val1);
      Value2.add(item.val2);
    }


    print(Value2.length);
    print(Value1.length);*/


    /*print(Quetions[i].anwer_options.length.toString()+"  asdznaisdfmmb k");
Matches =Quetions[i].anwer_options;*/
    return Scaffold(
        appBar: AppBar(title: Text("Questions List"),centerTitle: true,),
        body: isloading==true?Center(child: Text("Loading...")):MYQue()






    );
  }





  GiveAnswer(String answer)async{

    http.post("http://edusupportapp.com/api/quiz_answer.php",body: {
      "user_id":GlobalData.uid,
      "question_id":Quetions[i].id,
      "quiz_id":Quetions[i].quiz_id,
      "answer":answer
    }).then((res){
      print(res.body);
    });

  }


  void ExamCompleted(BuildContext context,String Score)  {
    bool Selected = false;
    TextEditingController optioncontroller = new TextEditingController();
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

                                    child: Text('Quiz Completed',textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),
                                  new Divider(
                                    color: GlobalData.gray,
                                  ),
                                  Center(child: Padding(
                                    padding: const EdgeInsets.all(15),

                                    child:
                                    Image.asset("assets/images/trophy.png",height: 150,),
                                  )),
                                  Center(child: Padding(
                                    padding: const EdgeInsets.only(top:15),

                                    child: Text('Score : '+Score,textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 20,fontWeight: FontWeight.bold),),
                                  )),





                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){
                                                Navigator.of(context).pop();

                                                Navigator.of(context).pop();
                                                Navigator.of(context).pushNamed('Quiz_List_student');
                                                setState(() {

                                                });

                                              }
                                              ,linearGradient:
                                            LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]),
                                              text: Text('Ok',style: TextStyle(color: Colors.white,
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




}
