import 'dart:convert';
import 'package:newpro/Pojo/pojo_answer.dart';
import 'package:newpro/Pojo/pojo_matchs.dart';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class EditAssignmentQuestions extends StatefulWidget {
  @override
  _EditAssignmentQuestionsState createState() => _EditAssignmentQuestionsState();
}

class _EditAssignmentQuestionsState extends State<EditAssignmentQuestions> {
  String SelectedType = GlobalData.Current_Que_To_Edit.answer_type;
  List<String> ListofTypes = ['Fill-in the gaps','Multiple Answers','Short Essay'];
  List<Pojo_Answers> Options = GlobalData.Current_Que_To_Edit.Options;
  //List<Pojo_Matchs> Matches = GlobalData.Current_Que_To_Edit.anwer_options;

  //String TrueorFalse=GlobalData.Current_Que_To_Edit.Options[0].trueanswer.toString();

  String Shortessay="Students Answer";
  List<String> Type = ["fillups","multi","essay"];
  TextEditingController QuestionName = new TextEditingController(text: GlobalData.Current_Que_To_Edit.question);
  TextEditingController Points = new TextEditingController(text: GlobalData.Current_Que_To_Edit.point_awarded);
  TextEditingController EssayInstructions = new TextEditingController(text:GlobalData.Current_Que_To_Edit.essay_instructions);

