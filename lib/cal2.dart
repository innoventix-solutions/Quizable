import 'package:flutter/material.dart';

class cal2 extends StatefulWidget {
  @override
  _cal2State createState() => _cal2State();
}

class _cal2State extends State<cal2> {
  TextEditingController text1 = new TextEditingController();
  TextEditingController text2 = new TextEditingController();

  String total = "";

  sum() {
    total =
        (int.parse(text1.text.toString()) + int.parse(text2.text.toString()))
            .toString();

    setState(() {});
  }

  Sub() {
    total =
        (int.parse(text1.text.toString()) - int.parse(text2.text.toString()))
            .toString();

    setState(() {});
  }

  Mul() {
    total =
        (int.parse(text1.text.toString()) * int.parse(text2.text.toString()))
            .toString();

    setState(() {});
  }

  Div() {
    total =
        (int.parse(text1.text.toString()) / int.parse(text2.text.toString()))
            .toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(controller: text1),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(controller: text2),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text('+'),
                      onPressed: () {
                        sum();
                      }),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text('-'),
                      onPressed: () {
                        Sub();
                      }),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text('*'),
                      onPressed: () {
                        Mul();
                      }),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text('/'),
                      onPressed: () {
                        Div();
                      }),
                ],
              ),
            ],
          ),
          AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),


          Row(
            children: <Widget>[
              RaisedButton(onPressed: (){}),
            ],
          ),
          Row(
            children: <Widget>[
              Text('answer'),
            ],
          ),
          Row(
            children: <Widget>[
              Card(child: RaisedButton(onPressed: (){}),),

              Row(children: <Widget>[
                Text('div'),
              ],)
            ],
          ),


        ],
      ),
    );
  }
}
