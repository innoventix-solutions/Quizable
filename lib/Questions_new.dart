import 'dart:convert';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String SelectedType = 'Fill-in the gaps';
  List<String> ListofTypes = ['Fill-in the gaps', 'Match Type', 'Single Answer', 'Multiple Answers','True False'];
  List<option> Options = new List();
  List<MatchClass> Matches = new List();
  String TrueorFalse = "False";
  List<String> Type = ["fillups","matchtype","single","multi","tf"];

  TextEditingController QuestionName = new TextEditingController();
  TextEditingController Points = new TextEditingController();

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
                                      style: TextStyle(color: lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),


                                  new Divider(
                                    color: gray,
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

                                                Options.add(option(trueanswer: Selected,value:optioncontroller.text ));
                                                Navigator.of(context).pop();
                                                setState(() {

                                                });

                                              }
                                            ,linearGradient:
                                            LinearGradient(colors: <Color>[navy,navyblue]),
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
                                      style: TextStyle(color: lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),


                                  new Divider(
                                    color: gray,
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){

                                                Navigator.of(context).pop();
                                                setState(() {

                                                });

                                              }
                                              ,linearGradient:
                                            LinearGradient(colors: <Color>[navy,navyblue]),
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
                                      style: TextStyle(color: lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),


                                  new Divider(
                                    color: gray,
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

                                                Matches.add(MatchClass(val1: value1.text,val2:value2.text ));
                                                Navigator.of(context).pop();
                                                setState(() {

                                                });

                                              }
                                              ,linearGradient:
                                            LinearGradient(colors: <Color>[navy,navyblue]),
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
                    FlatButton.icon(onPressed: (){_confirmDialog(context);}, icon: Icon( Icons.add_circle,color: lightblue,), label: Text("More",style: TextStyle(color: lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
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
                      FlatButton.icon(onPressed: (){_confirmDialogMatches(context);}, icon: Icon( Icons.add_circle,color: lightblue,), label: Text("More",style: TextStyle(color: lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
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
                    FlatButton.icon(onPressed: (){_confirmDialog(context);}, icon: Icon( Icons.add_circle,color: lightblue,), label: Text("More",style: TextStyle(color: lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
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
                    FlatButton.icon(onPressed: (){_confirmDialog(context);}, icon: Icon( Icons.add_circle,color: lightblue,), label: Text("More",style: TextStyle(color: lightblue,fontSize: 15,fontWeight: FontWeight.bold)))
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
                                  Text(Options[index].value)



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
                              Radio(value: "False", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

                              });}),
                              Text("True")



                            ],),),
                          Container(child: Row(
                            children: <Widget>[
                              Radio(value: "True", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

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
        if(TrueorFalse==true){
          Options.add(option(trueanswer: true,value: "True"));
          Options.add(option(trueanswer: false,value: "False"));
        }else
          {
            Options.add(option(trueanswer: false,value: "True"));
            Options.add(option(trueanswer: true,value: "False"));
          }
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
              colors: [darkblue, darkpurple],
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
                        child: Container(padding: EdgeInsets.all(5),color:green,
                            child: Text(
                              "Question "+((GlobalData.QuestionNumber%int.parse(GlobalData.NosofQuesPerLevel))+1).toString()+" of "+GlobalData.NosofQuesPerLevel,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),color:green,
                        child:  Text("Level "+((GlobalData.QuestionNumber/int.parse(GlobalData.NosofQuesPerLevel)).floor()+1).toString()+" of "+GlobalData.QuizLevels,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: TextField(
                                  controller: QuestionName,
                                maxLines: 4,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(border: InputBorder.none,hintText: "Type question here"),
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
                /// Mera wala Card
    MyQuestionType(SelectedType),

                ///
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 40),
                      child: SizedBox(width: 100,
                        child: GradientButtonText(
                          linearGradient:LinearGradient(colors: <Color>[navy,navyblue]) ,
                          text: Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 25,bottom: 40),
                      child: SizedBox(width: 100,
                        child: GradientButtonText(
                          ButtonClick: (){



                            SaveQuizQuestion();


                          },
                          linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,
                          text: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),




                  ],

                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25,right: 5),
                  child: GestureDetector(
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Add Questions ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: lightblue),
                        ),Icon(Icons.add_circle,color: lightblue,)
                      ],),onTap: (){

                  },
                  ),
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
        SelectedType.toString() == "" || MyQuestionAnswer(SelectedType) == "") {
      _showDialog();
    }else{


      print( "question "+ QuestionName.text.toString()+
    "point_awarded "+ Points.text.toString()+
    "answer_type "+ SelectedType.toString()+
    "quiz_id "+ GlobalData.QuizID+
    "answer_options " + MyQuestionAnswer(SelectedType));


    http.post(
        "http://edusupportapp.com/api/create_update_quiz_questions.php", body: {
      "question": QuestionName.text.toString(),
      "point_awarded": Points.text.toString(),
      "answer_type": SelectedType.toString(),
      "quiz_id": GlobalData.QuizID,
      "answer_options": MyQuestionAnswer(SelectedType),


    }).then((response) {
      var statuss = jsonDecode(response.body);


      print(response.body.toString());
      //    print(response.body.toString());
      if (statuss['status'] == 1) {
        Options.clear();
        Matches.clear();

        SelectedType = "Fill-in the gaps";
        GlobalData.QuestionNumber++;
        setState(() {

        });
      } else{

      }
      if(GlobalData.QuestionNumber>=(int.parse(GlobalData.NosofQuesPerLevel)*int.parse(GlobalData.QuizLevels)))
      {
        QuizCompleted(context);
      }else {
        Navigator.of(context).pushNamed('questions');
      }
    });
  }
  }
}



