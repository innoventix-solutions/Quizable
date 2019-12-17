import 'package:flutter/material.dart';
import 'global.dart';


class Forgetpassword extends StatefulWidget {
  @override
  _ForgetpasswordState createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {


  TextEditingController emailid = new TextEditingController();



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

                },)
              ],
            ),)
          ],
        ),


      ),

    );
  }
}
