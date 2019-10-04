import 'dart:convert';
import 'package:newpro/Pojo/pojo_answer.dart';
import 'package:newpro/Pojo/pojo_matchs.dart';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class Edit_Question extends StatefulWidget {
  @override
  _Edit_QuestionState createState() => _Edit_QuestionState();
}


class _Edit_QuestionState extends State<Edit_Question> {
  String SelectedType = GlobalData.Current_Que_To_Edit.answer_type;
List<String> ListofTypes = ['Fill-in the gaps', 'Match Type', 'Single Answer', 'Multiple Answers','True False'];
List<Pojo_Answers> Options = GlobalData.Current_Que_To_Edit.Options;
List<Pojo_Matchs> Matches = GlobalData.Current_Que_To_Edit.anwer_options;

String TrueorFalse=GlobalData.Current_Que_To_Edit.Options[0].trueanswer.toString();
List<String> Type = ["fillups","matchtype","single","multi","tf"];
TextEditingController QuestionName = new TextEditingController(text: GlobalData.Current_Que_To_Edit.question);
TextEditingController Points = new TextEditingController(text: GlobalData.Current_Que_To_Edit.point_awarded);

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
                                              if(optioncontroller.text !=null && optioncontroller.text !="")
                                                {

                                                Options.add(Pojo_Answers(trueanswer:SelectedType=="Fill-in the gaps"?true: Selected,
                                                  value:optioncontroller.text));
                                              Navigator.of(context).pop();
                                              setState(() {

                                              });

                                            }else {
                                                Show_toast_Now("Option can't be blank",Colors.red);
                                              }

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

