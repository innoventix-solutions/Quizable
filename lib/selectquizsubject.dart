import 'package:flutter/material.dart';
import 'global.dart';


void main() => runApp(MaterialApp(
  home: selectquizsubject(),
));
class selectquizsubject extends StatefulWidget {
  @override
  _selectquizsubjectState createState() => _selectquizsubjectState();
}
class _selectquizsubjectState extends State<selectquizsubject> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Select Quiz Subject",
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
                padding: const EdgeInsets.only(left: 45,top:30),
                child: Row(children: <Widget>[Icon(Icons.home,color: lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Home',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.assignment,color: lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Assignment Question Bank',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.live_help,color: lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Set Quiz Questions',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.offline_pin,color: lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Set Spelling Challenge',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),],),
                ),onTap: (){},
              ),




            ],
          ),
        ),


        body: Padding(
          padding: const EdgeInsets.only(top: 35,left: 25),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: value1,
                      onChanged: (bool value) {
                        setState(() {
                          value1 = value;
                        });
                      },
                    ),
                    Text("Religion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                  ],
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value2,
                        onChanged: (bool value) {
                          setState(() {
                            value2 = value;
                          });
                        },
                      ),
                      Text("Arts & Literature",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),


            Padding(
              padding: const EdgeInsets.only(top: 20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: value3,
                      onChanged: (bool value) {
                        setState(() {
                          value3 = value;
                        });
                      },
                    ),
                    Text("Current Affairs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                  ],
                ),
            ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value4,
                        onChanged: (bool value) {
                          setState(() {
                            value4 = value;
                          });
                        },
                      ),
                      Text("Entertainment & Sports",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value5,
                        onChanged: (bool value) {
                          setState(() {
                            value5 = value;
                          });
                        },
                      ),
                      Text("Geography",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value6,
                        onChanged: (bool value) {
                          setState(() {
                            value6 = value;
                          });
                        },
                      ),
                      Text("History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value7,
                        onChanged: (bool value) {
                          setState(() {
                            value7 = value;
                          });
                        },
                      ),
                      Text("Mathematics",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value8,
                        onChanged: (bool value) {
                          setState(() {
                            value8 = value;
                          });
                        },
                      ),
                      Text("Science",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: value9,
                        onChanged: (bool value) {
                          setState(() {
                            value9 = value;
                          });
                        },
                      ),
                      Text("General Knowledge",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(width: 100,
                    child: GradientButtonText(
                      linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,
                      text: Text("Apply",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                        textAlign: TextAlign.center,),
                    ),
                  ),
                ),



              ],
            ),
          ),
        ));
  }
}