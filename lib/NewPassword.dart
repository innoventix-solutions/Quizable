import 'package:flutter/material.dart';
import 'global.dart';

class Newpassword extends StatefulWidget {
  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
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
                  child: TextField(decoration:InputDecoration(hintText: "New Password")
                    ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                )
              ],
            ),),

            Container(child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(decoration:InputDecoration(hintText: "Confirm Password")
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

                },)
              ],
            ),)
          ],
        ),


      ),

    );
  }
}
