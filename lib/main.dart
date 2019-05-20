import 'package:flutter/material.dart';
import 'globalvar.dart';
import 'sec.dart';
import 'card.dart';
import 'list.dart';
import 'screen4.dart';
import 'screen9.dart';
import 'screen11.dart';
import 'drawer.dart';
import 'login.dart';
import 'splash.dart';
import 'edu.dart';
import 'select.dart';
import 'screen5.dart';
import 'screen7.dart';
import 'screen13.dart';
import 'screen14.dart';
import 'invitecode.dart';
import 'screen25.dart';
import 'screen101.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'yu'),
      home: screen101(),debugShowCheckedModeBanner: false,
    routes: {
      'signup_teacher':(context)=>sec(),
      'login':(context)=>third(),
      'teacher':(context)=>screen4(),
      'loging_selection':(context)=>edu(),
      'signup_selection':(context)=>select(),



    },);
  }
}
class Myapplication extends StatefulWidget {
  @override
  _MyapplicationState createState() => _MyapplicationState();
}

class _MyapplicationState extends State<Myapplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
    image: DecorationImage(
    image:AssetImage('assets/images/bg.png'),
    fit: BoxFit.cover
    ) ,
      ),

        child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
            RaisedButton(color: Colors.white,padding: EdgeInsets.only(left: 80,right: 80),
    child: new Text("I'm a Teacher",style: TextStyle(color: bluecolor),),
    onPressed:(){},
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
    ),
Padding(padding: EdgeInsets.all(5),),
            RaisedButton(color:bluecolor,padding: EdgeInsets.only(left: 80,right: 80),
                child: new Text("I'm a Student",style: TextStyle(color: Colors.white,),),
                onPressed:(){},
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            ),
          ],



        )
      ),





),
    );
  }
}
