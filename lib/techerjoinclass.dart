import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:http/http.dart' as http;

class techerjoinclass extends StatefulWidget {
  @override
  _techerjoinclassState createState() => _techerjoinclassState();
}

class _techerjoinclassState extends State<techerjoinclass> {

  TextEditingController classjointec = new TextEditingController();

  joinclass() async{
    http.post("http://edusupportapp.com/api/join_class.php",
        body: {
          'UserId':GlobalData.uid,
          'Invite_Code':classjointec.text.toString()
        }).then((response){
      print(response.body);
      var statuss = jsonDecode(response.body);
      if (statuss['status'].toString() == "1") {
        Show_toast_Now(statuss['msg'], Colors.green);
        Navigator.of(context)
            .pushNamed('teacherdashboard');

      } else {
        Show_toast_Now(statuss['msg'], Colors.red);

      }
    });

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


                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                  child: Text("Already joined a class?"),
                ),
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
                          .pushNamed('teacherjoinclass');

                    },),
                  ),
                ),

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
