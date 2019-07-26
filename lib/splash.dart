import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  SharedPreferences prefs ;
  GetUserdetails()async{
    prefs = await SharedPreferences.getInstance();
    print(prefs.get("Id"));
    if(prefs.get("Id")!=null)
    {
      GlobalData.uid=prefs.get("Id");
      GlobalData.Username=prefs.get("name");
      print( GlobalData.uid+"  "+GlobalData.Username);
      if(prefs.get("type")=="teacher")
      {
        Navigator.of(context).pushReplacementNamed('techerjoinclass');
      }
      else  if(prefs.get("type")=="admin_teacher")
      {
        Navigator.of(context).pushReplacementNamed('welcome');
      }
      else{
        Navigator.of(context).pushReplacementNamed('studentjoinclass');
      }
    }
    else
    {
      print("Apple");
      Navigator.of(context).pushNamed('loging_selection');
    }
  }

  static const timeout = const Duration(seconds: 3);
  static const ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {  // callback function
    GetUserdetails();
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
    Image.asset('assets/images/wlogo.png',width: 200,),
   ], ),),),
    );
  }
}
