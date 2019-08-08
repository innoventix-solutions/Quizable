import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'global.dart';


class AnswerLog extends StatefulWidget {
  @override
  _AnswerLogState createState() => _AnswerLogState();
}

class _AnswerLogState extends State<AnswerLog> {

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Center(
            child: Text(
              "Quiz Report",
              style: TextStyle(fontSize: 20),
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
        body:
          SingleChildScrollView(
            child:Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 5,left: 15),
                    child: Text("Quiz Title",style: TextStyle(color:Colors.black,fontSize: 18),textAlign: TextAlign.left,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(

                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.blue,
                              child: Row(
                                children: <Widget>[
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Level",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  )),
                                ],
                              ),
                            ),
                            Container(

                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(color: Colors.brown,
                                      child: Row(
                                        children: <Widget>[
                                         Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("Question",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(width: 50,),

                                  Container(color: Colors.red,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text("Result",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(

                              child: Row(
                                children: <Widget>[
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(child: Text("Question Title",style: TextStyle(fontWeight: FontWeight.bold),)),
                                  )),

                                ],
                              ),

                            ),

                            Container(

                              child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(child: Text("Your Answer:",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                                  ),

                                ],
                              ),
                            ),
                            Container(

                              child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(child: Text("Correct Answer:",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                                  ),

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

      ),
    );
  }


/*


 */












}
