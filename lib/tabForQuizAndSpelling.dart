import 'package:flutter/material.dart';

import 'myQuizResult.dart';
import 'spellingBeeResult.dart';



class tabform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(backgroundColor:Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(text: "Quiz Results",),
                Tab(text: "spelling Bee results",)
              ],
            ),
            title: Text('My Global Exercises Results',textAlign: TextAlign.start,),
          ),
          body: TabBarView(
            children: [
              MyQuizResult(),
              spellingresult(),
            ],
          ),
        ),
      ),
    );
  }
}