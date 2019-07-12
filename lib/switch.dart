import 'package:flutter/material.dart';
import 'setquizquestion.dart';

class case1 extends StatefulWidget {
  @override
  _case1State createState() => _case1State();
}

class _case1State extends State<case1> {


  String lastans = 'getans';


  var A = 'Fill-in the Blanks';
  var B = 'Single Answer';
  var C = 'Multiple Answers';
  var D = 'Match Type';
  var E = 'True or False';



  String ans(String anstype) {


    switch (anstype) {

      case 'a':

        lastans = "very good";
        break;

      case 'b':
        lastans = "good";
        break;

      case 'c':
        lastans = "avg";
        break;

      case 'd':
        lastans = "bad";
        break;

      case 'e':
       lastans = "worst";
       break;

    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text("a"),onPressed: (){
              ans('a');
            }),
            RaisedButton(child: Text("b"),onPressed: (){
              ans('b');
            }),
            RaisedButton(child: Text("c"),onPressed: (){
              ans('c');
            }),
            RaisedButton(child: Text("d"),onPressed: (){
              ans('d');
            }),
            RaisedButton(child: Text("e"),onPressed: (){
              ans('e');
            }),
            Text(lastans)
          ],
        ),
    ),
      );
  }
}


