import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'Pojo/pojo_getassignment.dart';
class assignmentcomplete extends StatefulWidget {
  @override
  _assignmentcompleteState createState() => _assignmentcompleteState();
}

class _assignmentcompleteState extends State<assignmentcomplete> {

  List<Pojo_getassignment> assignment_list = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_assignments.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      assignment_list = (ParsedJson['assignmentsdata'] as List).map((data)=>Pojo_getassignment.fromJson(data)).toList();

      print(assignment_list.length);
      print(jsonEncode(assignment_list).toString());
      setState(() {

      });
    });
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
            "You have completed all the \nquestions for this Assignment \nexercise.\nDo you want to preview \nquestions before publishing?",
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
                    print("ada" + assignment_list.length.toString());
                    GlobalData.EditQuiz = true;
                    GlobalData.AssignmentID = assignment_list[0].id;
                    GlobalData.ExamQuiz = assignment_list[0].assignment_title;
                    GlobalData.NosofQuesassignment=assignment_list[0].total_que;
                    GlobalData.teacherinstruction=assignment_list[0].teacher_instruction;
                    GlobalData.teacherobjective=assignment_list[0].teacher_objective;
                    //  Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');
                    Navigator.of(context).pushReplacementNamed('AssignmentQuestionList');
                  }else{
                    print("ada" + assignment_list.length.toString());
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: levelcomplete(
                              color: GlobalData.blue,
                              heading: "Assignment Completed",


                              paragraph: "Congratulations!...\n You have Completed all Questions for this Assignment."
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, bottom: 40),
                                    child: GradientButtonText(
                                      ButtonClick: () {
                                        showDialog1(context);
                                      },
                                      linearGradient: LinearGradient(
                                          colors: <Color>[
                                            GlobalData.purple,
                                            GlobalData.pink
                                          ]),
                                      text: Text(
                                        "Finish",
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
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
