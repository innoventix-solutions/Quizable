import 'dart:async';

import 'package:flutter/material.dart';
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  static const timeout = const Duration(seconds: 3);
  static const ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {  // callback function
   Navigator.of(context).pushNamed('loging_selection');
  }

  @override
  void initState() {
    startTimeout();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/bg.png')
    ,fit: BoxFit.cover)



    ),


    child:Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Image.asset('assets/images/logo.png',width: 100,),
   ], ),),),
    );
  }
}
