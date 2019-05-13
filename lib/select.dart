import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class select extends StatefulWidget {
  @override
  _selectState createState() => _selectState();
}

class _selectState extends State<select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(


                  child: Column(children: <Widget>[
                    Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize:22),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 42,
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {

                              Navigator.of(context).pushNamed('signup_teacher');

                            },
                            child: Text(
                              'I\'m a Teacher',
                              textAlign: TextAlign.center,
                              style: TextStyle(color:blue,fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(12)),
                        Container(
                          width: 300,
                          height: 42,
                          child: RaisedButton(
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {},
                            child: Text(
                              'I\'m a Student',
                              textAlign: TextAlign.center,
                              style: TextStyle(color:Colors.white,fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
