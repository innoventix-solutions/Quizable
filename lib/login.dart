import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'classroomstudent.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_getclasses.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {



  SharedPreferences prefs;

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  GetShared() async {
    prefs = await SharedPreferences.getInstance();
  }



  @override
  void initState() {
    GetShared();
    // TODO: implement initState
    super.initState();
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  login() async {
    http.post("http://edusupportapp.com/api/login.php", body: {
        "username_email": email.text.toString(),
        "password": pass.text.toString()
      }).then((response) async {
        var statuss = jsonDecode(response.body);
        print(response.body.toString());
      //    print(response.body.toString());
        if (statuss['status'] == 1) {

        if(statuss['join_classdata'] == false ){

          print("error");

        }
        else {
          GlobalData.Class_list =
              (statuss['join_classdata'] as List).map((data) =>
                  Classes.fromJson(data)).toList();
        }
        print(GlobalData.Class_list.length.toString() + "Avilable class");

        Show_toast("Logged in Successfully", Colors.green);
        prefs.setString('Data',await jsonEncode(GlobalData.Class_list));
        prefs.setString("Id", statuss['userdata']['ID']);
        prefs.setString("type", statuss['userdata']['user_type']);
        prefs.setString("name", statuss['userdata']['username']);
        prefs.setString("classname", statuss['userdata']['class_name']);
        GlobalData.Username=statuss['userdata']['username'];
        print(statuss['userdata']['user_type']);
        print(statuss['userdata']['ID']);
        GlobalData.uid = statuss['userdata']['ID'].toString();
        GlobalData.Username = statuss['userdata']['username'].toString();
        GlobalData.class_name = statuss['userdata']['class_name'].toString();

        if (statuss['userdata']['user_type'] == "teacher") {
          Navigator.of(context).pushReplacementNamed(GlobalData.Class_list.isEmpty?'techerjoinclass':'teacherSelectClass');
        } else if (statuss['userdata']['user_type'] == "admin_teacher") {


          Navigator.of(context).pushReplacementNamed(GlobalData.Class_list.isEmpty?'welcome':'teacherSelectClass');
        } else {
        if(GlobalData.Class_list.length == 0) {
          Navigator.of(context).pushReplacementNamed('studentjoin');
        }
        else
          {
            Navigator.of(context).pushReplacementNamed('studentselectclass');
          }
        }
      } else {
            Show_toast("Invalid Username or Password", Colors.red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/wlogo.png',
                  width: 80,
                ),
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
                              hintText: 'Email:',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      Padding(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                            width: 270,
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
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
                              login();
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))),
                      ),
                      
                      Padding(
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



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
