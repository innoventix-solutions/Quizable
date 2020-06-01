import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pojo/pojo_getclasses.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  SharedPreferences prefs ;
  bool isClassSelected =false;
  String selectedClass ="";
  final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();


  getMembershipdetails()async{



    await http.post(
        "http://edusupportapp.com/api/get_user_membership.php",
        body: {
          "uid": GlobalData.uid,
        }).then((response) async {

          print(response.body.toString());

      var ParsedJson = jsonDecode(response.body);


      if(ParsedJson['membershipdata']==false)
        {


          GlobalData.MyMembership = Membership(
              id: 0.toString(),
              enddate: DateTime.now(),
              isActive: false);
          setState(() {

          });

        }else {

          GlobalData.MyMembership = Membership(
         id: ParsedJson['membershipdata']['ID'],
         enddate: DateTime.parse(ParsedJson['membershipdata']['date']),
         isActive: ParsedJson['membershipdata']['is_active']);
     setState(() {

     });
      }
    });

  }


  GetUserdetails()async{
    prefs = await SharedPreferences.getInstance();
    print(prefs.get("Id"));
    if(prefs.get("Id")!=null)
    {

    /*  print(await prefs.getString("Data"));
      var JionedClassJson = await jsonDecode(await prefs.getString("Data"));
      GlobalData.Class_list = await (JionedClassJson as List).map((data) =>Classes.fromJson(data)).toList();
      print(GlobalData.Class_list.length.toString());
   //   print(GlobalData.Class_list[0].classname);
   //   print(jsonEncode(GlobalData.Class_list));*/
      GlobalData.uid=prefs.get("Id");
      GlobalData.Username=prefs.get("name");
      GlobalData.userType=prefs.get("type");
      GlobalData.total_join = prefs.get("joincount");
      GlobalData.Userphoto = prefs.get("UserPhoto");
      GlobalData.email = prefs.get("email");
      GlobalData.Fullname = prefs.get("Fullname");
      GlobalData.accountname = prefs.get("accountname");
      print( GlobalData.uid+"  "+GlobalData.Username);

      getMembershipdetails();


      await GetMyClasses();

      if(prefs.get("type")=="teacher")
      {
        print(GlobalData.Class_list.isEmpty);
        print("i am Teacher");
        if(isClassSelected) {

          GetmyCurrentClass("teacherdashboard");
        }
        else {
          Navigator.of(context).pushReplacementNamed(
              GlobalData.Class_list.isEmpty
                  ? 'techerjoinclass'
                  : 'teacherSelectClass');
        }
      }
      else  if(prefs.get("type")=="admin_teacher")
      { if(isClassSelected) {

        GetmyCurrentClass("teacherdashboard");
      }
      else {
        Navigator.of(context).pushReplacementNamed(
            GlobalData.Class_list.isEmpty ? 'welcome' : 'teacherSelectClass');
      }
      }
      else
        {
        if(isClassSelected) {

          GetmyCurrentClass("studentdashboard");
        }
        else {
          Navigator.of(context).pushReplacementNamed(
              GlobalData.Class_list.isEmpty
                  ? 'studentjoinclass'
                  : 'studentselectclass');
        }
      }
    }
    else
    {
      print("Apple");
      Navigator.of(context).pushReplacementNamed('loging_selection');
    }
  }

  GetShared() async {
    print("asdfs adfb asdifu bas asd b");
    prefs = await SharedPreferences.getInstance();
    print("Selected Class "+(prefs.getString('selectedClass')??""));
    selectedClass =await prefs.getString('selectedClass')??"";

    if(selectedClass!="")
    {
      isClassSelected=true;
    }else
    {
      print("Selected Class "+selectedClass);
    }
    startTimeout();

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


  void registerNotification() {
    firebaseMessaging.requestNotificationPermissions();

    firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      print('onMessage: $message');
      //showNotification(message['notification']);
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      return;
    });
  }

  @override
  void initState() {
    GetShared();
    registerNotification();
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

  GetmyCurrentClass(String NamedPath)
  {


    for(int index=0;index<GlobalData.Class_list.length;index++)
    {
      if(
      GlobalData.Class_list[index].id==selectedClass
      ){
        GlobalData.classid = GlobalData.Class_list[index].id;
        GlobalData.createdclassdate =
            GlobalData.Class_list[index].createddate;
        GlobalData.student_code =
            GlobalData.Class_list[index].studentinvitecode;
        GlobalData.teacher_code =
            GlobalData.Class_list[index].teacherinvitecode;

        GlobalData.class_name =
            GlobalData.Class_list[index].classname;

        GlobalData.activeclass = GlobalData.Class_list[index];
        GlobalData.class_name =
            GlobalData.Class_list[index].classname;

       // GlobalData.adminmembership=GlobalData.Class_list[index].isactive;

        GlobalData.adminmembership=GlobalData.Class_list[index].membershipData==null?"false":
        GlobalData.Class_list[index].membershipData.isActive.toString();

        GlobalData.adminaccountname = GlobalData.Class_list[index].accountname;

        GlobalData.adminaccounttype=GlobalData.Class_list[index].accout_type;

        GlobalData.accountname = GlobalData.Class_list[index].accountname;



        print(GlobalData.Class_list[index].classname);
        print(GlobalData.activeclass.classname);


        print(GlobalData.Class_list[index].accountname);
        print(GlobalData.activeclass.accountname);


        Navigator.of(context)
            .pushReplacementNamed(NamedPath);
      }
    }


  }

}
