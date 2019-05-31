import 'package:flutter/material.dart';
import 'global.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: quizquestion(),
    );
  }
}

class quizquestion extends StatefulWidget {
  @override
  _quizquestionState createState() => _quizquestionState();
}

class _quizquestionState extends State<quizquestion> {

  String selectedvalue = "Fill-in the Blanks";
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
                  padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
                          child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: blue),

                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                                child: Text('Question 1 of 25',textAlign: TextAlign.left,
                                                  style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                              ),

                                            ],

                                          ),
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 10,bottom: 35,right: 35),
                                  child: Container(
                                    child: TextField(decoration: InputDecoration(border: InputBorder.none),
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  ),
                                ),





                              ],
                            ),

                          ),
                        ),

                      ),










                      Row(
                        children: <Widget>[
                          Padding(
                           padding: const EdgeInsets.only(top: 25),
                           child: Container(width: 180,height: 80,
                             child: Card(
                                      elevation: 5.0,
                              child:  Container(
                                padding: EdgeInsets.only(top: 5,left: 5),
                                  child:  Column(
                                    children: <Widget>[
                                       Text("Point Awarded",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                         textAlign:TextAlign.left ,),
                                         TextField(
                                           decoration: InputDecoration(border: InputBorder.none),
                                           style: TextStyle(fontSize: 14,),

                                             ),
                                                ],
                                              ),
                                            ),
                                           ),
                           ),
                     ),


                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Container(width: 180,height: 80,
                              child: Card(
                                elevation: 5.0,
                                child:  Container(
                                  padding: EdgeInsets.only(top: 5,left: 5),
                                  child:  Column(
                                    children: <Widget>[
                                      Text("Answer Type",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                        textAlign:TextAlign.left ,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: DropdownButton(
                                          value: selectedvalue,
                                          isDense: true,

                                          onChanged: (String newValue) {
                                            selectedvalue = newValue;

                                            setState(() {});
                                          },
                                          items: [
                                            "Fill-in the Blanks",
                                            "Single Answer",
                                            "Multiple Answers",
                                            "Match Type",
                                            "True or False"
                                          ].map((String value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value,
                                                style: TextStyle(color: lightblue,fontWeight: FontWeight.bold,fontSize: 14),),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),



                      /* Match type Answer option */

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(width: 400,
                          child: Card(
                            elevation: 5.0,
                            child:  Container(
                              padding: EdgeInsets.only(top: 5,left: 5),
                              child:  Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Text("Match provided options",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                      textAlign:TextAlign.left ,),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(width: 400,
                          child: Card(
                            elevation: 5.0,
                            child:  Container(
                              padding: EdgeInsets.only(top: 5,left: 5),
                              child:  Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Text("Answers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                      textAlign:TextAlign.left ,),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Container(width: 160,
                              child: Card(
                                elevation: 5.0,
                                child:  Container(
                                  padding: EdgeInsets.only(top: 5,left: 5),
                                  child:  Column(
                                    children: <Widget>[

                                      TextField(
                                        decoration: InputDecoration(border: InputBorder.none),
                                        style: TextStyle(fontSize: 14,),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Container(width: 160,
                                child: Card(
                                  elevation: 5.0,
                                  child:  Container(
                                    padding: EdgeInsets.only(top: 5,left: 5),
                                    child:  Column(
                                      children: <Widget>[

                                        TextField(
                                          decoration: InputDecoration(border: InputBorder.none),
                                          style: TextStyle(fontSize: 14,),

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.only(bottom: 25,right: 5,top: 20),
                        child: GestureDetector(
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add_circle,color: lightblue,),
                              Text('More',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: lightblue),
                              ),
                            ],),onTap: (){

                        },
                        ),
                      ),





















                      /*Center(
                        child: Container(

                          child: Column(

                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  <Widget>[



                                    SizedBox(height: 150,width: 175,


                                      child: Container
                                        (
                                        child:Center(
                                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
                                            child: Card(shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: blue),

                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 5,bottom: 5),
                                                            child: Column(
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                                                  child: Text('Question 1 of 25',textAlign: TextAlign.left,
                                                                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                                                ),

                                                              ],

                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 10,left: 10,bottom: 35,right: 35),
                                                    child: Container(
                                                      child: TextField(decoration: InputDecoration(border: InputBorder.none),
                                                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                                    ),
                                                  ),





                                                ],
                                              ),

                                            ),
                                          ),

                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(height: 150,width: 175,
                                        child: Container(


                                          child: Container
                                            (
                                            child:Center(
                                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
                                                child: Card(shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: blue),

                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                                                                      child: Text('Question 1 of 25',textAlign: TextAlign.left,
                                                                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                                                    ),

                                                                  ],

                                                                ),
                                                              ),

                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 10,left: 10,bottom: 35,right: 35),
                                                        child: Container(
                                                          child: TextField(decoration: InputDecoration(border: InputBorder.none),
                                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                                        ),
                                                      ),





                                                    ],
                                                  ),

                                                ),
                                              ),

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
                      ),*/






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
                              Text('Add Questions ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: lightblue),
                              ),Icon(Icons.add_circle,color: lightblue,)
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
