import 'dart:convert';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class Questionsnew extends StatefulWidget {
  @override
  _QuestionsnewState createState() => _QuestionsnewState();
}

class _QuestionsnewState extends State<Questionsnew> {
  String SelectedType = 'Fill-in the gaps';
  List<String> ListofTypes = ['Fill-in the gaps', 'Match Type', 'Single Answer', 'Multiple Answers','True False'];
  List<option> Options = new List();
  List<MatchClass> Matches = new List();
  String TrueorFalse = "False";
  List<String> Type = ["fillups","matchtype","single","multi","tf"];
  int numbersOfOptionsSelectd=0;



  TextEditingController QuestionName = new TextEditingController();
  TextEditingController Points = new TextEditingController();


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
          if(value1.text !=null && value1.text !="" && value2.text !=null && value2.text !="" ) {

                                                Matches.add(MatchClass(val1: value1.text,val2:value2.text ));
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
                    child: Container(padding: EdgeInsets.all(5),child: Text("List Possible Answer Options",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
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
                                 /* Checkbox(value: Options[index].trueanswer, onChanged: (value){
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
                              Radio(value: "True", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

                              });}),
                              Text("True")



                            ],),),
                          Container(child: Row(
                            children: <Widget>[
                              Radio(value: "False", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

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
        if(TrueorFalse=="True"){
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
        automaticallyImplyLeading: false,
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
                              "Question "+((GlobalData.QuestionNumber%int.parse(GlobalData.NosofQuesPerLevel))+1).toString()+" of "+GlobalData.NosofQuesPerLevel,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                      ),
                      
                      Container(
                          padding: EdgeInsets.all(5),color:GlobalData.green,
                        child:  Text("Level "+((GlobalData.QuestionNumber/int.parse(GlobalData.NosofQuesPerLevel)).floor()+1).toString()//+" of "+GlobalData.QuizLevels,
                          ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
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
                        child: GradientButtonText(ButtonClick: (){
                          Navigator.of(context).pushNamed('previewQuiz');
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
                                SaveQuizQuestion();
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

print("\n\nanswer_options " + MyQuestionAnswer(SelectedType)+"Actual Value"+TrueorFalse);



    http.post(
        "http://edusupportapp.com/api/create_update_quiz_questions.php", body: {
      "question": QuestionName.text.toString(),
      "point_awarded": Points.text.toString(),
      "answer_type": SelectedType.toString(),
      "quiz_id": GlobalData.QuizID,
      "answer_options": MyQuestionAnswer(SelectedType),
      "level_no": ((GlobalData.QuestionNumber/int.parse(GlobalData.NosofQuesPerLevel)).floor()+1).toString(),
      "ques_no": ((GlobalData.QuestionNumber%int.parse(GlobalData.NosofQuesPerLevel))+1).toString(),
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
      if(GlobalData.QuestionNumber%(int.parse(GlobalData.NosofQuesPerLevel))==0&&(GlobalData.QuestionNumber!=0))
      {
        Navigator.of(context).pushNamed('level');
      }else {
        Navigator.of(context).pushReplacementNamed('questions');
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



