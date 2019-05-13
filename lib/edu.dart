import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class edu extends StatefulWidget {
  @override
  _eduState createState() => _eduState();
}

class _eduState extends State<edu> {
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
                          color:darkpink,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Supporting,improving",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    "the health of edjucation ",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    "through technology",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),

                  Expanded(child: Text(""),),

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
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //signup_selection

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
