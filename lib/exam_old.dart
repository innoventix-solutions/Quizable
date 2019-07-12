import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_questions.dart';

class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {

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
  GetQuestions() async{
    print(GlobalData.QuizID);
    http.post("http://edusupportapp.com/api/get_quiz_questions.php",body: {
      "QuizId":GlobalData.QuizID
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Quetions = (ParsedJson['quizquestionsdata'] as List).map((data)=>Pojo_questions.fromJson(data)).toList();
      setState(() {
      });
    });
  }





  Widget AnswerNow(String type,List<Pojo_Matchs> Data,List<Pojo_Answers> Answers)
  {

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

            return Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
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
                          child: ReorderableListView(
                            children: _list.map((item) => ListTile(key: Key("${item}"), title: Text("${item}"), trailing: Icon(Icons.menu),)).toList(),
                            onReorder: (int start, int current) {
                              // dragging from top to bottom
                              if (start < current) {
                                int end = current - 1;
                                String startItem = _list[start];
                                int i = 0;
                                int local = start;
                                do {
                                  _list[local] = _list[++local];
                                  i++;
                                } while (i < end - start);
                                _list[end] = startItem;
                              }
                              // dragging from bottom to top
                              else if (start > current) {
                                String startItem = _list[start];
                                for (int i = start; i > current; i--) {
                                  _list[i] = _list[i - 1];
                                }
                                _list[current] = startItem;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );


      case "True or False":
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
                                Radio(value: "false", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

                                });}),
                                Text("True")



                              ],),),
                            Container(child: Row(
                              children: <Widget>[
                                Radio(value: "true", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;
                                setState(() {

                                });}),

                                Text("False")



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
                                  itemCount: Options.length,itemBuilder: (context,index){
                                return Container(child: Row(
                                  children: <Widget>[
                                    Checkbox(value: Options[index].trueanswer, onChanged: (value){


                                      for(int i=0;i<Options.length;i++){
                                        Options[i].trueanswer=false;
                                      }


                                      Options[index].trueanswer=value;setState(() {

                                      });},),
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
  Widget build(BuildContext context) {


    List<String> Value1 = List();
    List<String> Value2 = List();



    for(var item in Quetions[0].anwer_options){
      Value1.add(item.val1);
      Value2.add(item.val2);
    }


    print(Value2.length);
    print(Value1.length);


    print(Quetions[i].anwer_options.length.toString()+"  asdznaisdfmmb k");
Matches =Quetions[i].anwer_options;
    return Scaffold(
      appBar: AppBar(title: Text("My Quiz Exercises"),centerTitle: true,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[

              Expanded(
                child: PageView.builder(
                  onPageChanged: (val){
                    CurrentPage = val;
                  },
                  controller: pageController,
                    itemCount: Quetions.length,
                    itemBuilder: (c,i){

                      return Container(

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
                            AnswerNow(Quetions[i].answer_type,Quetions[i].anwer_options,Quetions[i].Options),
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
                      );



                 /* return Card(
                    child: Column(
                      children: <Widget>[
                        Text(i.toString()),

                        Text(Quetions[i].answer_type.toString()),
                        Text(Quetions[i].question.toString()),
                        Text(Quetions[i].anwer_options.length.toString()),
                        Text(Quetions[i].Options.length.toString()),
                        Text(Quetions[i].TrueorFalse.toString())
                      ],
                    ),
                  );*/
                }),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15,),
                    Expanded(
                      child: GradientButtonText(
                        ButtonClick: (){
                          if(CurrentPage-2<Quetions.length)
                          pageController.jumpToPage(CurrentPage++);
                        },
                        linearGradient:LinearGradient(colors: <Color>[navy,navyblue]) ,
                        text: Text("Skip",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: GradientButtonText(
                        ButtonClick: (){
                          if(CurrentPage-2<Quetions.length)
                            pageController.jumpToPage(CurrentPage++);
                        },
                        linearGradient:LinearGradient(colors: <Color>[navyblue,pink]) ,
                        text: Text("Next",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
      SizedBox(width: 15,),
                  ],
                ),
              )

            ],
          ),
        ),
      )




      /*SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        controller:controller ,itemCount: Value1.length,itemBuilder: (c,i){
                      return ListTile(title: Text(Value1[i]),leading: Icon(Icons.menu),);
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReorderableListView(


                      children:  Value2.map((item) => ListTile(key: Key("${item}"), title: Text("${item}"), trailing: Icon(Icons.menu),)).toList(), onReorder: (int start, int current) {
                      // dragging from top to bottom
                      if (start < current) {
                        int end = current - 1;
                        String startItem = Value2[start];
                        int i = 0;
                        int local = start;
                        do {
                          Value2[local] = Value2[++local];
                          i++;
                        } while (i < end - start);
                        Value2[end] = startItem;
                      }
                      // dragging from bottom to top
                      else if (start > current) {
                        String startItem = Value2[start];
                        for (int i = start; i > current; i--) {
                          Value2[i] = Value2[i - 1];
                        }
                        Value2[current] = startItem;
                      }
                      setState(() {});
                    },),
                  ),
                ],
              ),
            ),
          ],
        ),
      )*/

    );
  }
}
