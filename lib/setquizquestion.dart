import 'package:flutter/material.dart';
import 'global.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: setquizquestion(),
    );
  }
}

class setquizquestion extends StatefulWidget {
  @override
  _setquizquestionState createState() => _setquizquestionState();
}

class _setquizquestionState extends State<setquizquestion> {
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
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[

          Container(
            child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 40,right: 60),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Teachers Name',
                        style: TextStyle(
                          color: lightblue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                   CustomTextField(),



                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(alignment: Alignment.bottomLeft,
                        child: Text(
                          'Title of Quiz',
                          style: TextStyle(
                            color: lightblue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),CustomTextField(),




                    Center(
                      child: Container(

                        child: Column(

                          children: <Widget>[

                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              <Widget>[


                                SizedBox(height: 150,width: 150,


                                  child: Container
                                    (
                                    child:Center(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Align(alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'Nos. of Quiz Levels.',
                                              style: TextStyle(
                                                color: lightblue,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),CustomTextField(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(height: 150,width: 150,


                                    child: Container
                                      (
                                      child:Center(
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Align(alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Nos. of Questions In each Level.',
                                                style: TextStyle(
                                                  color: lightblue,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),CustomTextField(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                ),



                              ],
                            ),


                          ],
                        ),

                      ),
                    ),




                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Align(alignment: Alignment.bottomLeft,
                        child: Text(
                          'Duration of each Level.',
                          style: TextStyle(
                            color: lightblue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),CustomTextField(),





                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(alignment: Alignment.bottomLeft,
                        child: Text(
                          'Select Quiz Subject Category.',
                          style: TextStyle(
                            color: lightblue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),CustomTextField(),




                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(alignment: Alignment.bottomLeft,
                        child: Text(
                          'Select Class(es)you want to see task.',
                          style: TextStyle(
                            color: lightblue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),CustomTextField(),





                    Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25,bottom: 40),
                        child: GradientButtonText(
                          linearGradient:LinearGradient(colors: <Color>[navy,navyblue]) ,
                          text: Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:20,top: 25,bottom: 40),
                        child: GradientButtonText(
                          linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,
                          text: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
                        ),
                      ),




                    ],

                    ),




                    Padding(
                      padding: const EdgeInsets.only(bottom: 25,right: 5),
                      child: GestureDetector(
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('Set Questions ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: lightblue),
                            ),Icon(Icons.arrow_forward_ios,color: lightblue,size: 18,)
                          ],),onTap: (){

                      },
                      ),
                    ),

                    

















                  ],
                )),
          ),



        ],),
      ),


    );
  }
}