                                  child: Text('Quiz Submitted',textAlign: TextAlign.center,
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

                                              Navigator.of(context).pushReplacementNamed('Recentque');
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

void _confirmDialogMatches(BuildContext context)  {
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
}

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
    case 'Match Type':
      return Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text("Select Pairs of Matching Terms.",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                  Row(children: <Widget>[
                    FlatButton.icon(onPressed: (){_confirmDialogMatches(context);}, icon: Icon( Icons.add_circle,color: GlobalData.lightblue,), label: Text("More",style: TextStyle(color: GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
                  ],)
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: Matches.isEmpty?50.0:Matches.length*50.0,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                                itemCount: Matches.length,itemBuilder: (context,index){
                              return Container(child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child:Card(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(Matches[index].val1),
                                    )) ,
                                  ),
                                  SizedBox(width: 20,)
                                  ,
                                  Expanded(
                                    child:Card(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(Matches[index].val2),
                                    )) ,
                                  ),


                                  GestureDetector(onTap: (){

                                    Matches.removeLast();
                                    setState(() {

                                    });
                                  },
                                      child: Icon(Icons.cancel,color: Colors.redAccent,size: 20,)),



                                ],),);}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),);
    case 'Single Answer':
      return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(padding: EdgeInsets.all(5),child: Text("List Options and Select One Answer ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
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


                                  for(int i=0;i<Options.length;i++){
                                    Options[i].trueanswer=false;
                                  }


                                  Options[index].trueanswer=value;setState(() {

                                  });},),
                                Expanded(child: Text(Options[index].value,maxLines: 4,)),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(

                                      onTap: (){

                                        Options.removeLast();
                                        setState(() {

                                        });
                                      }

                                      ,child: Icon(Icons.cancel,color: Colors.redAccent,size: 20,)),
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
                                /*Checkbox(value: Options[index].trueanswer, onChanged: (value){
                                  Options[index].trueanswer=value;setState(() {

                                  });},),*/
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(Options[index].value),
                                ))

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
    case 'True False':
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
                            Radio(value: "true", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

                            });}),
                            Text("True")



                          ],),),
                        Container(child: Row(
                          children: <Widget>[
                            Radio(value: "false", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

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
      return Text("Not Found");
  }

}

String MyQuestionAnswer(String type) {

  switch (type){
    case 'Multiple Answers':
      return jsonEncode(Options).toString();
    case 'Match Type':
      return jsonEncode(Matches).toString();
    case 'Single Answer':
      return jsonEncode(Options).toString();
    case 'Fill-in the gaps':
      return jsonEncode(Options).toString();
    case 'True False':
      Options.clear();
      if(TrueorFalse=="true"){
        Options.add(Pojo_Answers(trueanswer: true,value: "True"));
        Options.add(Pojo_Answers(trueanswer: false,value: "False"));
      }else
      {
        Options.add(Pojo_Answers(trueanswer: false,value: "True"));
        Options.add(Pojo_Answers(trueanswer: true,value: "False"));
      }
      print(TrueorFalse);
      print(jsonEncode(Options).toString());
      return jsonEncode(Options).toString();
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
          "Set Quiz Questions",
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
                        Container(
                            padding: EdgeInsets.all(5),color:GlobalData.green,
                            child:  Text("Level "+GlobalData.Current_Que_To_Edit.level_no,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                        )
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
                              Text("Points Awarded",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:20,top: 25,bottom: 40),
                    child: SizedBox(width: 100,
                      child: GradientButtonText(
                        ButtonClick: (){
                          int no=0;
                          if(SelectedType=="Fill-in the gaps") {
                            no = ('_'
                                .allMatches(QuestionName.text.toString())
                                .length);
                            print("NUmbers of Dash :"+no.toString());
                          }


                          if( MyQuestionAnswer(SelectedType)=="[]") {

                            CustomShowDialog(context,title: "No Options",msg:
                            "Please Add Some Options");

                          }else if(
                          SelectedType=="Single Answer" && getSelectedOptions()==0
                          ){
                            CustomShowDialog(context,title:

                            "No Option is Selected",msg:
                            "Please Select an Options");
                          }else if(
                          SelectedType=="Multiple Answers" && getSelectedOptions()<2
                          ){
                            CustomShowDialog(context,title:
                            getSelectedOptions()==0?
                            "No Option is Selected":
                            "Only One Option is Selected",msg:
                            "Please Select Two or More Options");
                          }else if(SelectedType=="Fill-in the gaps" && no>Options.length)
                          {

                            print("less number ");

                            CustomShowDialog(context,title: "Less Answers",
                                msg:"Number of answers are less then blanks(_) in the question." );
                          }else
                          {
                            SaveQuizQuestion();
                          }
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
        title: new Text("No Options Added"),
        content: new Text("Please Add Some Options"),
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
      SelectedType.toString() == "" || MyQuestionAnswer(SelectedType) == "") {
    //_showDialog();
    CustomShowDialog(context,msg: "Some Values are Missing",title:
    "Value Missing");
  }else{


    print( "question "+ QuestionName.text.toString()+
        "point_awarded "+ Points.text.toString()+
        "answer_type "+ SelectedType.toString()+
        "quiz_id "+ GlobalData.QuizID+
        "answer_options " + MyQuestionAnswer(SelectedType));


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


    "http://edusupportapp.com/api/create_update_quiz_questions.php", body: {
      "question": QuestionName.text.toString(),
      "point_awarded": Points.text.toString(),
      "answer_type": SelectedType.toString(),
      "quiz_id": GlobalData.QuizID,
      "answer_options": MyQuestionAnswer(SelectedType),
      "level_no": GlobalData.Current_Que_To_Edit.level_no.toString(),
      "ques_no": GlobalData.Current_Que_To_Edit.ques_no.toString(),
      "question_id":GlobalData.Current_Que_To_Edit.id.toString(),
    }).then((response) {
      var statuss = jsonDecode(response.body);
      Navigator.of(context).pushReplacementNamed('Question_List');

    });
  }
}
  int  getSelectedOptions()
  {
    int mySelectedOptions=0;

    for(int i=0;i<Options.length;i++) {
      if(Options[i].trueanswer == true)
      {
        mySelectedOptions++;
      }
    }

    return mySelectedOptions;

  }
}