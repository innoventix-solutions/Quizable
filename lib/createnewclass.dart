import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:newpro/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class createnewclass extends StatefulWidget {
  @override
  _createnewclassState createState() => _createnewclassState();
}

class _createnewclassState extends State<createnewclass> {

  TextEditingController classname = new TextEditingController();

  String image64 = "";
  File _image;

  Future getImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight:  200 , maxWidth: 200);
    _image = file;
    List<int> imagebytes = await file.readAsBytesSync();
    image64 = await base64.encode(imagebytes);
    setState(() {});
  }




  createclass() async {
    http.post("http://edusupportapp.com/api/create_class.php",body:{
    "ClassName": classname.text.toString(),
      "UserId":GlobalData.uid,
      "class_icon":image64
    }).then((response){
      print(response.body);

      var Res = jsonDecode(response.body);

      if(Res['status']==1)
        {
         GlobalData.class_name= Res['classdata']['class_name'];
         GlobalData.class_icon= Res['classdata']['class_icon'];
         GlobalData.student_code= Res['classdata']['student_invite_code'];
         GlobalData.teacher_code= Res['classdata']['teacher_invite_code'];

         Navigator.of(context)
             .pushNamed('invitecode');

        }else
          {
            Show_toast_Now(Res['msg'],Colors.green);
          }

      //print(response.body.toString());

    });}


    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(GlobalData.uid);

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Create New Classroom",
              style: TextStyle(fontSize: 20),
            ),
          ),
          flexibleSpace: Container(
            decoration: bg12,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
                size: 10,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
              onTap: (){getImage();},
                  child: Container(
                      height: 95,
                      width: 95,
                      margin: EdgeInsets.only(top: 70, bottom: 14),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:_image!=null?  FileImage(_image): AssetImage('assets/images/user.jpg'),
                          ))),
                ),
                Text(
                  'Upload Classroom Icon',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Name of Classroom',
                              style: TextStyle(
                                color: GlobalData.lightblue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 50, right: 50),
                            child: TextField(
                              controller: classname,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )),
                GradientButtonText(
                  linearGradient: LinearGradient(colors: <Color>[GlobalData.purple, GlobalData.pink]),
                  text: Text(
                    "Create a Class",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  ButtonClick: () {
                    createclass();


                 //print(classname.text.toString());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
