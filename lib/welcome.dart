import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:newpro/utilities.dart';
class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
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
        "Welcome",
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
          color: Colors.transparent,
          size: 20,
        ),
      ),
    ],
  ),
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(height: 70,width: 70,margin: EdgeInsets.only(top: 70,bottom: 14),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image:AssetImage('assets/images/user.jpg'),
                )
            )
        ),
      Text('Welcome Stanley Ohanugo',style: TextStyle(fontSize: 20),),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Get Started',style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GradientButtonText(
                      linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,text: Text("Create a Class",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.center,),
                    )),
                ],
              ),SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: GradientButtonText(
                            linearGradient:LinearGradient(colors: <Color>[navy,navyblue]) ,text: Text("Join a Class",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),textAlign: TextAlign.center,),
                          )
                      ),
                    ],
                  ),],
              ),
            ),

          ),
        ),
      ],
    ),
  ),
),

    );
  }
}
