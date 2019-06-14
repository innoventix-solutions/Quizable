import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: calc()
    );
  }
}

class calc extends StatefulWidget {
  @override
  _calcState createState() => _calcState();
}

class _calcState extends State<calc> {

  final TextEditingController val1 = new TextEditingController();
  final TextEditingController val2 = new TextEditingController();

  String total="0";



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Container(color: Colors.greenAccent,
               child: TextField(controller: val1,decoration: InputDecoration(border: InputBorder.none),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
              child: Container(color: Colors.cyan,
                child: TextField(controller: val2,decoration: InputDecoration(border: InputBorder.none),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Container(color: Colors.white30,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(child: Text('+',
                        style: TextStyle(color: Colors.white,fontSize: 18),),
                        color: Colors.blueGrey,onPressed: (){
                       /* print(
                            int.parse(val1.text)+int.parse(val2.text)
                            );*/

                        total=(int.parse(val1.text.toString())+
                            int.parse(val2.text.toString())).toString();
                        setState(() {

                        });
                        },),
  ),),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(child: Text('-',
                        style: TextStyle(color: Colors.white,fontSize: 18),),
                        color: Colors.blueGrey,onPressed: (){

                        total=(int.parse(val1.text.toString())-
                            int.parse(val2.text.toString())).toString();

                        setState(() {

                        });
                        },),
                    ),),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(child: Text('*',
                        style: TextStyle(color: Colors.white,fontSize: 18),),
                        color: Colors.blueGrey,onPressed: (){
                        total=(int.parse(val1.text.toString())*
                        int.parse(val2.text.toString())).toString();

                        setState(() {

                        });
                        },),
                    ),),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(child: Text('/',
                        style: TextStyle(color: Colors.white,fontSize: 18),),
                        color: Colors.blueGrey,onPressed: (){
                        total=(int.parse(val1.text.toString())/
                        int.parse(val2.text.toString())).toString();

                        setState(() {

                        });
                        },),
                    ),),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(total),
            ),
          ],
        ),
      ),
    );
  }
}


