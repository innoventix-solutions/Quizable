import 'package:flutter/material.dart';
import 'global.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: drawer(),
    );
  }
}

class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[gradientblue, gradientviolet],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              'Admin Dashboard',
              style: TextStyle(fontSize: 20),
            ),
          )),


      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: bg12,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: CircleAvatar(backgroundImage: AssetImage('assets/image/pic.png',),
                      radius: 35.0,
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Stanley Ohanugo',style:
                  TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Distance Learning Institute',style:
                  TextStyle(fontSize: 15,color: Colors.white),),
                ),
              ],
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
            DrawerHeader(child: Image.asset('assets/images/bg.png')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('About Edjusupport'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.line_weight),
              title: Text('List Of Classroom'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Edit Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
