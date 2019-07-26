import 'dart:convert';

import 'package:flutter/material.dart';
import 'utilities.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class sec extends StatefulWidget {


  @override
  _secState createState() => _secState();
}

class _secState extends State<sec> {



  TextEditingController acc = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cpass = new TextEditingController();
  TextEditingController disc = new TextEditingController();
  TextEditingController gender = new TextEditingController();





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

  Signup() async {




    print(GlobalData.accounttype);

    http.post("http://edusupportapp.com/api/register.php", body: {
      "Fullname": acc.text.toString(),
      "Username": username.text.toString(),
      "UserEmail": email.text.toString(),
      "password": password.text.toString(),
      "phone_no": phone.text.toString(),
      "specification": disc.text.toString(),
      "birthdate": "11-11-12".toString(),
      "gender": gendersel.toString(),
      "user_type": GlobalData.userType,
     "parents_email": "asdf".toString(),
     "parents_phone_no": "sadf".toString(),
    //  "user_type":"student".toString(),
    "accout_type":GlobalData.accounttype,



    }).then((response) {



      var statuss = jsonDecode(response.body);


      print("result from Server : "+statuss['status'].toString());

      if (statuss['status'].toString() == "1") {
        Show_toast("Registered Successfully", Colors.green);
        Navigator.of(context)
            .pushNamed('login');
      } else {
        Show_toast(statuss['msg'], Colors.red);
      }
    });
  }




  check() {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text.toString());
    if(emailValid == false){

      _showDialog1();
    }
      else
    if (password.text.toString() == cpass.text.toString()) {
      Signup();
    } else {
      _showDialog();
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Password not matched"),
        );
      },
    );
  }

  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Email is incorrect"),
        );
      },
    );
  }



 String gendersel = "Male";



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 25),
              child: Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Image.asset('assets/images/wlogo.png'),
                          ),
                        ),
                      ),

                      CustomTextFieldBorder(
                        controller: acc,
                        hintColor: GlobalData.blue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Account Name",
                        icon: Icon(
                          Icons.account_circle,
                          color: GlobalData.lightblue,
                        ),
                      ),

                      CustomTextFieldBorder(
                        controller: username,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color:GlobalData.black,
                        ),
                        hintText: "User Name",
                        icon: Icon(
                          Icons.account_circle,
                          color: GlobalData.lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: email,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Email Address",
                        icon: Icon(
                          Icons.mail,
                          color: GlobalData.lightblue,
                        ),
                      ),

                      CustomTextFieldBorder(
                        controller: phone,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Phone Number",
                        icon: Icon(
                          Icons.phone_android,
                          color: GlobalData.lightblue,
                        ),
                      ),


                      CustomTextFieldBorder(password:true,
                        controller:
                      password,hintColor: GlobalData.lightblue,hintStyle: TextStyle(color: GlobalData.black,),hintText: "Password",icon: Icon(Icons.lock,color: GlobalData.lightblue,),),

                      CustomTextFieldBorder(password:true,
                        controller:
                        cpass,hintColor: GlobalData.lightblue,hintStyle: TextStyle(color: GlobalData.black,),hintText: "Confirm Password",icon: Icon(Icons.lock,color: GlobalData.lightblue,),),

                      CustomTextFieldBorder(controller:
                      disc,hintColor: GlobalData.lightblue,hintStyle: TextStyle(color: GlobalData.black,),hintText: "Discipline",icon: Icon(Icons.speaker_notes,color: GlobalData.lightblue,),),

                      SizedBox(height: 15.0,),

                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Container(height: 48,decoration: BoxDecoration(border:Border.all(color: GlobalData.lightblue),borderRadius: BorderRadius.circular(30) ),
                          child: Row(
                            children: <Widget>[
                              new Radio(
                                value: "Male",
                                groupValue: gendersel,
                                onChanged:( value ){gendersel = value;
                                setState(() {

                                });

                                },
                                activeColor: GlobalData.blue,
                              ),
                              new Text(
                                'Male',
                                style: new TextStyle(fontSize: 16.0,color: GlobalData.black),
                              ),
                              new Radio(
                                value: "Female",
                                groupValue: gendersel,
                                onChanged: (value ){gendersel= value;
                                setState(() {

                                });},
                                activeColor: GlobalData.blue,
                              ),
                              new Text(
                                'Female',
                                style: new TextStyle(
                                  fontSize: 16.0,color: GlobalData.black
                                ),
                              ),
                              /*new Radio(
                                value: "Other",
                                groupValue: gendersel,
                                onChanged: (value){gendersel = value;
                                setState(() {

                                });},
                                activeColor: blue,
                              ),
                              new Text(
                                'Other',
                                style: new TextStyle(
                                  fontSize: 16.0,color: black
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ),


























                      new Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Center(
                          child: GradientButton(
                            () {

                              print(acc.text.toString());
                              print(username.text.toString());
                              print(email.text.toString());
                              print(phone.text.toString());
                              print(password.text.toString());
                              print(disc.text.toString());

                             // print(selectedDate.toString().substring(0,10));
                              print(gendersel.toString());

                              check();


                              },
                            "Get Started",
                            LinearGradient(colors: <Color>[GlobalData.purple, GlobalData.pink]),

                           ),
                        ),
                      ),


                      new Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'By creating an account , you agree to our',
                            style: TextStyle(color: GlobalData.black, fontSize: 15),
                          )),
                      new Container(
                          child: Text(
                        'Terms & Conditions and Privacy Policy.',
                        style: TextStyle(color: GlobalData.black, fontSize: 15),
                      )),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have account?',
                            style: TextStyle(color: GlobalData.black, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Text(" "),
                          GestureDetector(onTap: (){
                              Navigator.of(context)
                                  .pushNamed('login');
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: GlobalData.blue, fontSize: 20),
                            ),
                          )
                        ],
                      )),

                      /* add child content here */
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


