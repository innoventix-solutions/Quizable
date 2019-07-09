import 'package:flutter/material.dart';

class fun extends StatefulWidget {
  @override
  _funState createState() => _funState();
}

class _funState extends State<fun> {

  TextEditingController radius = new TextEditingController();

  String Areacircle="AC";

  areacircle(){

    Areacircle= (double.parse(3.14.toString())* (int.parse(radius.text.toString())*
        int.parse(radius.text.toString()))).toString();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(controller:radius,keyboardType:TextInputType.number,decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(color: Colors.white),),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: RaisedButton(color: Colors.green,
                    child:Text("Area Of Circle"),onPressed: (){
                    areacircle();


                    },),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text("Addition is :  "+Areacircle.toString()),
                ),

              ],
            ),
          ),



        ],
      ),
    );
  }
}