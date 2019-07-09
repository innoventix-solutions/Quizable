import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:share/share.dart';

class addteacher extends StatefulWidget {
  @override
  _addteacherState createState() => _addteacherState();
}

class _addteacherState extends State<addteacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Add Teacher",
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
            onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
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
            'Teacher to Messiah Classroom.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Text(
              'Teacher Invite Code',
              style: TextStyle(color: blue, fontSize: 18,fontWeight: FontWeight.bold),
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
    child: IconButton(onPressed: (){Share.share(GlobalData.student_code+" Please use this code to Join the Class.");},
    icon: Icon(
    Icons.share,
    color: Colors.transparent,
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
                          child: TextField(textAlign: TextAlign.center,),

                          ),
                        )),
                  ),
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
                    onPressed: (){},
                    icon: Icon(
                      Icons.share,
                      color: white,
                      size: 20,
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              child: Text('Next Teacher Section',style: TextStyle(
                  color:lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
              ),),onTap: (){},
            ),
          ),],
      ),
    );
  }
}
