import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class screen5 extends StatefulWidget {
  @override
  _screen5State createState() => _screen5State();
}

class _screen5State extends State<screen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Add Student",
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
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
                child: Text(
              'Use this Classroom Code to invite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Text(
            'Students to Messiah Classroom.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Text(
              'Student Invite Code',
              style: TextStyle(color: blue, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

    Container(
    width: 35,
    height: 35,
    margin: EdgeInsets.only(left: 3),
    decoration: new BoxDecoration(
    shape: BoxShape.circle,
    // You can use like this way or like the below line
    //borderRadius: new BorderRadius.circular(10.0),

    ),
    child: IconButton(
    icon: Icon(
    Icons.share,
    color:Colors.transparent,
    size: 20,
    ),
    )),


              Container(
                  child: Card(elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 70, right: 70),
                  child: Text(
                    'code',
                    textAlign: TextAlign.center,
                  ),
                )),
              )),
              Container(
                  width: 35,
                  height: 35,
                  margin: EdgeInsets.only(left: 3),

                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    // You can use like this way or like the below line
                    //borderRadius: new BorderRadius.circular(10.0),
                    color: blue,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: white,
                      size: 20,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
