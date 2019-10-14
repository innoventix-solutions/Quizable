import 'package:flutter/material.dart';

import 'GlobalQuizResults.dart';
import 'spellingBeeResult.dart';



class tabform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar( automaticallyImplyLeading: true,
            backgroundColor:Colors.green,
            bottom: TabBar(indicatorColor:Colors.black,labelColor: Colors.white,labelStyle: TextStyle(fontWeight: FontWeight.bold,
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
      ),
    );
  }
}