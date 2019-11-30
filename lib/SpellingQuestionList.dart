import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'global.dart';
//import 'package:newpro/Pojo/pojo_questions.dart';
import 'Pojo/pojo_spellingquestions.dart';

class SpellingQuestion_List extends StatefulWidget {
  @override
  _SpellingQuestion_ListState createState() => _SpellingQuestion_ListState();
}

class _SpellingQuestion_ListState extends State<SpellingQuestion_List> {







  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_Spellingquestions> Questions = new List();
  List<Pojo_Spellingquestions> OriginalList = new List();
  int i=0;
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  List<Pojo_Answers> Options = List();

  int Selected =0;

  List<String> _list = new List();
  bool isloading = true;

  GetQuestions() async{
    isloading = true;
    setState(() {

    });
    print(GlobalData.spellingid);
    await http.post("http://edusupportapp.com/api/get_spelling_questions.php",body: {
      "spelling_id":GlobalData.spellingid
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      OriginalList = (ParsedJson['spellingquestionsdata'] as List).map((data)=>Pojo_Spellingquestions.fromJson(data)).toList();

      for(var item in OriginalList){
        if(item.level_no==GlobalData.CurrentLevel.toString())
        {
          Questions.add(item);
          print("Match Found");
        }else{
          print("Not Found");
        }
      }
      setState(() {
      });
    });
    isloading=false;
    setState(() {

    });
  }





  Widget AnswerNow(int index)
  {

    //print(jsonEncode(Answers).toString());


    print(GlobalData.LoadData.toString());




  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetQuestions();

  }



  Delete(String id) async{

    await http.post("http://edusupportapp.com/api/delete_spelling_question.php",
        body: {
          "spelling_id":GlobalData.spellingid,
          "question_id":id,
        }).then((res){
      print(res.body);

      setState(() {

      });

    });
  }



  void _showDialog(BuildContext context,String id) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are you sure want to delete the selected Questions?"),
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
                          Delete(id);
                          Show_toast("Delete Successfully", Colors.green);
                          Navigator.of(context).pushNamed('previewspelling');
                        },child: new Text("Ok")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('previewspelling');
                      },child: new Text("Cancel")),
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
          itemCount: Questions.length,
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
                                  child: Text("Level ${Questions[i].level_no.toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                )),
                                GlobalData.EditQuiz==false?Text(""): GestureDetector(
                                    onTap:(){

                                      GlobalData.Edit_spelling_Questions = Questions[i];
                                      Navigator.of(context).pushNamed('editspellingquestion');

                                    },child: Icon(Icons.edit,color: Colors.white,))
                                ,SizedBox(width: 10,),


                                GestureDetector(
                                    onTap: (){

                                      _showDialog(context,Questions[i].id.toString());


                                    },child: Icon(Icons.cancel,color: Colors.white,)),

                                SizedBox(width: 10,),                              ],
                            ),
                          ),
                          Container(
                            color: Colors.brown,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Question ${i+1} of ${Questions.length}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                )),
                              ],
                            ),
                          ),
                          Container(

                            child: Row(
                              children: <Widget>[
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 15,bottom: 15),
                                  child: Container(child: Text("Question: " +Questions[i].question,style: TextStyle(fontWeight: FontWeight.bold),)),
                                )),
                              ],
                            ),
                          ),
                          Container(

                            child: Row(
                              children: <Widget>[
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(child: Text("Answer: " +Questions[i].anwer_options,style: TextStyle(fontWeight: FontWeight.bold),)),
                                )),
                              ],
                            ),
                          ),
                          //AnswerNow(i),
                          Container(

                            child: Row(
                              children: <Widget>[
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(child: Text("Answer Type: Spelling",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(color: Colors.blue,child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10,4, 10, 4),
                                    child: Text(Questions[i].point_awarded+" Pts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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



/*  getExamResult()async{
    http.post("http://edusupportapp.com/api/get_user_quiz_result.php",body:{
      "quiz_id":GlobalData.QuizID,
      "user_id":GlobalData.uid
    }).then((res){
      print(res.body);
      var parsedJson = jsonDecode(res.body);
      print(parsedJson['useranswedata']['point_awarded']);

      ExamCompleted(context,parsedJson['useranswedata']['point_awarded'].toString());
    });
  }*/


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
        appBar: AppBar(title: Text("Questions List"),centerTitle: true,automaticallyImplyLeading: false,
          actions: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('previewspelling');

                },child: Icon(Icons.exit_to_app))


          ],),
        body: isloading==true?Center(child: Text("Loading...")):Questions.isNotEmpty?MYQue():Center(child: Text("No Questions"),)
    );
  }





  GiveAnswer(String answer)async{

    http.post("http://edusupportapp.com/api/spelling_answer.php",body: {
      "user_id":GlobalData.uid,
      "question_id":Questions[i].id,
      "spelling_id":Questions[i].spellingid,
      "answer":answer,
      "level":Questions[i].level_no,
      "q_no":Questions[i].ques_no
    }).then((res){
      print(res.body);
    });

  }

/*
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

                                    child: Text('Spelling Completed',textAlign: TextAlign.center,
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
  }*/




}
