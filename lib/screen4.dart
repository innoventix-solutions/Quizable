import 'package:flutter/material.dart';
import 'utilities.dart';
import 'global.dart';
class screen4 extends StatefulWidget {
  @override
  _screen4State createState() => _screen4State();
}

class _screen4State extends State<screen4> {
  //Color gradientStart = Colors.blue; //Change start gradient color here
  //Color gradientEnd = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [darkblue, darkpurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,

          ),
        ),


        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50,top: 130),
            child: Center(
              child: Container(decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),),),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0,right: 0),
                    child: Card(color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),
                        bottomRight:Radius.circular(10.0), ),),
                      child: Column(children: <Widget>[
                        Container(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("EduSupport",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 55,right: 55,bottom: 5),
                          child: Text("Global Quiz & Spelling bee",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                        ),




                      ],),),
                  ),

                  Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 0,right:0),
                      child: Container(child:
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 30,right: 30),
                        child: Text("You don’t need an account for Global Quiz & Spelling Bee.",textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.black),),
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50,right: 30,left: 30),
                      child: Text("There are lots of enlightening exercises on the Global Quiz & Spelling Challenge interface.",
                        textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),


                    Container(
                      child:Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: GradientButton((){},
                            "Proceed",LinearGradient(colors: <Color>[Colors.blue,Colors.purpleAccent]),),
                        ),
                      ),),
                  ],),


                ],),),
            ),
          ),


          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,right: 0,left: 0),
              child: Container(width: 300.02,height: 53.95,
                child: RaisedButton(color: Colors.white,padding: EdgeInsets.only(left: 50,right: 50),
                    child: new Text("Login",
                      style: TextStyle(color:Colors.blue,fontSize: 18),),onPressed: (){},
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0),)
                ),
              ),
            ),
          ),



          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80,right: 0,left: 0),
              child: Container(width: 300.02,height: 53.95,
                child: GestureDetector(
                  child: Text("Parent Login Here",style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                      decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,),
                ),
              ),
            ),
          ),





        ],),
      ),
    );
  }
}
