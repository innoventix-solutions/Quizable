import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pojo/pojo_getclasses.dart';
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
      print(await prefs.getString("Data"));

      var JionedClassJson = await jsonDecode(await prefs.getString("Data"));
      GlobalData.Class_list = await (JionedClassJson as List).map((data) =>Classes.fromJson(data)).toList();


      print(GlobalData.Class_list.length.toString());
      print(GlobalData.Class_list[0].classname);

      print(jsonEncode(GlobalData.Class_list));

      GlobalData.uid=prefs.get("Id");
      GlobalData.Username=prefs.get("name");
      print( GlobalData.uid+"  "+GlobalData.Username);

      await GetMyClasses();

      if(prefs.get("type")=="teacher")
      {

        print(GlobalData.Class_list.isEmpty);

        Navigator.of(context).pushReplacementNamed(GlobalData.Class_list.isEmpty?'techerjoinclass':'teacherSelectClass');
      }
      else  if(prefs.get("type")=="admin_teacher")
      {
        Navigator.of(context).pushReplacementNamed('welcome');
      }
      else{
        Navigator.of(context).pushReplacementNamed(GlobalData.Class_list.isEmpty?'studentjoinclass':'studentselectclass');
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
