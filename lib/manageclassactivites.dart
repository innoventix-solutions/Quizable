import 'package:flutter/material.dart';
import 'global.dart';




class questionmenu extends StatefulWidget {
  @override
  _questionmenuState createState() => _questionmenuState();
}

class _questionmenuState extends State<questionmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Manage Class Activities",
            style: TextStyle(fontSize: 20),
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
            onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),





      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(child: Padding(
              padding: const EdgeInsets.only(bottom: 40,top: 25),
              child: DrawerHeader(child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                        radius: 35.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text('Stanley Ohanugo',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                fontSize: 20),),
                        ),

                          Text('Distance Learning Institute',
                            style: TextStyle(color: Colors.white,fontSize: 15),)
                        ],),
                    )
                  ],),
              ),),
            ),decoration: bg12,),



            Padding(
              padding: const EdgeInsets.only(left: 35,top:30),
              child: Row(children: <Widget>[Icon(Icons.home,color: lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    child: Text('Home',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    onTap: (){Navigator.of(context)
                        .pushNamed('dashboard');},
                  ),
                )],),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.assignment,color: lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Assignment Question Bank',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                )],),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.live_help,color: lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    child: Text('Set Quiz Questions',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                 onTap: (){Navigator.of(context)
                     .pushNamed('setquizquestions');},
                  ),
                )],),
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 35,top:20),
                child: Row(children: <Widget>[Icon(Icons.offline_pin,color: lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Set Spelling Challenge',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),],),
              ),onTap: (){},
            ),




          ],
        ),
      ),




      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: classactivitys(color: pinkred,heading: "Quiz Exercise",paragraph: "The World and Climate Change",),
          ),
        ],
      ),

    );
  }
}
