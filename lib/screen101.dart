import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
class screen101 extends StatefulWidget {
  @override
  _screen101State createState() => _screen101State();
}

class _screen101State extends State<screen101> {
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
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
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
              Text('Welcome Smith',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:gray),),
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 50,right: 50),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Text('Get Started',style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20,),

                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(padding: EdgeInsets.only(bottom: 50,top: 20,right: 25,left: 25),
                                  child: GradientButtonText(
                                    linearGradient:LinearGradient(colors: <Color>[navy,navyblue]) ,
                                    text: Text("Join a Class",style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 18,),textAlign: TextAlign.center,),
                                  ),
                                )
                            ),
                          ],
                        ),],
                    ),
                  ),

                ),
              ),
            Container(padding: EdgeInsets.only(top: 80),
                child: Text('or Play Global Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),)),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('&',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),),
              ),
          Text('Spelling Challenge',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: lightblue),)
            ],
          ),
        ),
      ),

    );
  }
}
