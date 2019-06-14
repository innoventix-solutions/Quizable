import 'package:flutter/material.dart';

class cal extends StatefulWidget {
  @override
  _calState createState() => _calState();
}

class _calState extends State<cal> {
  TextEditingController text1 = new TextEditingController();
  TextEditingController text2 = new TextEditingController();

  int Answer=0;


 String Sum(){
   Answer = int.parse(text1.text.toString())+int.parse(text2.text.toString());
    return Answer.toString();

  }




  @override
  Widget build(BuildContext context) {


   return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

            TextField(controller: text1,),
              TextField(controller: text2,),
             RaisedButton(onPressed: (){
               Sum.toString();
             }),
              GestureDetector(child: Text(Sum(),),)
        ],
      ),
      ),
    );
  }
}
