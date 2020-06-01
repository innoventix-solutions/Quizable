import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';


class Forgetpassword extends StatefulWidget {
  @override
  _ForgetpasswordState createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {


  TextEditingController emailid = new TextEditingController();

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  forgotpassword() async{

    await http.post("http://edusupportapp.com/api/forgot_password.php",
        body: {
          "user_email":emailid.text.toString(),
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      if (ParsedJson['status'] == 1) {

        GlobalData.Recoveremail=emailid.text.toString();
        print(GlobalData.Recoveremail);

        print(ParsedJson['userdata']['code'].toString());

        GlobalData.Recoverycode=ParsedJson['userdata']['code'].toString();

        GlobalData.uid = ParsedJson['userdata']['ID'].toString();
        print("Recovery code "+ GlobalData.Recoverycode);
        print(ParsedJson['userdata']['ID'].toString());
        print(GlobalData.uid);
        Navigator.of(context).pushNamed('otp');
        Show_toast("Email Sent", Colors.green);

      }
      else {
        Show_toast("Invalid Email address", Colors.red);
      }

      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Forget Password",
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [GlobalData.darkblue, GlobalData.darkpurple],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),
        body:Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text("Enter your Email-ID and we'll send a link on\nyour email to reset your password ",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(controller:emailid,
                    decoration:InputDecoration(hintText: "Enter Registered Email-ID")
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                )
              ],
            ),),


            Container(child: Column(
              children: <Widget>[
                RaisedButton(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("SEND A LINK TO RESET",style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                  ),),
                ),color: GlobalData.navyblue,onPressed: (){
                  forgotpassword();

                },)
              ],
            ),)
          ],
        ),


      ),

    );
  }
}
