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
  TextEditingController dob = new TextEditingController();
  TextEditingController gender = new TextEditingController();

  Show_toast(String msg,Color color){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  
  Signup() async{
    
    http.post("http://edusupport.innoventixsolutions.com/insert.php",
    body:{
      "name":acc.text.toString(),
      "uname":username.text.toString(),
      "email":email.text.toString(),
      "password":password.text.toString(),
      "mobile":phone.text.toString(),
      "discipline":disc.text.toString(),
      "dob":dob.text.toString(),
      "gender":gender.text.toString(),
      "role":"1",
      "par_email":"asdf".toString(),
      "par_mobile":"sadf"
    }).then((response){
      print(response.body.toString());

      if(response.body.toString()=="1"){
        Show_toast("Registered Successfully",Colors.green);
      }else
        {
          Show_toast("Something Went Wrong",Colors.red);
        }

    });
    
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                      ),
                    ),

                    MyText(
                      controller: acc,
                      hint: "Account Name",
                      icon2: Icon(Icons.account_circle, color:blue),
                      onPressed: () {},
                    ),

                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: blue,
                            ),
                            hintText: 'User Name',hintStyle: TextStyle(color: black)),
                      ),
                    ),
                    CustomTextFieldBorder(controller:
                      email,hintColor: blue,hintStyle: TextStyle(color: black,),hintText: "Email",icon: Icon(Icons.mail),),

                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: blue,
                            ),
                            hintText: 'Email Address',hintStyle: TextStyle(color: black)),
                      ),
                    ),

                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: phone,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: blue,
                            ),
                            hintText: 'Phone Number',hintStyle: TextStyle(color: black)),
                      ),
                    ),

                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: blue,
                            ),
                            hintText: 'Password',hintStyle: TextStyle(color: black)),
                      ),
                    ),

                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: disc,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.speaker_notes,
                              color: blue,
                            ),
                            hintText: 'Discipline',hintStyle: TextStyle(color: black)),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: dob,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: blue,
                            ),
                            hintText: 'DOB',hintStyle: TextStyle(color: black)),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: gender,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(
                              Icons.line_weight,
                              color: blue,
                            ),
                            hintText: 'Gender',hintStyle: TextStyle(color: black)),
                      ),
                    ),

                    new Container(padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: GradientButton(
                          () {
                            print(acc.text.toString());
                            print(username.text.toString());
                            print(email.text.toString());
                            print(phone.text.toString());
                            print(password.text.toString());
                            print(disc.text.toString());
                            print(dob.text.toString());
                            print(gender.text.toString());
                            Signup();
                          },
                          "Get Started",
                          LinearGradient(
                              colors: <Color>[purple,pink]),
                        ),
                      ),
                    ),

//
//            ),
                    new Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'By creating an account , you agree to our',style: TextStyle(color:black,fontSize: 15),
                        )),
                    new Container(
                        child: Text('Terms & Conditions and Privacy Policy.',style: TextStyle(color: black,fontSize: 15),)),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have account?',style: TextStyle(color: black,fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Text(" "),
                        Text(
                          'Sign In',
                          style: TextStyle(color:blue, fontSize: 20),
                        )
                      ],
                    )),

                    /* add child content here */
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
