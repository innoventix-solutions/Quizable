import 'package:flutter/material.dart';
import 'global.dart';



class level1 extends StatefulWidget {
  @override
  _level1State createState() => _level1State();
}

class _level1State extends State<level1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Set Quiz Questions",
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


      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[

              Container(
                child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child:
                          levelcomplete(color: blue,heading: "Level 1 Completed",paragraph: "Congratulations! You have completed the questions for Level 1 Quiz. Use the Next button to continue to set questions for Level 2 Quiz.",)

                        ),


                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25,bottom: 40),
                                  child: GradientButtonText(
                                    linearGradient:LinearGradient(colors: <Color>[navy,navyblue]) ,
                                    text: Text("Back",style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 18,),
                                      textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),

                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25,bottom: 40),
                                  child: GradientButtonText(
                                    linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,
                                    text: Text("Next Level",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                                      textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),




                          ],

                          ),
                        ),
























                      ],
                    )),
              ),



            ],),
        ),
      ),


    );
  }
}
