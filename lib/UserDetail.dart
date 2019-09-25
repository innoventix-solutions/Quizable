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

  GlobalData globalData = new GlobalData();

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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),

        ],
      ),
      body: Column(
        children: <Widget>[
          Container( width: MediaQuery.of(context).size.width,

            child: Column(children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  child: CircleAvatar(backgroundImage:GlobalData.Userphoto!=""?
                  NetworkImage(GlobalData.Userphoto):globalData.getgender(),
                    radius: 35.0,
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Teacher's Name",
                                  style: TextStyle(fontSize: 18,
                                    color: GlobalData.lightblue,
                                  fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(controller:teacher,enabled: false,),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Teacher's Discipline",
                                  style: TextStyle(fontSize: 18,
                                      color: GlobalData.lightblue,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(controller:disc,enabled: false,),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Teacher's Email",
                                  style: TextStyle(fontSize: 18,
                                      color: GlobalData.lightblue,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(controller:email,enabled: false,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),




            ],),
          ),
        ],
      ),
    );
  }
}
