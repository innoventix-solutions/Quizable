import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/utilities.dart';
import 'global.dart';
import 'package:http/http.dart' as http;


class studentreg extends StatefulWidget {
  @override
  _studentregState createState() => _studentregState();
}

class _studentregState extends State<studentreg> {
  TextEditingController acc = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController selectDate = new TextEditingController();

  TextEditingController par_email = new TextEditingController();
  TextEditingController par_phone = new TextEditingController();

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
    http.post("http://edusupportapp.com/api/register.php", body: {
      "Fullname": acc.text.toString(),
      "Username": username.text.toString(),
      "UserEmail": email.text.toString(),
      "password": password.text.toString(),
      "phone_no": phone.text.toString(),
      "birthdate": selectedDate.toString().substring(0, 10),
      "gender": gendersel.toString(),
      "specification": "",
      "user_type": GlobalData.userType,
      "parents_email": par_email.text.toString(),
      "parents_phone_no": par_phone.text.toString(),
      "accout_type":GlobalData.accounttype,
    }).then((response) {
      print(response.body.toString());

      var statuss = jsonDecode(response.body);


      print("result from Server : "+statuss['status'].toString());

      if (statuss['status'].toString() == "1") {
        Show_toast("Registered Successfully", Colors.green);
      } else {
        Show_toast(statuss['msg'], Colors.red);
      }
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String gendersel = "Male";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: acc,
                        hintColor: blue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "Full Name",
                        icon: Icon(
                          Icons.account_circle,
                          color: lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: username,
                        hintColor: lightblue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "User Name",
                        icon: Icon(
                          Icons.account_circle,
                          color: lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: email,
                        hintColor: lightblue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "Email Address",
                        icon: Icon(
                          Icons.mail,
                          color: lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: phone,
                        hintColor: lightblue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "Phone Number",
                        icon: Icon(
                          Icons.phone_android,
                          color: lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: password,
                        hintColor: lightblue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "Password",
                        icon: Icon(
                          Icons.lock,
                          color: lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: par_email,
                        hintColor: lightblue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "Parent’s Email",
                        icon: Icon(
                          Icons.email,
                          color: lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: par_phone,
                        hintColor: lightblue,
                        hintStyle: TextStyle(
                          color: black,
                        ),
                        hintText: "Parent’s Mobile Number",
                        icon: Icon(
                          Icons.phone_android,
                          color: lightblue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30,right: 30),
                            child: Container(

                                height: 48,
                                decoration: BoxDecoration(
                                    border: Border.all(color: lightblue),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: blue,
                                      ),
                                    ),
                                    Text(
                                      "${selectedDate.toLocal()}"
                                          .substring(0, 10),
                                      style: TextStyle(color: black),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Container(

                          height: 48,
                          decoration: BoxDecoration(
                              border: Border.all(color: lightblue),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: <Widget>[
                              new Radio(
                                value: "Male",
                                groupValue: gendersel,
                                onChanged: (value) {
                                  gendersel = value;
                                  setState(() {});
                                },
                                activeColor: blue,
                              ),
                              new Text(
                                'Male',
                                style:
                                    new TextStyle(fontSize: 16.0, color: black),
                              ),
                              new Radio(
                                value: "Female",
                                groupValue: gendersel,
                                onChanged: (value) {
                                  gendersel = value;
                                  setState(() {});
                                },
                                activeColor: blue,
                              ),
                              new Text(
                                'Female',
                                style:
                                    new TextStyle(fontSize: 16.0, color: black),
                              ),
                              new Radio(
                                value: "Other",
                                groupValue: gendersel,
                                onChanged: (value) {
                                  gendersel = value;
                                  setState(() {});
                                },
                                activeColor: blue,
                              ),
                              new Text(
                                'Other',
                                style:
                                    new TextStyle(fontSize: 16.0, color: black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Center(
                          child: GradientButton(
                            () {
                              Navigator.of(context)
                                  .pushNamed('studentjoin');

                              print(acc.text.toString());
                              print(username.text.toString());
                              print(email.text.toString());
                              print(phone.text.toString());
                              print(password.text.toString());

                              print(par_email.toString());
                              print(par_phone.toString());
                              print(selectedDate.toString().substring(0, 10));
                              print(gendersel.toString());

                              Signup();
                            },
                            "Get Started",
                            LinearGradient(colors: <Color>[purple, pink]),
                          ),
                        ),
                      ),
                      new Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'By creating an account , you agree to our',
                            style: TextStyle(color: black, fontSize: 15),
                          )),
                      new Container(
                          child: Text(
                        'Terms & Conditions and Privacy Policy.',
                        style: TextStyle(color: black, fontSize: 15),
                      )),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have account?',
                            style: TextStyle(color: black, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Text(" "),
                          Text(
                            'Sign In',
                            style: TextStyle(color: blue, fontSize: 20),
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