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
    http.post("http://edusupport.innoventixsolutions.com/insert.php", body: {
      "name": acc.text.toString(),
      "uname": username.text.toString(),
      "email": email.text.toString(),
      "password": password.text.toString(),
      "mobile": phone.text.toString(),
      "discipline": disc.text.toString(),

      "gender": gender.text.toString(),
      "role": "1",
      "par_email": "asdf".toString(),
      "par_mobile": "sadf"
    }).then((response) {
      print(response.body.toString());

      if (response.body.toString() == "1") {
        Show_toast("Registered Successfully", Colors.green);
      } else {
        Show_toast("Something Went Wrong", Colors.red);
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
                        hintText: "Account Name",
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

                      CustomTextFieldBorder(controller:
                      password,hintColor: lightblue,hintStyle: TextStyle(color: black,),hintText: "Password",icon: Icon(Icons.lock,color: lightblue,),),

                      CustomTextFieldBorder(controller:
                      disc,hintColor: lightblue,hintStyle: TextStyle(color: black,),hintText: "Discipline",icon: Icon(Icons.speaker_notes,color: lightblue,),),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: GestureDetector(

                          onTap: (){
                          _selectDate(context);
                        },
                          child: Container(width: 300,height: 48,decoration: BoxDecoration(border:Border.all(color: lightblue),borderRadius: BorderRadius.circular(30) ),
                              child: Row(
                                children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 5),
                                  child: Icon(
                                  Icons.calendar_today,
                                  color: blue,
                              ),
                                ),
                                  Text("${selectedDate.toLocal()}".substring(0,10),style: TextStyle(color: black),),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(height: 20.0,),

                     Radio(value: "abc", groupValue: null, onChanged: null),






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

                              print(gender.text.toString());
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


