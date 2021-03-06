import 'dart:convert';

import 'package:flutter/material.dart';
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
    await http.post(GlobalData.applink+"get_quiz_questions.php",body: {
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

    Matches=Data;
    Options = Answers;
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

        return Container(

          height: Matches.isEmpty?50.0:Matches.length*60.0,
          child: Row(
            children: <Widget>[
              Expanded(child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      key:Key("MatchType"+index.toString()),
                        controller: controller,
                        itemCount: Matches.length,
                        itemBuilder: (c,i){
                          return ListTile(
                            title: Text( Matches[i].val1),
                            leading: Icon(Icons.add,color: Colors.transparent,),
                          );

                        }),
                  ),
                ],
              ),),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: _list.map((item) => ListTile( title: Text("${item}"), )).toList(),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case "True False":
       /* return Card(
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
          ),);*/
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
                      height: Options.isEmpty?50.0:Options.length*50.0,

                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                                key:Key(type+index.toString()),
                                itemCount: Options.length,
                                itemBuilder: (context,index){
                              return Container(
                               
                                child: Row(
                                children: <Widget>[
                                  Checkbox(value: Options[index].trueanswer, ),
                                  Text(Options[index].value,maxLines: 4,)
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

  @override
  dispose(){

  }

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
                            ,SizedBox(width: 10,)
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
    http.post(GlobalData.applink+"get_user_quiz_result.php",body:{
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
        appBar: AppBar(title: Text("Questions List"),
          backgroundColor: GlobalData.darkpurple,centerTitle: true,actions: <Widget>[IconButton(onPressed: ()
        {
          Navigator.of(context)
              .pushNamed('teacherdashboard');
        },
          icon: Icon(
            Icons.home,
            color: Colors.white,
            size: 22,
          ),
        ),],),
        body: isloading==true?Center(child: Text("Loading...")):MYQue()






    );
  }





  GiveAnswer(String answer)async{

    http.post(GlobalData.applink+"quiz_answer.php",body: {
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
