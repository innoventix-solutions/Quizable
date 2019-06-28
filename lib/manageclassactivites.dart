import 'package:flutter/material.dart';
import 'global.dart';




class questionmenu extends StatefulWidget {
  @override
  _questionmenuState createState() => _questionmenuState();
}

class _questionmenuState extends State<questionmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Manage Class Activities",
            style: TextStyle(fontSize: 20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [darkblue, darkpurple],
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





      drawer:
      drawerquiz(),




      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: classactivitys(color: pinkred,heading: "Quiz Exercise",paragraph: "The World and Climate Change",),
          ),
        ],
      ),

    );
  }
}
