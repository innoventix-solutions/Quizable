import 'dart:convert';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class SetAssignmentQuestion extends StatefulWidget {
  @override
  _SetAssignmentQuestionState createState() => _SetAssignmentQuestionState();
}

class _SetAssignmentQuestionState extends State<SetAssignmentQuestion> {
  String SelectedType = 'Fill-in the gaps';
  List<String> ListofTypes = ['Fill-in the gaps','Multiple Answers','Short Essay'];
  List<option> Options = new List();


  List<String> Type = ["fillups","multi","essay"];

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

                                                Options.add(option(trueanswer: Selected,value:optioncontroller.text ));
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Questiaosdnf asd");

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

                                                Navigator.of(context).pushReplacementNamed('dashboard');
                                                ClearRegisterData();
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

              Text("Enter answer in sequence with underscore '_' in between the words",style:
              TextStyle(color: Colors.red),)

            ],
          ),);
      case 'Short Essay':
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text("Teacher’s Instruction:",
                      style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
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
                          Container(child: CustomTextField()
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
        return Text("Not Found");
    }

  }

  String MyQuestionAnswer(String type) {

    switch (type){
      case 'Multiple Answers':
        return jsonEncode(Options).toString();

      case 'Fill-in the gaps':
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
            "Set Assignment Questions",
            style: TextStyle(fontSize: 18),
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
                                  "Question "+((GlobalData.QuestionNumber%int.parse(GlobalData.NosofQuesassignment))+1).toString()+" of "+GlobalData.NosofQuesassignment,
                                  style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                          ),

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
                                Text(SelectedType=="Fill-in the gaps"?"Put '_' in place where gap needs to be displayed":"",style:
                                TextStyle(color: Colors.red),),
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
                /// Mera wala Card
                MyQuestionType(SelectedType),

                ///
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 40),
                      child: SizedBox(width: 100,
                        child: GradientButtonText(
                          linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
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
                          linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                          text: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),




                  ],

                ),
                /* Padding(
                  padding: const EdgeInsets.only(bottom: 25,right: 5),
                  child: GestureDetector(
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Add Questions ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: GlobalData.lightblue),
                        ),Icon(Icons.add_circle,color: GlobalData.lightblue,)
                      ],),onTap: (){

                  },
                  ),
                ),*/


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
          "assignment_id "+ GlobalData.AssignmentID+
          "answer_options " + MyQuestionAnswer(SelectedType));


      http.post(
          "http://edusupportapp.com/api/create_update_assignment_questions.php", body: {
        "question": QuestionName.text.toString(),
        "point_awarded": Points.text.toString(),
        "answer_type": SelectedType.toString(),
        "assignment_id": GlobalData.AssignmentID,
        "answer_options": MyQuestionAnswer(SelectedType),
        "ques_no": ((GlobalData.QuestionNumber%int.parse(GlobalData.NosofQuesassignment))+1).toString(),
      }).then((response) {
        var statuss = jsonDecode(response.body);


        print(response.body.toString());
        //    print(response.body.toString());
        if (statuss['status'] == 1) {
          Options.clear();


          SelectedType = "Fill-in the gaps";
          GlobalData.QuestionNumber++;
          setState(() {

          });
        } else{

        }
        if(GlobalData.QuestionNumber>=(int.parse(GlobalData.NosofQuesassignment)))
        {
          QuizCompleted(context);
        }else {
          Navigator.of(context).pushNamed('SetAssignmentQuestion');
        }
      });
    }
  }
}



