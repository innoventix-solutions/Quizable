import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class studentjoin extends StatefulWidget {
  @override
  _studentjoinState createState() => _studentjoinState();
}

class _studentjoinState extends State<studentjoin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Center(
              child: Text(
                "Join Class",
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
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                  size: 10,
                ),
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Ask Teacher for Class Code then\n enter it here:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: 250,
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Class Code',
                              style: TextStyle(
                                  color: lightblue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 50, right: 50),
                        child: TextField(decoration: InputDecoration(
                            border: InputBorder.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    width: 200,
                    child: GradientButtonText(
                      linearGradient:
                      LinearGradient(colors: <Color>[purple, pink]),
                      text: Text(
                        "Join",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 40),
                  child: Container(
                    width: 200,
                    child: GradientButtonText(
                      linearGradient:
                      LinearGradient(colors: <Color>[navy, navyblue]),
                      text: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                Container(padding: EdgeInsets.only(top: 50),
                    child: Text('or Play Global Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),)),
                Text('&',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),),
                Text('Spelling Challenge',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),)
              ],
            ),
          )),
    );
  }
}
