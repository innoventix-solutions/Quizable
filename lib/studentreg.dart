import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/utilities.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';



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
      "birthdate": selectDate.toString(),
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
        Navigator.of(context)
            .pushNamed('studentjoin');
      } else {
        Show_toast(statuss['msg'], Colors.red);
      }
    });
  }

  DateTime selectedDate;

  /*Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1975),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }*/

  final formats = {

    InputType.date: DateFormat('yyyy-MM-dd'),

  };

  InputType inputType = InputType.date;
  bool editable = true;
  DateTime Starting_date;


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
                        hintColor: GlobalData.blue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Full Name",
                        icon: Icon(
                          Icons.account_circle,
                          color: GlobalData.lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: username,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
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
                      CustomTextFieldBorder(password: true,
                        controller: password,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Password",
                        icon: Icon(
                          Icons.lock,
                          color: GlobalData.lightblue,
                        ),

                      ),
                      CustomTextFieldBorder(
                        controller: par_email,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Parent’s Email",
                        icon: Icon(
                          Icons.email,
                          color: GlobalData.lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: par_phone,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Parent’s Mobile Number",
                        icon: Icon(
                          Icons.phone_android,
                          color: GlobalData.lightblue,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                        child: Theme(
                          data:ThemeData(hintColor: GlobalData.lightblue) ,
                          child: DateTimePickerFormField(
                            inputType:  inputType,
                            format: formats[inputType],
                            editable: false,
                            decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 5),
                                labelText: 'DOB', hasFloatingPlaceholder: false,border:OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(50.0),
                                    borderSide: BorderSide(color: Colors.white)),prefixIcon: Icon(Icons.calendar_today,color: GlobalData.blue,)),
                            onChanged: (dt) => setState(() => Starting_date = dt),
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
                              border: Border.all(color: GlobalData.lightblue),
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
                                activeColor: GlobalData.blue,
                              ),
                              new Text(
                                'Male',
                                style:
                                new TextStyle(fontSize: 16.0, color: GlobalData.black),
                              ),
                              new Radio(
                                value: "Female",
                                groupValue: gendersel,
                                onChanged: (value) {
                                  gendersel = value;
                                  setState(() {});
                                },
                                activeColor: GlobalData.blue,
                              ),
                              new Text(
                                'Female',
                                style:
                                new TextStyle(fontSize: 16.0, color: GlobalData.black),
                              ),
                              /* new Radio(
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

                              print(par_email.toString());
                              print(par_phone.toString());
                              print(selectedDate.toString());
                              print(gendersel.toString());

                              Signup();
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