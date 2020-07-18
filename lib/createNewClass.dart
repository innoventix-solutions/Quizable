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

  void savingquestion(BuildContext context)  {

    bool Selected = false;

    showDialog(barrierDismissible: false,
        context: context,
        builder: (_) => new Dialog(
          child: new Container(
            alignment: FractionalOffset.center,
            height: 80.0,
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                  child: new Text("Creating..."),
                ),
              ],
            ),
          ),
        ));
  }


  createclass() async {
    http.post(GlobalData.applink+"create_class.php",body:{
    "ClassName": classname.text.toString(),
      "UserId":GlobalData.uid,
      "class_icon":image64
    }).then((response) async {
      print(response.body);

      var Res = jsonDecode(response.body);



      if(Res['status']==1)
        {
          savingquestion(context);

          await GetMyClasses();

         GlobalData.class_name= Res['classdata']['class_name'];
         GlobalData.class_icon= Res['classdata']['class_icon'];
         GlobalData.student_code= Res['classdata']['student_invite_code'];
         GlobalData.teacher_code= Res['classdata']['teacher_invite_code'];
         GlobalData.createdclassdate=Res['classdata']['create_date'];
         GlobalData.classid=Res['classdata']['ID'];
         GlobalData.uid=Res['classdata']['user_id'];
          GlobalData.classadminid=Res['classdata']['user_id'];
          GlobalData.adminaccountname=Res['classdata']['account_name'];
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
                  child: Stack(
                      children: <Widget>[
                        Container(
                        height: 95,
                        width: 95,
                        margin: EdgeInsets.only(top: 70, bottom: 14),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:_image!=null?  FileImage(_image): AssetImage('assets/images/classicon.png'),
                            ))),
                        Positioned(
                          right: 0,bottom: 8,
                          child: GestureDetector(onTap: (){

                            getImage();

                          },
                            child: Card(color: Colors.black,elevation: 5.0,
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(




                                  child:Icon(
                                    Icons.file_upload,
                                    color: Colors.white,
                                    size: 12.0,

                                  ),),
                              ),
                            ),
                          ),
                        ),],
                  ),
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
                  linearGradient: LinearGradient(colors: <Color>[GlobalData.greya, GlobalData.pink]),
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
                    /*if(GlobalData.Class_list.length>=1 && (GlobalData.MyMembership==null ||GlobalData.MyMembership.isActive==false) )
                      {
                        CustomShowDialog(context,title: "Subscription Required",msg:
                        "Please Subscribe to create more Classes.",onPressed:(){
                          Navigator.of(context).pushNamed('ManageAccount');

                        });
                       // Navigator.of(context).pushNamed('ManageAccount');
                      }else {
                      createclass();
                    }*/

                    print(GlobalData.Class_list.length);
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
