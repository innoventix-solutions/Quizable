import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

import 'Pojo/pojo_getclasses.dart';

class studentjoin extends StatefulWidget {
  @override
  _studentjoinState createState() => _studentjoinState();
}

class _studentjoinState extends State<studentjoin> {

  joinclass() async{
    http.post("http://edusupportapp.com/api/join_class.php",
        body: {
          'UserId':GlobalData.uid,
          'Invite_Code':classjoinstu.text.toString()
        }).then((response) async {
      print(response.body);
      var statuss = jsonDecode(response.body);
      if (statuss['status'].toString() == "1") {
        Show_toast_Now(statuss['msg'], Colors.green);
        await GetClasses(statuss['join_classdata'],statuss['classdata']);


      } else {
        Show_toast_Now(statuss['msg'], Colors.red);
      }
    });

  }
  TextEditingController classjoinstu = new TextEditingController();

  void GetClasses(var Data,var CurrentClass) async
  {

    GlobalData.activeclass = Classes(id:CurrentClass['ID'],classname:CurrentClass['class_name'],classicon: CurrentClass['class_icon'],studentinvitecode: CurrentClass['student_invite_code'],teacherinvitecode:CurrentClass['teacher_invite_code'],   ) ;
    GlobalData.class_name=GlobalData.activeclass.classname;
    GlobalData.Class_list = await (Data as List).map((data) =>Classes.fromJson(data)).toList();
    Navigator.of(context).pushNamed('teacherdashboard');

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,

            title: Center(
              child: Text(
                "Join Class",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),

            actions: <Widget>[
              IconButton(onPressed: (){},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                  size: 10,
                ),
              ),
            ],backgroundColor: Color(0Xff1F0BE6),
          ),

          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Ask Teacher for Class Code then \nenter it here:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: 250,
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Class Code',
                              style: TextStyle(
                                  color: GlobalData.lightblue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 50, right: 50),
                        child: TextField(controller: classjoinstu,decoration: InputDecoration(
                            border: InputBorder.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    width: 200,
                    child: GradientButtonText(
                      linearGradient: LinearGradient(colors: <Color>[GlobalData.purple, GlobalData.pink]),
                      text: Text(
                        "Join",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                   ButtonClick: (){
                    joinclass();
                   }, ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                  child: Text("Already joined a class?"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    width: 200,
                    child: GradientButtonText(
                      ButtonClick: (){
                        Navigator.of(context)
                            .pushNamed('studentdashboard');
                      },
                      linearGradient:
                      LinearGradient(colors: <Color>[GlobalData.navy, GlobalData.navyblue]),
                      text: Text(
                        "Proceed",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                Container(padding: EdgeInsets.only(top: 50),
                    child: Text('or Play Global Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),)),
                Text('&',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),),
                Text('Spelling Challenge',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),)
              ],
            ),
          )),
    );
  }
}
