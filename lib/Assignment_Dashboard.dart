import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Assignmentboard extends StatefulWidget {
  @override
  _AssignmentboardState createState() => _AssignmentboardState();
}

class _AssignmentboardState extends State<Assignmentboard> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
             "Assignment Exercise Bank",
              style: TextStyle(fontSize: 18),textAlign: TextAlign.center,
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
              onPressed: (){},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],

        ),
        body:
        SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(onTap: ()async{

                    GlobalData.AssignmentTitle="";
                    GlobalData.NosofQuesassignment="";
                    GlobalData.teacherinstruction="";
                    GlobalData.teacherobjective="";
                    /*Navigator.of(context)
                .pushNamed('developpage');*/
                    Navigator.of(context)
                        .pushNamed('SetAssignment');
                  },

                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Set New Assignment Questions',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray)
                                  ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),





                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed(
                        'Previewassignment');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('My Assignments Exercises Log',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed(
                        'allassignment');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('All Assignments Exercises Log',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed('AssignmentReport');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('My Assignments Results',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed('allassignmentreport');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('All Assignments Results',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),


      ),

    );
  }


}
