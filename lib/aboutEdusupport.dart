import 'package:flutter/material.dart';

import 'global.dart';

class AboutEdusupport extends StatefulWidget {
  @override
  _AboutEdusupportState createState() => _AboutEdusupportState();
}

class _AboutEdusupportState extends State<AboutEdusupport> {

  void getdata(){
    DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
        backgroundColor: Color(0Xff1F0BE6),


        title: Center(
          child: Text(
            "About Quizable",
            style: TextStyle(fontSize: 22),
          ),
        ),
        flexibleSpace: Container(
          decoration: bg12,
        ),
        actions: <Widget>[
          IconButton(onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text("Quizable Educational App to manage the new normal of digital classroom. "
        "This app allows teachers to create virtual class, quiz, challenges and assignments"
        " for their students.\n\nQuizable App is suitable for distant learning and allowing educational "
        "institutes to register for and publish class quizzes and exams for their students.",
      style: TextStyle(
      fontSize: 14
    ),),

  ),
            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Advantages for each user role",textAlign: TextAlign.center,style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                constraints: BoxConstraints(

                ),
              ),
            ),

            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("School Admin :",textAlign: TextAlign.center,style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                constraints: BoxConstraints(

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Admin can create classrooms , manage teachers, students and announcement all at one place"),
            ),


            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Teacher :",style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                constraints: BoxConstraints(

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Teacher can create class, send class code to students, create quiz/challenges/assignments and view results"),
            ),
            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Students and regular Users",textAlign: TextAlign.center,style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                constraints: BoxConstraints(
                    maxHeight: 200.0,
                    maxWidth: 200.0,
                    minWidth: 100.0,
                    minHeight: 10.0
                ),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: Text("Students can join class ,attend quiz/challenge/assignment/view leaderboard and results\n\nQuizable Educational App is designed to motivate and inspire students to commit to learning activities."),
           ),

          ],
        ),
      ),
    );
  }
}
