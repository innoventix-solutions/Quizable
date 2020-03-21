//import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';



class TestingArun extends StatefulWidget {
  @override
  _TestingArunState createState() => _TestingArunState();
}

class _TestingArunState extends State<TestingArun> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Test"),),
      body:
      Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(flex: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    //height: MediaQuery.of(context).size.height / 2.2,
                    decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.black,width: 2))
                  ),
                      child: Column(
                        children: <Widget>[
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),
                          Text("Ds"),


                        ],
                      ),)
                ],
              ),
            ),

            Expanded(
              child: Container(color: Colors.amberAccent,height: MediaQuery.of(context).size.height / 2.2,
                child: Column(children: <Widget>[
                  Text("sdds")
                ],),
              ),
            )
          ],)
        ],
      )
    );
  }
}