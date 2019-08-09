import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class StudentEditProfile extends StatefulWidget {
  @override
  _StudentEditProfileState createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {


  TextEditingController Name = new TextEditingController(text: GlobalData.Username);



  String image64 = "";
  File _image;

  editprofile()async{

    await http.post("http://edusupportapp.com/api/update_profile.php",
        body:{
          "user_id":GlobalData.uid,
          "image":image64,
          "Fullname":Name.text.toString(),


        }).then((response) async {
      print(response.body);
      var ParsedJson = jsonDecode(response.body);

      if (ParsedJson['status'] == 1) {

        ShowDialog();

        SharedPreferences preferences =  await SharedPreferences.getInstance();
        GlobalData.Username = Name.text;
        preferences.setString("name",GlobalData.Username);
      }else
      {
        ShowDialog();
      }
    });

    setState(() {

    });
  }

  void ShowDialog({String Msg}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(Msg==null?"Updated Successfully":Msg),
        );
      },
    );
  }
  void ShowDialog1({String Msg}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(Msg==null?"Invalid user":Msg),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Edit Profile",
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [GlobalData.darkblue, GlobalData.darkpurple],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 80,width: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/bg.png'),
                          ))),
                ),
                Text("Change Profile"),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Name",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextFieldBorder(controller: Name,),
                          ],
                        ),
                      ),
                    ),


                   /* Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Change Mobile Number",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(),

                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Parent's Email",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(),

                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Parent's Mobile Number",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(),

                          ],
                        ),
                      ),
                    ),*/






                   /* Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Contact:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        child: Text('Via Email',style: TextStyle(
                            color:GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),onTap: (){},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        child: Text('Via SMS',style: TextStyle(
                            color:GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),onTap: (){},
                      ),
                    ),

                    */
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: GradientButtonText(
                        linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                        text: Text("Save Changes",style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 15,),textAlign: TextAlign.center,),
                        ButtonClick: (){editprofile();},
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
