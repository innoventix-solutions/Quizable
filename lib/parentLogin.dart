import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'Pojo/pojostydentlist.dart';

class parentlogin extends StatefulWidget {
  @override
  _parentloginState createState() => _parentloginState();
}

class _parentloginState extends State<parentlogin> {


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


  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos:1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  SharedPreferences prefs;

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();


  Parentlogin() async {



    http.post("http://edusupportapp.com/api/login.php", body: {
      "username_email": email.text.toString().trim(),
      "type":"parents_login"
    }).then((response) async {
      var statuss = jsonDecode(response.body);
      print(response.body.toString());

      if (statuss['status'] == 1) {
        savingquestion(context);


        //print("CSID "+ GlobalData.CurrentStudentID);
        if (statuss['userdata'].toString()!= null || statuss['userdata'].toString()!= "false") {

          GlobalData.Studentlist = (statuss['userdata'] as List)
              .map((data) => pojouserrslist.fromJson(data))
              .toList();


          print(GlobalData.CurrentStudentID);

        }
        else{

          print("TESTSTDBFBH");
        }

        Show_toast("Logged in Successfully", Colors.green);


/*
        Show_toast("Logged in Successfully", Colors.green);
        prefs.setString("Id", statuss['userdata']['ID']);
        prefs.setString("type", statuss['userdata']['user_type']);
        prefs.setString("name", statuss['userdata']['username']);
        prefs.setString("phone", statuss['userdata']['phone_no']);
        prefs.setString("Fullname", statuss['userdata']['fullname']);
        prefs.setString("UserPhoto", statuss['userdata']['user_photo']);
        prefs.setString("email", statuss['userdata']['email']);
        prefs.setString("disc", statuss['userdata']['specification']);
        prefs.setString("Parentsphone", statuss['userdata']['parents_phone_no']);
        prefs.setString("parentsemail", statuss['userdata']['parents_email']);
        prefs.setString("gender", statuss['userdata']['gender']);
        prefs.setString("signupdate", statuss['userdata']['signup_date']);
        prefs.setString('dob', statuss['userdata']['birthdate']);
        prefs.setString('password', statuss['userdata']['password']);
        prefs.setString('accouttype', statuss['userdata']['accout_type']);
        GlobalData.Username=statuss['userdata']['username'];
        GlobalData.Phone=statuss['userdata']['phone_no'];
        GlobalData.Fullname=statuss['userdata']['fullname'];
        GlobalData.Userphoto=statuss['userdata']['user_photo'];
        GlobalData.email=statuss['userdata']['email'];
        GlobalData.disc=statuss['userdata']['specification'];
        GlobalData.parentsphone=statuss['userdata']['parents_phone_no'];
        GlobalData.parentsemail=statuss['userdata']['parents_email'];
        GlobalData.gendersel = statuss['userdata']['gender'];
        GlobalData.signupdate = statuss['userdata']['signup_date'];
        GlobalData.dob=statuss['userdata']['birthdate'];
        print(statuss['userdata']['user_type']);
        print(statuss['userdata']['ID']);
        GlobalData.uid = statuss['userdata']['ID'].toString();
        GlobalData.Username = statuss['userdata']['username'].toString();
        GlobalData.class_name = statuss['userdata']['class_name'].toString();
        GlobalData.userType = statuss['userdata']['user_type'].toString();
        GlobalData.Phone = statuss['userdata']['phone_no'].toString();
        GlobalData.Fullname = statuss['userdata']['fullname'].toString();
        GlobalData.gendersel = statuss['userdata']['gender'];
        GlobalData.email=statuss['userdata']['email'].toString();
        GlobalData.disc=statuss['userdata']['specification'].toString();
        GlobalData.dob=statuss['userdata']['birthdate'].toString();
        GlobalData.parentsphone=statuss['userdata']['parents_phone_no'].toString();
        GlobalData.parentsemail=statuss['userdata']['parents_email'].toString();
        GlobalData.signupdate = statuss['userdata']['signup_date'].toString();

*/



        Navigator.of(context).pushNamed('parentstudent');


      }
      else{
        Show_toast("Invalid Parent's email or Phone no", Colors.red);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:200),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("Welcome",style: TextStyle(fontSize: 26,color: Colors.white),textAlign: TextAlign.center,),
                 /* Image.asset(
                    'assets/images/wlogo.png',
                    width: 80,
                  ),*/
                 SizedBox(height: 20,),
                 Text("Sign in to continue",style:TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(hintColor: GlobalData.white),
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            controller: email,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(50.0),
                                    borderSide: BorderSide(color: Colors.white)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Email:/Phone Number',
                                hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18)),
                          ),
                        ),
                       /* Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: 300,
                            child: Theme(
                              data: ThemeData(hintColor: GlobalData.white),
                              child: TextField(obscureText: true,
                                style: TextStyle(color: Colors.white, fontSize: 18),
                                controller: pass,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 5),
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(50.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    hintText: 'Password:',
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ),
                        ),*/
                        /*Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                              width: 270,
                              child: Text(
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              )),
                        ),*/
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: RaisedButton(
                              padding: EdgeInsets.only(
                                  left: 80, right: 80, top: 13, bottom: 13),
                              color: GlobalData.blue,
                              child: new Text(
                                "Log in",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
//                        print(email.text.toString());
//                        print(pass.text.toString());
                                //login();
                                Parentlogin();


                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0))),
                        ),

                       /* Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Don't have an account?",style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),

                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 16,
                                fontWeight:FontWeight.bold ),),
                          ),onTap: (){
                          Navigator.of(context)
                              .pushNamed('returnsignup');
                        },
                        ),

*/

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Parentlogin();
  }
}
