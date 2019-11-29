import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyClassResult extends StatefulWidget {
  @override
  _MyClassResultState createState() => _MyClassResultState();
}

class _MyClassResultState extends State<MyClassResult> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "My Class Results",
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

                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 10,right: 15),
                    child: GestureDetector(
                      child: Container(


                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
                          color:GlobalData.orange,),


                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.assignment,size: 50,color: Colors.white,),
                                  Text("Assignment Results",textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),onTap: (){
                     // Navigator.of(context)
                          //.pushNamed('AssignmentReport');
                    },
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
                    child: GestureDetector(
                      child: Container(


                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
                          color:GlobalData.bluecard,),


                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.assignment_turned_in,size: 50,color: Colors.white,),
                                  Text("Quiz Results",textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),onTap: (){
                      Navigator.of(context)
                          .pushNamed('myquizresult');
                    },
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
                    child: GestureDetector(
                      child: Container(


                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
                          color:GlobalData.pinkred,),


                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.spellcheck,size: 50,color: Colors.white,),
                                  Text("Spelling Challenge Results",textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),onTap: (){
                      Navigator.of(context)
                          .pushNamed('spellinglog');
                    },
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
