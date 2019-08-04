import 'package:flutter/material.dart';
import 'global.dart';

class GameRoom extends StatefulWidget {
  @override
  _GameRoomState createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "EduSupport Game Room",
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
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
        body:Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text("Tap on games available to open game apps",
              style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: new

              ListView.builder(
                  itemCount: 3,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  GestureDetector(
                      onTap: (){


                      },
                      child: Column(
                        children: <Widget>[
                          Container(

                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image:AssetImage('assets/images/bg.png'),
                                          )
                                      ),),
                                  ],
                                ),





                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Scrabble Game",style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                        Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Text('Punlish',style: TextStyle(fontSize: 12),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                              ], ),
                          ),
                          new Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:10,top: 10),
                    child: Row(
                      children: <Widget>[

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GradientButtonText(
                            linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,text: Text("Go To Dashboard",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),textAlign: TextAlign.center,),
                          ),
                        ),
                      ],
                    ),
                  ) ],
              ),
            ),

          ],
        ),


      ),

    );
  }
}
