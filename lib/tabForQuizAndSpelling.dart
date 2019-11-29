
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GlobalQuizResults.dart';
import 'GlobalspellingBeeResult.dart';


class tabforms extends StatefulWidget {
  @override
  _tabformsState createState() => _tabformsState();
}

class _tabformsState extends State<tabforms> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true,
          backgroundColor:Colors.green,
          bottom: TabBar(indicator: ShapeDecoration.fromBoxDecoration(BoxDecoration(
              color: Colors.blue
          )),
            indicatorColor:Colors.black,labelColor: Colors.white,labelStyle: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,fontSize: 16),
            tabs: [

              Tab(text: "Quiz Results",),
              Tab(text: "Spelling Bee Results",)
            ],
          ),
          title: Text('My Global Exercises Results',textAlign: TextAlign.start,),
        ),
        body: TabBarView(
          children: [
            GlobalQuizResult(),
            spellingresult(),
          ],
        ),
      ),
    );
  }
}





