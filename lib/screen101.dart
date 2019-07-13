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
            onPressed: (){},
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
                colors: [GlobalData.darkblue, GlobalData.darkpurple],
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
              Text('Welcome Smith',style: TextStyle(fontSize: 20),),
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
                                child: Container(padding: EdgeInsets.only(bottom: 35,top: 20),
                                  child: GradientButtonText(
                                    linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,text: Text("Join a Class",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,),textAlign: TextAlign.center,),
                                  ),
                                )
                            ),
                          ],
                        ),],
                    ),
                  ),

                ),
              ),
              Container(padding: EdgeInsets.only(top: 50),
                  child: Text('or Play Global Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),)),
              Text('&',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),),
              Text('Spelling Challenge',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: GlobalData.lightblue),)
            ],
          ),
        ),
      ),

    );
  }
}
