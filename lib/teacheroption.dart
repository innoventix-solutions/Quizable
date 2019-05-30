import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class teacheroption extends StatefulWidget {
  @override
  _teacheroptionState createState() => _teacheroptionState();
}

class _teacheroptionState extends State<teacheroption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: bg12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 330,
                width: 320,
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                'Teacher Option',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            new Divider(
                              color: Colors.blue,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                      'As a Teacher, you can join existing classes ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: black)),
                                ),
                                Text(
                                    'by Teacher Admin invitation, then you can ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: black)),
                                Text(
                                    'add students to the class and set tasks for ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: black)),
                                Text(
                                  'your classroom members.  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: black),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'But if you want to create a new class, you',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: black),
                                  ),
                                  Text(
                                    'will need to sign up for an Admin account.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: black),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                'Do you want to set up Admin Account?',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0)),
                                  onPressed: () {
                                    GlobalData.userType = "admin_teacher";
                                    Navigator.of(context)
                                        .pushNamed('accouttypeselect');
                                  },
                                  child: Text(
                                    'Admin',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: RaisedButton(
                                    color: pinkred,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0)),
                                    onPressed: () {
                                      GlobalData.userType = "teacher";
                                      Navigator.of(context)
                                          .pushNamed('register');
                                    },
                                    child: Text(
                                      'Teacher',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
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
  }
}
