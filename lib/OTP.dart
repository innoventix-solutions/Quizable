import 'package:flutter/material.dart';
import 'global.dart';

class onetimepassword extends StatefulWidget {
  @override
  _onetimepasswordState createState() => _onetimepasswordState();
}

class _onetimepasswordState extends State<onetimepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Forgot Password",
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

      body: Column(mainAxisAlignment: MainAxisAlignment.start ,
        children: <Widget>[
          Container(
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Verfifcation Code",style: TextStyle(
                    color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                  ),),
                )),
          ),

          SizedBox(height: 20,),
          Container(
            child:Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(style: TextStyle(
                fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold,
              ),decoration: InputDecoration(hintText: "Enter OTP Code",),),
            ) ,),

          Container(
            child: RaisedButton(onPressed: (){},
              child: Text("Submit OTP",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
              color: Colors.white),),color: GlobalData.blue,),)
        ],
      ),
    );
  }
}
