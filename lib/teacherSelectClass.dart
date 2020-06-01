import 'package:flutter/material.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class TeacherSelectClass extends StatefulWidget {
  @override
  _TeacherSelectClassState createState() => _TeacherSelectClassState();
}

class _TeacherSelectClassState extends State<TeacherSelectClass> {

  GlobalData globalData = new GlobalData();

  SharedPreferences preferences;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetMyClasses();
    print(GlobalData.Class_list.length);
    print(GlobalData.userType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "My Class",
            style: TextStyle(fontSize: 22),
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
        child: Column(
          children: <Widget>[
            Expanded(child: ClassesPerAccount()),
            GlobalData.userType == "admin_teacher"
                ? Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('welcome');
                                  },
                                  child: GradientButtonText(
                                    ButtonClick: () {
                                      Navigator.of(context)
                                          .pushNamed('welcome');
                                    },
                                    linearGradient: LinearGradient(
                                        colors: <Color>[
                                          GlobalData.purple,
                                          GlobalData.pink
                                        ]),
                                    text: Text(
                                      "Create New Class",
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(""),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('teacherjoinclass');
                            },
                            child: GradientButtonText(
                              ButtonClick: () {
                                Navigator.of(context)
                                    .pushNamed('teacherjoinclass');
                              },
                              linearGradient: LinearGradient(colors: <Color>[
                                GlobalData.purple,
                                GlobalData.pink
                              ]),
                              text: Text(
                                "Join New Class",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
