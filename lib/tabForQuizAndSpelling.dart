
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GlobalQuizResults.dart';
import 'GlobalspellingBeeResult.dart';
import 'global.dart';


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
        appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor:GlobalData.pinkred,
          actions: <Widget>[
            GestureDetector(
                onTap: (){


                  Navigator.of(context).pushReplacementNamed('GlobalDashboard');

                },child: Icon(Icons.exit_to_app))


          ],
          bottom: TabBar(indicator: ShapeDecoration.fromBoxDecoration(BoxDecoration(
              color: Colors.black
          )),
              indicatorColor:Colors.black,labelColor: Colors.white,labelStyle: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,fontSize: 14),
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
            GlobalSpellingResult(),
          ],
        ),
      ),
    );
  }
}





