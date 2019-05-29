import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class adminprofile extends StatefulWidget {
  @override
  _adminprofileState createState() => _adminprofileState();
}

class _adminprofileState extends State<adminprofile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Center(
            child: Text(
              "Admin Profile",
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [darkblue, darkpurple],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/bg.png'),
                      ))),
              Text("Change Profile")
            ],
          ),
        ),
      ),
    );
  }
}
