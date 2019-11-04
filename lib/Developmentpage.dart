import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
class develop extends StatefulWidget {
  @override
  _developState createState() => _developState();
}

class _developState extends State<develop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Under Development",
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("This page is in under development. Feature will be available soon.",
                  style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
