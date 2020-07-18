import 'package:flutter/material.dart';
import 'utilities.dart';
import 'global.dart';
class infoofedusupport extends StatefulWidget {
  @override
  _infoofedusupportState createState() => _infoofedusupportState();
}

class _infoofedusupportState extends State<infoofedusupport> {
  //Color gradientStart = Colors.blue; //Change start gradient color here
  //Color gradientEnd = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [GlobalData.darkblue, GlobalData.darkpurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,

          ),
        ),


        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(width: 400, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35),
                  child: Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: GlobalData.blue),

                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: Column(
                                    children: <Widget>[
                                      Text('Quizable',textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Text('Global Quize & Spelling Bee',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),

                                    ],

                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text('you dont need any account for',style: TextStyle(fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Global Quize & Spelling Bee',style: TextStyle(fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text('There are lots of enlighting',style: TextStyle(fontSize: 18),),
                        ),
                        Text('exercise to the global Quize &',style: TextStyle(fontSize: 18),),
                        Text('Spelling challange interface.',style: TextStyle(fontSize: 18),),

                        new Container(
                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 10,left: 20,right: 20),
                              child:GradientButtonText(
                                linearGradient:LinearGradient(colors: <Color>[GlobalData.greya,GlobalData.pink]) ,text: Text("Proceed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,),textAlign: TextAlign.center,),
                              ),
                            ),
                          ),),


                      ],
                    ),

                  ),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(padding: EdgeInsets.only(left: 120,right: 120,top: 15,bottom: 15),
                  child: new Text("Login",style: TextStyle(color: Colors.blue,),),
                  onPressed:(){

                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            GestureDetector(
                child: Text("Parent Login Here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                }
            )

          ],
        ),
      ),
    );
  }
}
