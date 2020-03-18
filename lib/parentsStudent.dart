import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'Pojo/pojostydentlist.dart';
import 'Pojo/pojo_getclasses.dart';

import 'global.dart';

class parentstudent extends StatefulWidget {
  @override
  _parentstudentState createState() => _parentstudentState();
}

class _parentstudentState extends State<parentstudent> {

  GlobalData globalData = new GlobalData();

/*
  getstudentcount()
  async {

    await http.post("http://edusupportapp.com/api/get_teacher_classes.php"
        ,body: {
          "UserId": GlobalData.uid,
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      GlobalData.Class_list = (pass['join_classdata'] as List).map((data) => Classes.fromJson(data)).toList();

      print(GlobalData.Class_list.length);


      print("UIDDD"+GlobalData.uid);
      setState(() {

      });
    });
  }*/


  /*Getstudent() async {



   await http.post("http://edusupportapp.com/api/login.php", body: {
      "username_email": GlobalData.parentsemail,
      "type":"parents_login"
    }).then((response) async {
      var statuss = jsonDecode(response.body);
      print(response.body.toString());

      if (statuss['userdata'].toString()!= null || statuss['userdata'].toString()!= "false") {
        print(statuss['userdata']);
        GlobalData.Studentlist = (statuss['userdata'] as List)
            .map((data) => pojouserrslist.fromJson(data))
            .toList();
      }
      else{

        print("TESTSTDBFBH");
      }

      print("STUDENTSLIST "+ GlobalData.Studentlist.length.toString());

      setState(() {

      });

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Center(
            child: Text(
             "Student List",
              style: TextStyle(fontSize: 22),textAlign: TextAlign.center,
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
              onPressed: () {
                LogoutFunction(context);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],

        ),
        body:
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: GlobalData.Studentlist.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return
                      Container(

                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    GestureDetector(onTap: (){

                                     GlobalData.uid=GlobalData.Studentlist[index].id.toString();

                                      print("STID: " + GlobalData.Studentlist[index].id.toString());
                                      print("STID: " + GlobalData.Studentlist[index].username.toString());

                                      Navigator.of(context)
                                          .pushNamed('studentsclassroom');


                                    },
                                      child: Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                        decoration: new BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.cover,
//                                              image:GlobalData.Studentlist[index].userphoto!=""? NetworkImage("https://images.pexels.com/photos/1313267/pexels-photo-1313267.jpeg"):
//                                              AssetImage('assets/images/man.png')
                                            image:GlobalData.Studentlist[index].userphoto!=""?
                                            NetworkImage(GlobalData.Studentlist[index].userphoto):
                                            globalData.getUserGender(GlobalData.Studentlist[index].gender),
                                          ),

                                        ),),
                                    ),



                                  ],
                                ),




                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(GlobalData.Studentlist[index].username),
                                        //Text(GlobalData.Studentlist[index].id),

                                      ],
                                    ),
                                  ),
                                ),





                              ], ),

                          ],
                        ),
                      );


                  }
              ),
            ),
            ],
        ),
      ),
    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Getstudent();
    //getstudentcount();

  }
}
