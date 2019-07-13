import 'package:flutter/material.dart';
import 'global.dart';



class quizquestion extends StatefulWidget {
  @override
  _quizquestionState createState() => _quizquestionState();
}

class _quizquestionState extends State<quizquestion> {

  String selectedvalue = "Fill-in the Blanks";

  /*true or false*/
  bool value1 = true;
  bool value2 = true;

  /*multiple answers*/
  bool value3 = true;
  bool value4 = true;
  bool value5 = true;
  bool value6 = true;

  /*single answers*/
  bool value7 = true;
  bool value8 = true;
  bool value9 = true;
  bool value10 = true;


  TextEditingController que = new TextEditingController();
  TextEditingController point = new TextEditingController();







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
              child: Row(children: <Widget>[Icon(Icons.home,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Home',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                )],),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45,top:20),
              child: Row(children: <Widget>[Icon(Icons.assignment,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Assignment Question Bank',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                )],),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45,top:20),
              child: Row(children: <Widget>[Icon(Icons.live_help,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Set Quiz Questions',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                )],),
            ),

            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.offline_pin,color: GlobalData.lightblue,),
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
                                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: GlobalData.blue),

                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text('Question 1 of 25',textAlign: TextAlign.left,
                                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
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
                                    child: TextField(controller: que,decoration: InputDecoration(border: InputBorder.none),
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
                                       Row(
                                         children: <Widget>[
                                           Text("Point Awarded",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                             textAlign:TextAlign.left ,),
                                         ],
                                       ),
                                         TextField(controller: point,
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
                                      Row(
                                        children: <Widget>[
                                          Text("Answer Type",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                            textAlign:TextAlign.left ,),
                                        ],
                                      ),
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
                                                style: TextStyle(color: GlobalData.lightblue,fontWeight: FontWeight.bold,fontSize: 14),),
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
                                    child: Row(
                                      children: <Widget>[
                                        Text("Match provided options",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
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
                                    child: Row(
                                      children: <Widget>[
                                        Text("Answers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
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
                              Icon(Icons.add_circle,color: GlobalData.lightblue,),
                              Text('More',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: GlobalData.lightblue),
                              ),
                            ],),onTap: (){

                        },
                        ),
                      ),



                      /* True or false option */
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
                                    padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Answers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
                                  ),

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
                                      Text("False",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),


                                  Row(
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
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text('* Select True Answer',
                                          style: TextStyle(fontSize: 12,color: GlobalData.pinkred,
                                              fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /* Fill in the blank option */

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
                                    child: Row(
                                      children: <Widget>[
                                        Text("Type true answers in the blank spaces.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
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
                                    child: Row(
                                      children: <Widget>[
                                        Text("Answers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
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
                              Icon(Icons.add_circle,color: GlobalData.lightblue,),
                              Text('More',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: GlobalData.lightblue),
                              ),
                            ],),onTap: (){

                        },
                        ),
                      ),


                      /* Multiple Answer option */
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
                                    padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Select two or more True Answers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
                                  ),

                                  Row(
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
                                      Text("False",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),


                                  Row(
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
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),

                                  Row(
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
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),

                                  Row(
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
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text('* Select True Answer',
                                          style: TextStyle(fontSize: 12,color: GlobalData.pinkred,
                                              fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )



                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                      /* Single Answer option */
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
                                    padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Select one True Answer",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          textAlign:TextAlign.left ,),
                                      ],
                                    ),
                                  ),

                                  Row(
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
                                      Text("False",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),


                                  Row(
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
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),

                                  Row(
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
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Checkbox(
                                        value: value10,
                                        onChanged: (bool value) {
                                          setState(() {
                                            value10 = value;
                                          });
                                        },
                                      ),
                                      Text("True",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Text('* Select True Answer',
                                            style: TextStyle(fontSize: 12,color: GlobalData.pinkred,
                                            fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      )


                                ],
                              ),
                            ),
                          ),
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






                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 40),
                          child: SizedBox(width: 100,
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                              text: Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:20,top: 25,bottom: 40),
                          child: SizedBox(width: 100,
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                            ),
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
                              Text('Add Questions ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: GlobalData.lightblue),
                              ),Icon(Icons.add_circle,color: GlobalData.lightblue,)
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



