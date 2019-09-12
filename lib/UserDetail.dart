import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'Pojo/pojostydentlist.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userdetail extends StatefulWidget {
  @override
  _userdetailState createState() => _userdetailState();
}

class _userdetailState extends State<userdetail> {

  TextEditingController email = new TextEditingController(text: GlobalData.email);
  TextEditingController disc = new TextEditingController(text: GlobalData.disc);
  TextEditingController teacher = new TextEditingController(text:GlobalData.Username );
  SharedPreferences shared;
  String image64 = "";
  File _image;

  Future getImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight:  200 , maxWidth: 200);
    _image = file;
    List<int> imagebytes = await file.readAsBytesSync();
    image64 = await base64.encode(imagebytes);
    setState(() {});
  }

  List<pojostydentlist> globlist = new List();


  getstudent()
  async {

    await http.post("http://edusupportapp.com/api/get_user_list_by_class.php"
        ,body: {
          "Class_id": GlobalData.classid,
          "user_type": "teacher"
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      globlist = (pass['user_data'] as List)
          .map((data) => pojostydentlist.fromJson(data))
          .toList();

      print(globlist.length);

      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "User Detail",
            style: TextStyle(fontSize: 20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [GlobalData.darkblue, GlobalData.darkpurple],
            ),
          ),
        ),
        actions: <Widget>[

        ],
      ),
      body: Column(children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            child: CircleAvatar(backgroundImage:GlobalData.Userphoto!=null?
            NetworkImage(GlobalData.Userphoto):AssetImage('assets/images/pic.png',),
              radius: 35.0,
            ),
          ),
        ),


        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Teachers Name',
            style: TextStyle(
              color: GlobalData.lightblue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        CustomTextField(controller:teacher,enabled: false,),

        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Teachers Discipline',
            style: TextStyle(
              color: GlobalData.lightblue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        CustomTextField(controller:disc,enabled: false,),


        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Teachers Email',
            style: TextStyle(
              color: GlobalData.lightblue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        CustomTextField(controller:email,enabled: false,),


      ],),
    );
  }
}
