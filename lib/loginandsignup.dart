import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class loginandsignup extends StatefulWidget {
  @override
  _loginandsignupState createState() => _loginandsignupState();
}

class _loginandsignupState extends State<loginandsignup> {
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
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 40),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "eduSupport",
                      style: TextStyle(
                          color:GlobalData.darkpink,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,)
                    ),
                  ),
                  Text(
                    "Supporting and improving",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    "the health of education ",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    "through technology",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),

                  Expanded(child: Text(""),),

                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(padding:EdgeInsets.only(top:15,bottom: 15),
                              color: Colors.white,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('signup_selection');
                              },
                              child: Text(
                                'Sign Up ',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blue,fontSize: 18),
                              ),
                            ),
                          ),



                        ],

                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(padding:EdgeInsets.only(top:15,bottom: 15),
                              color: GlobalData.blue,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('login');
                              },
                              child: Text(
                                'Log In',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //signup_selection

                  Padding(
                    padding: const EdgeInsets.only(top: 32,bottom: 20),
                    child: Center(
                      child: GestureDetector(
                          child: Text("Parent Login Here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.white,fontSize: 18)),
                          onTap: () {
                            // do what you need to do when "Click here" gets clicked
                          }
                      ),
                    ),
                  )
                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}
