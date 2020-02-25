import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';


import 'global.dart';

class parentstudent extends StatefulWidget {
  @override
  _parentstudentState createState() => _parentstudentState();
}

class _parentstudentState extends State<parentstudent> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder( itemCount: 1,

                        itemBuilder: (BuildContext ctxt, int index) {
                          return  GestureDetector(
                            onTap: (){
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:AssetImage('assets/images/man.png'),
                                                )
                                            ),),



                                          ],
                                      ),





                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:30),
                                          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              //Text(GlobalData.Class_list[index].classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                              Padding(
                                                padding: const EdgeInsets.only(top:5),
                                                child: Text("Sd",style: TextStyle(fontSize: 12),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),


                                    ], ),
                                ),
                                new Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: RaisedButton(
                padding: EdgeInsets.only(
                    left: 80, right: 80, top: 10, bottom: 13),
                color: GlobalData.blue,
                child: new Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
//                        print(email.text.toString());
//                        print(pass.text.toString());
                  //login();

                  Navigator.of(context)
                      .pushNamed('login');

                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ), ],
      ),
    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
}
