import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:http/http.dart' as http;

import 'Pojo/pojo_getclasses.dart';

class techerjoinclass extends StatefulWidget {
  @override
  _techerjoinclassState createState() => _techerjoinclassState();
}

class _techerjoinclassState extends State<techerjoinclass> {

  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Log Out"),
          content: new Text("Are You Sure Want To Log Out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20
                    ),
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('teacherdashboard');
                        },child: new Text("Cancel")),
                  ),

                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            FlatButton(
              child: Row(
                children: <Widget>[

                  GestureDetector(
                      onTap: () async {
                        LogoutFunction(context);
                        // Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),
                ],
              ),
              onPressed: () async{
                LogoutFunction(context);
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  TextEditingController classjointec = new TextEditingController();

  joinclass() async{
    http.post("http://edusupportapp.com/api/join_class.php",
        body: {
          'UserId':GlobalData.uid,
          'Invite_Code':classjointec.text.toString()
        }).then((response) async {
      print(response.body);
      var statuss = jsonDecode(response.body);
      if (statuss['status'].toString() == "1") {


        await GetClasses(statuss['join_classdata'],statuss['classdata']);





      } else {
        Show_toast_Now(statuss['msg'], Colors.red);

      }
    });

  }

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
            automaticallyImplyLeading: false,
centerTitle: true,
            title: Center(
              child: Text(
                "Join Class",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),

            actions: <Widget>[
              IconButton(onPressed: (){
                showDialog1(context);
              },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 22,
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
                          "Ask Admin Teacher for Class Code then\nenter it here:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: 250,
                            padding: EdgeInsets.only(top: 20),
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
                        child: TextField(controller: classjointec,

                          decoration: InputDecoration(
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
                      linearGradient:
                          LinearGradient(colors: <Color>[GlobalData.purple, GlobalData.pink]),
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

                      }
                      ,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GlobalData.Class_list.isNotEmpty?
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 5),
                      child: Text("Already joined a class?"),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        width: 200,
                        child: GradientButtonText(
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
                        ButtonClick: (){

                          Navigator.of(context)
                              .pushNamed('teacherSelectClass');

                        },),
                      ),
                    ),

                  ],
                ):
                Text(""),

                /*Container(padding: EdgeInsets.only(top: 50),
                    child: Text('or Play Global Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),)),
                Text('&',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),),
                Text('Spelling Challenge',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),)*/
              ],
            ),
          )),
    );
  }
}
