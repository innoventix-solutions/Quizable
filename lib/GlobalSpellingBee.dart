import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newpro/global.dart' as prefix0;
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class GlobalSpelling extends StatefulWidget {
  @override
  _GlobalSpellingState createState() => _GlobalSpellingState();
}

class _GlobalSpellingState extends State<GlobalSpelling> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Global Spelling Bee",
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
        Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("No Global Spelling Bee published yet",style: TextStyle(
                  fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
        )


    );
  }
}