  void _confirmDialog(BuildContext context)  {
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

                                    child: Text('Add Option',textAlign: TextAlign.center,
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
                                            Expanded(child: TextField(controller: optioncontroller,decoration: InputDecoration(hintText: "Option Text"),))
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

                                                Options.add(Pojo_Answers(trueanswer: Selected,value:optioncontroller.text ));
                                                Navigator.of(context).pop();
                                                setState(() {

                                                });

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

  void QuizCompleted(BuildContext context)  {
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

                                    child: Text('Asiignment Submitted',textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),


                                  new Divider(
                                    color: GlobalData.gray,
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){

                                                Navigator.of(context).pushNamed('Recentque');
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

 /* void _confirmDialogMatches(BuildContext context)  {
    bool Selected = false;
    TextEditingController value1 = new TextEditingController();
    TextEditingController value2 = new TextEditingController();
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

                                    child: Text('Add Option',textAlign: TextAlign.center,
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
                                            Expanded(child: TextField(controller: value1,decoration: InputDecoration(hintText: "Value 1"),))
                                          ],

                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(child: TextField(controller: value2,decoration: InputDecoration(hintText: "Value 2"),))
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

                                                Matches.add(Pojo_Matchs(val1: value1.text,val2:value2.text ));
                                                Navigator.of(context).pop();
                                                setState(() {

                                                });

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
  }*/

  Widget MyQuestionType(String type) {

    switch (type){
      case 'Multiple Answers':
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text("Select Two or More Answers",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                  Row(children: <Widget>[
                    FlatButton.icon(onPressed: (){_confirmDialog(context);}, icon: Icon( Icons.add_circle,color: GlobalData.lightblue,), label: Text("More",style: TextStyle(color: GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
                  ],)
                ],
              ),
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
                                    Options[index].trueanswer=value;setState(() {

                                    });},),
                                  Expanded(child: Container(child: Text(Options[index].value)))

                                  , Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(

                                        onTap: (){
                                          Options.removeLast();
                                          setState(() {

                                          });

                                        },
                                        child: Icon(Icons.cancel,color: Colors.redAccent,size: 20,)),
                                  ),

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
            case 'Fill-in the gaps':
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text("List Options and Select Answer(s)",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                  Row(children: <Widget>[
                    FlatButton.icon(onPressed: (){_confirmDialog(context);}, icon: Icon( Icons.add_circle,color: GlobalData.lightblue,), label: Text("More",style: TextStyle(color: GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
                  ],)
                ],
              ),
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
                                    Options[index].trueanswer=value;setState(() {

                                    });},),
                                  Expanded(child: Text(Options[index].value))

                                  ,Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:   GestureDetector(
                                        onTap: (){

                                          Options.removeLast();
                                          setState(() {

                                          });

                                        },

                                        child: Icon(Icons.cancel,color: Colors.redAccent,size: 20,)),
                                  ),

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
      case 'Short Essay':
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text(/*"Teacher’s Instruction:"*/
                      Shortessay,
                      style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),

                ],
              ),
             /* Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 110.0,
                      child: Column(
                        children: <Widget>[
                          Container(child: CustomTextField()
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),*/



            ],
          ),);
      default:
        return Text("Not Found");
    }

  }

  String MyQuestionAnswer(String type) {

    switch (type){
      case 'Multiple Answers':
        return jsonEncode(Options).toString();

      case 'Fill-in the gaps':
        return jsonEncode(Options).toString();

      case 'Short Essay':
        return Shortessay.toString();

      default:
        return "Sorry";
    }

  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Set Assignment Questions",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[

                Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(padding: EdgeInsets.all(5),color:GlobalData.green,
                                child: Text(
                                  "Question "+GlobalData.Current_Que_To_Edit.ques_no,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                  child: TextField(
                                    controller: QuestionName,
                                    maxLines: 3,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),hintText: "Type question here"),
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Card(

                          child:Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(SelectedType=="Short Essay"?"Points Obtainable":"Points Awarded",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                TextField(controller: Points,decoration: InputDecoration(border: InputBorder.none),keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),)
                              ],
                            ),
                          ) ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Card(

                          child:Padding(
                            padding: const EdgeInsets.fromLTRB(20,20,0,20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Answer Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                new DropdownButton(
                                  value:SelectedType ,

                                  items: ListofTypes.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    SelectedType=value;setState(() {

                                    });},

                                )
                              ],
                            ),
                          ) ),
                    ),
                  ],
                ),
                MyQuestionType(SelectedType),

                Column(
                  children: <Widget>[SelectedType=="Short Essay"?
                  Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 20),
                                    child: TextField(
                                      controller: EssayInstructions,
                                      maxLines: 4,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(border: InputBorder.none,hintText: "Type Instructions here"),
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(SelectedType=="Short Essay"?"Teachers Instructions":"",style:
                                  TextStyle(color: Colors.red),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ):SizedBox(),
                  ],
                ),


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 25,bottom: 40),
                      child: SizedBox(width: 100,
                        child: GradientButtonText(
                          ButtonClick: (){
                            SaveQuizQuestion();
                          },
                          linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                          text: Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Some Values Missing"),
          content: new Text("Please Fill All the Values"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close",style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  SaveQuizQuestion()async {
    if (QuestionName.text.toString() == "" || Points.text.toString() == "" ||
        SelectedType.toString() == "" || MyQuestionAnswer(SelectedType) == ""||
        EssayInstructions.text.toString()=="") {
      _showDialog();
    }else{


      print( "question "+ QuestionName.text.toString()+
          "point_awarded "+ Points.text.toString()+
          "answer_type "+ SelectedType.toString()+
          "quiz_id "+ GlobalData.QuizID+
          "answer_options " + MyQuestionAnswer(SelectedType)+
          "essay_instructions " + EssayInstructions.text.toString());


      http.post(


        /*  question
        point_awarded
        answer_type
        quiz_id
        answer_options ( must be in array or json)
    level_no (require)
    ques_no (require)
    question_id (require)
*/


          "http://edusupportapp.com/api/create_update_assignment_questions.php", body: {
        "question": QuestionName.text.toString(),
        "point_awarded": Points.text.toString(),
        "answer_type": SelectedType.toString(),
        "assignment_id": GlobalData.AssignmentID,
        "answer_options": MyQuestionAnswer(SelectedType),
       // "level_no": GlobalData.Current_Que_To_Edit.level_no.toString(),
        "ques_no": GlobalData.Current_Que_To_Edit.ques_no.toString(),
        "question_id":GlobalData.Current_Que_To_Edit.id.toString(),
        "essay_instructions":EssayInstructions.text.toString(),
      }).then((response) {
        var statuss = jsonDecode(response.body);
        Navigator.of(context).pushReplacementNamed('AssignmentQuestionList');

      });
    }
  }
}