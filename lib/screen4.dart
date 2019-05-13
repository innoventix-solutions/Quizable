import 'package:flutter/material.dart';
import 'utilities.dart';
class screen4 extends StatefulWidget {
  @override
  _screen4State createState() => _screen4State();
}

class _screen4State extends State<screen4> {
  Color gradientStart = Colors.blue; //Change start gradient color here
  Color gradientEnd = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          ),
        ),


       child:Column(mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Center(
             child: Container(width: 250,height: 280,
               child: Card(
                 child: Column(mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Container(color: Colors.greenAccent,height: 50,width: 250,
                       child: Column(
                         children: <Widget>[
                           Text('Edju Support',textAlign: TextAlign.center,style: TextStyle(color: Colors.orange,fontSize: 15),),
                           Text('Global Quize & Spelling Bee',textAlign: TextAlign.center,style: TextStyle(color: Colors.deepOrange,fontSize: 15),),

                         ],

                       ),

                     ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text('you dont need any account for'),
                  ),
                     Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Text('Global Quize & Spelling Bee'),
                     ),
                   Padding(
                     padding: const EdgeInsets.only(top: 50),
                     child: Text('there are lots of enlighting'),
                   ),
                   Text('exercise to the global Quize &'),
                   Text('spelling challange interface'),

                     new Container(
                       child:Center(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 15,bottom: 10),
                           child: GradientButton((){},
                             "Proceed",LinearGradient(colors: <Color>[Colors.blue,Colors.purpleAccent]),),
                         ),
                       ),),


                 ],
                 ),

               ),
             ),

           ),
           Padding(
             padding: const EdgeInsets.only(top: 20),
             child: RaisedButton(padding: EdgeInsets.only(left: 80,right: 80,top: 15,bottom: 15),
                 child: new Text("Login",style: TextStyle(color: Colors.blue,),),
                 onPressed:(){},
                 shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
             ),
           ),
Padding(padding: EdgeInsets.only(top: 20)),
           GestureDetector(
               child: Text("Present LogIn Here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
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
