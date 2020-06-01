import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Newpassword extends StatefulWidget {
  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {

  TextEditingController password = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();

  bool isloading =false;


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

  UpdatePassword()async{

    await http.post("http://edusupportapp.com/api/update_profile.php",
        body:{
          "user_id":GlobalData.uid,

          "password":password.text.toString(),


        }).then((response) async {
      print(response.body);
      var ParsedJson = jsonDecode(response.body);

      if (ParsedJson['status'] == 1) {

        SharedPreferences preferences =  await SharedPreferences.getInstance();

        Show_toast("Password Updated Successfully.", Colors.green);

        print(ParsedJson['status']);

        Navigator.of(context).pushReplacementNamed('login');
      }


      else
      {

        Show_toast("Please Try After Some Time", Colors.red);

      }
    });

    setState(() {

    });
  }


  changepassword()async{

    isloading = true;
    setState(() {

    });
    if(password.text==null||password.text==""){

      Show_toast("Password is Required", Colors.red);

    }else if(cpassword.text==null||cpassword.text==""){

      Show_toast("Confirm Password is Required", Colors.red);

    }else {

      if(password.text!=cpassword.text)
      {
        Show_toast("Confirm Password is Incorrect", Colors.red);

      }else
      {
        UpdatePassword();
      }

    }


    isloading=false;
    setState(() {

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
              "New Password",
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
                  Text("Reset password",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(controller:password,decoration:InputDecoration(hintText: "New Password")
                    ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                )
              ],
            ),),

            Container(child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(controller:cpassword,decoration:InputDecoration(hintText: "Confirm Password")
                    ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                )
              ],
            ),),



            Container(child: Column(
              children: <Widget>[
                RaisedButton(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("RESET",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                  ),),
                ),color: GlobalData.navyblue,onPressed: (){
                  changepassword();

                },)
              ],
            ),)
          ],
        ),


      ),

    );
  }
}
