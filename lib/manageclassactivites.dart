import 'package:flutter/material.dart';
import 'global.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: questionmenu(),
    );
  }
}

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


      /*body: Column(
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
                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
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



          Center(
            child: Container(

              child: Column(

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      <Widget>[


                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(height: 100,width: 150,


                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:bluecard,),


                              child:Center(
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.settings,size: 50,color: Colors.white,),
                                    Text("Manage My",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                    Text("Classrooms",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Container(height: 100,width: 150,


                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:pinkcard,),


                              child:Center(
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.crop_square,size: 60,color: Colors.white,),
                                    Text("Teacher's Board",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        )



                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 15),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 100,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:greencard,),





                          child:Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.local_activity,size: 50,color: Colors.white,),
                                Text("Manage Class",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                Text('Activities',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),


                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Container(height: 100,width: 150,


                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color:orange,),


                              child:Center(
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.speaker_notes,size: 50,color: Colors.white,),
                                    Text("Report",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ),
          ),













          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
                child: Text("Switch Classroom", style: TextStyle(decoration: TextDecoration.underline,
                    color: lightblue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                }
            ),
          ),

        ],
      ),*/


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
    );
  }
}