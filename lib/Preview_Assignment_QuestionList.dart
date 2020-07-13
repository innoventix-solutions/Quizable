import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_questions.dart';

class PreviewAssignmentQuestionList extends StatefulWidget {
  @override
  _PreviewAssignmentQuestionListState createState() => _PreviewAssignmentQuestionListState();
}

class _PreviewAssignmentQuestionListState extends State<PreviewAssignmentQuestionList> {







  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_questions> Quetions = new List();
  int i=0;
  //List<Pojo_Matchs> matchs = new List();
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  List<Pojo_Answers> Options = List();
  //List<MatchClass> Matchs = List();
  //List<Pojo_Matchs> Matches = List();
  int Selected =0;
  List<int> Selecteditem=new List();
  // String TrueorFalse = "";
  List<String> _list = new List();
  bool isloading = true;

  GetQuestions() async{
    isloading = true;
    setState(() {

    });
    print(GlobalData.QuizID);
    await http.post("http://edusupportapp.com/api/get_assignment_questions.php",body: {
      "assignment_id":GlobalData.AssignmentID
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Quetions = (ParsedJson['assignmentquestionsdata'] as List).map((data)=>Pojo_questions.fromJson(data)).toList();
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

    switch (type)
    {
      case "Fill-in the gaps":

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
                                        /*Checkbox(value: Answers[index].trueanswer, ),*/
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(Answers[index].value,maxLines: 4,),
                                        )
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

  /* 17-09-19  a  delete question*/

  Delete(String id) async{

    await http.post("http://edusupportapp.com/api/delete_assignment_question.php",
        body: {
          "assignment_id":GlobalData.AssignmentID,
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
          content: new Text("Are You Sure Want To Delete Selected Question?"),
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
                          Navigator.of(context).pushNamed('Previewassignment');
                        },child: new Text("Cancel")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Delete(id);
                        Show_toast("Delete Successfully", Colors.green);
                        Navigator.of(context).pushNamed('Previewassignment');
                      },child: new Text("Ok")),


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
        timeInSecForIosWeb	: 1,
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
                                  child: Text("Question ${Quetions[i].ques_no.toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                )),
                                GlobalData.EditQuiz==false?Text(""): GestureDetector(
                                    onTap:(){

                                      GlobalData.Current_Que_To_Edit = Quetions[i];
                                      Navigator.of(context).pushNamed('EditAssignmentQuestions');

                                    },child: Icon(Icons.edit,color: Colors.white,))
                                ,SizedBox(width: 10,),

                                GestureDetector(
                                    onTap: (){
                                      print("assignmenttecherid " +GlobalData.assignmentteacehrid);
                                      print("uid " + GlobalData.uid);
                                      GlobalData.assignmentteacehrid==GlobalData.uid?
                                      _showDialog(context,Quetions[i].id.toString())
                                          :
                                      Show_toast_Now("Access Denied", Colors.red);


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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(child: Text(Quetions[i].essay_instructions,style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              ],
                            ),
                          ),


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



  /*getExamResult()async{
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
        appBar: AppBar(title: Text("Assignment Question"),centerTitle:
        true,automaticallyImplyLeading: false,
          actions: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('Previewassignment');
                  //assignmentcomplete
                },
                child: Icon(Icons.exit_to_app)
            )
          ],),
        body: isloading==true?Center(child: Text("Loading...")):MYQue()






    );
  }









}
