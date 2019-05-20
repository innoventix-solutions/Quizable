import 'package:flutter/material.dart';
import 'global.dart';
import 'package:share/share.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: invitecode(),
    );
  }
}

class invitecode extends StatefulWidget {
  @override
  _invitecodeState createState() => _invitecodeState();
}

class _invitecodeState extends State<invitecode> {
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
        title: Text(
          "Create New Classroom",
          style: TextStyle(fontSize: 22),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [gradientblue, gradientviolet],
            ),
          ),
        ),

      ),



      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text('You Successfully Created',
                style: TextStyle(color: black,fontSize: 15),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text('Messiah Classroom',
              style:TextStyle(fontSize: 15,color: gray,fontWeight: FontWeight.bold) ,),
          ),

          Text('Your Classroom Codes are:',
            style: TextStyle(color: black,fontSize: 15),),


          Padding(
            padding: const EdgeInsets.only(top: 65),
            child: Text(
              'Student Invite Code',
              style: TextStyle(color: lightblue, fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(left: 3),
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(10.0),

                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color:Colors.transparent,
                        size: 20,
                      ),
                    )

                ),


                Container(
                    child: Card(elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 45, right: 45),
                            child: Text(
                              '117CBD',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25,color: gray,fontWeight: FontWeight.bold),
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
                      color: lightblue,
                    ),
                    child: IconButton(onPressed: (){Share.share('check out my website https://example.com');},
                      icon: Icon(
                        Icons.share,
                        color: white,
                        size: 20,
                      ),
                    ))
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Teacher Invite Code',
              style: TextStyle(color: lightblue, fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(left: 3),
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(10.0),

                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color:Colors.transparent,
                        size: 20,
                      ),
                    )

                ),


                Container(
                    child: Card(elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 45, right: 45),
                            child: Text(
                              '117CBD',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25,color: gray,fontWeight: FontWeight.bold),
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
                      color: lightblue,
                    ),
                    child: IconButton(onPressed: (){Share.share('check out my website https://example.com');},
                      icon: Icon(
                        Icons.share,
                        color: white,
                        size: 20,
                      ),
                    ))
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              child: Text('Go back to Home Page',style: TextStyle(
                  color:lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
              ),),onTap: (){},
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: GestureDetector(
              child: Text('Other Classrooms',style: TextStyle(
                  color:lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
              ),),onTap: (){},
            ),
          ),



        ],
      ),
    );
  }
}
