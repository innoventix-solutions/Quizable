import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class parentlogin extends StatefulWidget {
  @override
  _parentloginState createState() => _parentloginState();
}

class _parentloginState extends State<parentlogin> {

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Parentlogin() async {
    http.post("http://edusupportapp.com/api/login.php", body: {
      "username_email":email.text.toString(),
      "type":"parents_login"

    }).then((response) {
      print(response.body);

      setState(() {

      });
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
                                Navigator.of(context)
                                    .pushNamed('parentstudent');

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
    Parentlogin();
  }
}
