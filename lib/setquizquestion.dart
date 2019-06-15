import 'dart:convert';

import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setquizquestion extends StatefulWidget {
  @override
  _setquizquestionState createState() => _setquizquestionState();
}

class _setquizquestionState extends State<setquizquestion> {

  String selectedvalue = "Select Quiz Subject";
  String selectedvalue2 = "Select Class";
  TextEditingController teacher = new TextEditingController(text:GlobalData.Username );
  TextEditingController quiztitle = new TextEditingController(text:GlobalData.QuizTitle );
  TextEditingController quizlevel = new TextEditingController(text: GlobalData.QuizLevels);
  TextEditingController queslevel = new TextEditingController(text: GlobalData.NosofQuesPerLevel);
  TextEditingController durlevel = new TextEditingController(text: GlobalData.DurationofEachLevel);
  TextEditingController quizsubject = new TextEditingController();
  TextEditingController quizclass = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

setalldetails(){
  GlobalData.QuizTitle  = quiztitle.text;
  GlobalData.QuizLevels = quizlevel.text;
  GlobalData.NosofQuesPerLevel = queslevel.text;
  GlobalData.DurationofEachLevel =  durlevel.text;
}


 /* Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Createquiz() async {
    http.post("http://edusupportapp.com/api/create_quiz.php", body: {
      "quiz_title":  quiztitle.text.toString(),
      "no_of_levels": quizlevel.text.toString(),
      "que_each_level": queslevel.text.toString(),
      "dur_each_level": durlevel.text.toString(),
      "quiz_subject": quizsubject.text.toString(),
      "class_id": quizclass.text.toString(),
    }).then((response) {
      var status = jsonDecode(response.body);


      print("result from Server : "+status['status'].toString());

      if (status['status'].toString() == "1") {
        Show_toast("Registered Successfully", Colors.green);
        Navigator.of(context)
            .pushNamed('login');
      } else {
        Show_toast(status['msg'], Colors.red);
      }
    });
  }*/



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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 25),
                child: DrawerHeader(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/pic.png',
                            ),
                            radius: 35.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'Stanley Ohanugo',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                'Distance Learning Institute',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              decoration: bg12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 30),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: lightblue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 20),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.assignment,
                    color: lightblue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Assignment Question Bank',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 20),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.live_help,
                    color: lightblue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Set Quiz Questions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45, top: 20),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.offline_pin,
                      color: lightblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Set Spelling Challenge',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Teachers Name',
                          style: TextStyle(
                            color: lightblue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomTextField(controller:teacher,enabled: false,),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Title of Quiz',
                            style: TextStyle(
                              color: lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(controller: quiztitle,),


                      Center(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      
                                      child: Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Nos. of Quiz Levels.',
                                                  style: TextStyle(
                                                    color: lightblue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              CustomTextField(Inputnumber: true,controller: quizlevel,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text(
                                                    'Nos. of Questions In each Level.',
                                                    style: TextStyle(
                                                      color: lightblue,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                CustomTextField(Inputnumber: true,controller: queslevel,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Duration of each Level.',
                            style: TextStyle(
                              color: lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(controller: durlevel,),


                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Quiz Subject Category.',
                            style: TextStyle(
                              color: lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(width: 400,
                          child: Card(
                            elevation: 5.0, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child:  Container(
                              padding: EdgeInsets.only(top: 15,left: 20,bottom: 15),
                              child:  GestureDetector(
                                child: Row(
                                  children: <Widget>[

                                    Expanded(
                                      child: Text(GlobalData.Selected_subject==null?'Click Select Quiz Subject':GlobalData.Selected_subject,style: TextStyle(
                                          fontSize: 15,fontWeight: FontWeight.bold
                                      ),),
                                    ),

                                  ],
                                ),onTap: (){

                                  setalldetails();

                                Navigator.of(context)
                                    .pushNamed(
                                    'selectsubject');
                              },
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Class(es) you want to see task.',
                            style: TextStyle(
                              color: lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(width: 400,
                          child: Card(
                            elevation: 5.0, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child:  Container(
                              padding: EdgeInsets.only(top: 15,left: 20,bottom: 15),
                              child:  GestureDetector(
                                child: Row(
                                  children: <Widget>[

                                    Expanded(
                                      child: Text('Click to Select Class',style: TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.bold
                                      ),),
                                    ),



                                  ],
                                ),onTap: (){
                                Navigator.of(context)
                                    .pushNamed(
                                    'selectclass');
                              },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 40),
                            child: SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient: LinearGradient(
                                    colors: <Color>[navy, navyblue]),
                                text: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 25, bottom: 40),
                            child: SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:
                                LinearGradient(colors: <Color>[purple, pink]),
                                text: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),ButtonClick: (){

                                  setalldetails();
                                  SaveQuiz();
                                  Navigator.of(context)
                                      .pushNamed(
                                      'questions');
                              },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25, right: 5),
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Set Questions ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: lightblue),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: lightblue,
                                size: 18,
                              )
                            ],
                          ),
                          onTap: () {setalldetails();SaveQuiz();Navigator.of(context)
                              .pushNamed(
                              'questions');},
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

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




  SaveQuiz()async {
    if (GlobalData.QuizTitle == null || GlobalData.QuizLevels == null ||
        GlobalData.NosofQuesPerLevel == null ||
        GlobalData.DurationofEachLevel == null ||
        GlobalData.Selected_subject == null) {

      _showDialog();
    }
    else{
      http.post("http://edusupportapp.com/api/create_quiz.php", body: {
        "quiz_title": GlobalData.QuizTitle,
        "techer_id": GlobalData.uid,
        "no_of_level": GlobalData.QuizLevels,
        "que_each_level": GlobalData.NosofQuesPerLevel,
        "dur_each_level": GlobalData.DurationofEachLevel,
        "quiz_subject": GlobalData.Selected_subject,
        "class_id": "100"
      }).then((response) {
        print(response.body.toString());
        var statuss = jsonDecode(response.body);


        print(response.body.toString());
            print(response.body.toString());
      if(statuss['status']==1){


      }else
      {

      }
        Navigator.of(context)
            .pushNamed(
            'questions');
      }

      );
  }
  }




}
