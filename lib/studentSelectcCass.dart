import 'package:flutter/material.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class studentselectclass extends StatefulWidget {
  @override
  _studentselectclassState createState() => _studentselectclassState();
}

class _studentselectclassState extends State<studentselectclass> {
  GlobalData globalData = new GlobalData();

  SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
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
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: GlobalData.Class_list.isEmpty
                    ? Text("No Class joined yet",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))
                    : new ListView.builder(
                        itemCount: GlobalData.Class_list.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return GestureDetector(
                            onTap: () async {
                              preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setString("selectedClass",
                                  GlobalData.Class_list[index].id);
                              GlobalData.activeclass =
                                  GlobalData.Class_list[index];
                              GlobalData.class_name=GlobalData.Class_list[index].classname;
                              print(GlobalData.Class_list[index].classname);
                              print(GlobalData.activeclass.classname);
                              Navigator.of(context)
                                  .pushReplacementNamed('studentdashboard');
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            width: 70,
                                            margin: EdgeInsets.only(
                                                left: 20, top: 15, bottom: 10),
                                            child: ClipOval(
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/images/classicon.png',
                                                image: GlobalData
                                                    .Class_list[index]
                                                    .classicon,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                GlobalData.Class_list[index]
                                                    .classname,
                                                style: TextStyle(fontSize: 15),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        }),
              ),
            ),
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
                                  .pushNamed('studentjoinclass');
                            },
                            child: GradientButtonText(
                              ButtonClick: () {
                                Navigator.of(context)
                                    .pushNamed('studentjoinclass');
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('GlobalQuiz');
              },
              child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    'Global Quiz',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: GlobalData.lightblue),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
