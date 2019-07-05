import 'package:flutter/material.dart';

class fun extends StatefulWidget {
  @override
  _funState createState() => _funState();
}

class _funState extends State<fun> {

  //static int incre=0;
  //static int decre=0;
  int answer=0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(25.0),
             child: Card(color: Colors.cyan,
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextField(decoration: InputDecoration(border: InputBorder.none),
                 style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
               ),
             ),
           ),


            RaisedButton()

          ],



        ),
      )
    );
  }
}
