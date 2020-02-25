import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_getassignment.dart';
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
  String Shortessay="Students Answer";  //5-9-19
  List<String> Type = ["fillups","multi","essay"];

  TextEditingController QuestionName = new TextEditingController();
  TextEditingController Points = new TextEditingController();
  TextEditingController EssayInstructions = new TextEditingController();
  List<Pojo_getassignment> assignment_list = new List();


  void savingquestion(BuildContext context)  {

    bool Selected = false;

    showDialog(barrierDismissible: false,
        context: context,
        builder: (_) => new Dialog(
          child: new Container(
            alignment: FractionalOffset.center,
            height: 80.0,
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                  child: new Text("Saving..."),
                ),
              ],
            ),
          ),
        ));
  }


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
                                                if(optioncontroller.text !=null && optioncontroller.text !="") {


                                                  Options.add(option(
                                                      trueanswer: SelectedType=="Fill-in the gaps"?true:Selected,
                                                      value: optioncontroller
                                                          .text));
                                                  Navigator.of(context).pop();
                                                  setState(() {

                                                  });
                                                }else{
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Questiaosdnf asd");

  }


  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(
            child: new Text(
              "Confirmation",
              style: TextStyle(
                  color: GlobalData.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          content: new Text(
            "You have completed the total\nnumber of questions for this\ class assignment.\nDo you want to preview \nquestions before publishing?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: GlobalData.gray,
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: RaisedButton(
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
                onPressed: () {


                  if(assignment_list.isNotEmpty) {
                    GlobalData.EditQuiz = true;
                    GlobalData.AssignmentID = assignment_list[0].id;
                    GlobalData.ExamQuiz = assignment_list[0].assignment_title;

                    //  Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');
                    Navigator.of(context).pushReplacementNamed('Previewassignment');
                  }else{
                    Show_toast_Now("Please Try after few Seconds", Colors.red);
                  }
                },
                child: Text(
                  'Preview',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: RaisedButton(
                color: Colors.red,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('publishassignment');

                },
                child: Text(
                  'Publish',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            /*FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30
                    ),
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('Question_List');
                        },child: RaisedButton(color: GlobalData.blue,child: new Text("Preview"))),


                  ),
                  GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pushReplacementNamed('Recentque');
                        ClearRegisterData();
                        setState(() {

                        });
                      },child: new Text("Publish")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),*/
          ],
        );
      },
    );
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
                                    padding: const EdgeInsets.all(10.0),

                                    child: Text('Assignment Submitted',textAlign: TextAlign.center,
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
                    child: Container(padding: EdgeInsets.all(5),child: Text(/*"Teacher’s Instruction:"*/
                      Shortessay,
                      style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),

                ],
              ),

              // 5-9-19
              /*Row(
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
        automaticallyImplyLeading: false,
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

                ///
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 40),
                      child: SizedBox(width: 100,
                        child: GradientButtonText(ButtonClick: (){
                          Navigator.of(context).pushNamed('Previewassignment');
                        },
                          linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                          text: Text("Quit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),

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
                              savingquestion(context);
                              SaveAssignmentQuestion();
                            }
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

  SaveAssignmentQuestion()async {
    if (QuestionName.text.toString() == "" || Points.text.toString() == "" ||
        SelectedType.toString() == "" || MyQuestionAnswer(SelectedType) == ""
   ) {
     // _showDialog();
      CustomShowDialog(context,msg: "Some Values are Missing",title:
      "Value Missing");
    }else{


      print( "question "+ QuestionName.text.toString()+
          "point_awarded "+ Points.text.toString()+
          "answer_type "+ SelectedType.toString()+
          "assignment_id "+ GlobalData.AssignmentID+
          "answer_options " + MyQuestionAnswer(SelectedType)+
          "essay_instructions "+ EssayInstructions.text.toString());


      http.post(
          "http://edusupportapp.com/api/create_update_assignment_questions.php", body: {
        "question": QuestionName.text.toString(),
        "point_awarded": Points.text.toString(),
        "answer_type": SelectedType.toString(),
        "assignment_id": GlobalData.AssignmentID,
        "answer_options": MyQuestionAnswer(SelectedType),
        "ques_no": ((GlobalData.QuestionNumber%int.parse(GlobalData.NosofQuesassignment))+1).toString(),
        "essay_instructions": EssayInstructions.text.toString()
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
          Navigator.of(context).pushNamed('assignmentcomplete');
        }else {
          Navigator.of(context).pushNamed('SetAssignmentQuestion');
        }
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



