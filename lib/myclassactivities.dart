import 'package:flutter/material.dart';
import 'global.dart';

class myclassactivities extends StatefulWidget {
  @override
  _myclassactivitiesState createState() => _myclassactivitiesState();
}

class _myclassactivitiesState extends State<myclassactivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "My Class Activities",
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
        child: Column(
          children: <Widget>[
            Card(elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text('Class Assignments',style: TextStyle(fontSize: 20,
                    fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                  ],)
                ],),
              ),
            ),
          ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 180,
              //decoration: bg12,
              child: Column(
                children: <Widget>[



                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("New Assignment",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                              },)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                              text: Text("Assignments Log",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                              },)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.pinkred,GlobalData.yellow]) ,
                              text: Text("See my Results",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                              },)
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),


            Padding (
              padding: const EdgeInsets.only(top: 20),
              child: Card(elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Class Quiz',style: TextStyle(fontSize: 20,
                                fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                          ],)
                      ],),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 180,
              //decoration: bg12,
              child: Column(
                children: <Widget>[



                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("New Quiz",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                              },)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                              text: Text("Quiz Exercises Log",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                              },)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.pinkred,GlobalData.yellow]) ,
                              text: Text("See my Results",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                              },)
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Spelling Challenge',style: TextStyle(fontSize: 20,
                                fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                          ],)
                      ],),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 180,
              //decoration: bg12,
              child: Column(
                children: <Widget>[



                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("New Exercise",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                              },)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.pinkred,GlobalData.yellow]) ,
                              text: Text("See my Results",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                              },)
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),






          ],
        ),
      ),
    );
  }
}
