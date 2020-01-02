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
            "About EduSupport",
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
    child: Text("EduSupport Virtual Classroom "
        "App is a digital classroom that helps "
        "the teacher manage communication with "
        "students anywhere and anytime."
        "It is an online Educational tool "
        "used by teachers,students and parents "
        "globally for viewing and setting "
        "homework,quiz and spelling bee.\n \n"
        "EduSupport Virtual Classroom App is suitable for all learning situations, such as conventional schools, distant learning, religious and vocational institutes etc. Once your organization has signed up and classes created, you can invite students to join a class and use the App to access all your classes, manage homework, quiz and spelling bee on the go.",style: TextStyle(
      fontSize: 14
    ),),

  ),
            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Benefits for teachers:",textAlign: TextAlign.center,style:
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
              child: Text("- Signed up as institution admin or class teacher.\n"
                  "- Manage students and classroom activities.\n"
                  "- Set task in 5 question types apt for typical educational institutes."),
            ),
            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Benefits for students:",textAlign: TextAlign.center,style:
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
              child: Text("- Keep track of homework \n"
                  "- Take spelling tests and quizzes, and view results \n"
                  "- Submit your work online via the app"),
            ),
            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Benefits for parents:",textAlign: TextAlign.center,style:
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
             child: Text("- Keep track of your children’s school activities. \n"
                 "- View quiz and spelling test results. \n"
                 "- User-friendly feedback between parents and the teacher."),
           ),
            Card(elevation: 5,
              child: Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Global Users",textAlign: TextAlign.center,style:
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
  child:   Text("EduSupport Virtual Classroom App is designed to motivate and inspire students to commit to learning activities. Users also have easy access to educational game apps."),
)
          ],
        ),
      ),
    );
  }
}
