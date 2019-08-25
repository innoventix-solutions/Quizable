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
                                Navigator.of(context).pushNamed('Quiz_List_student');

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
                                Navigator.of(context).pushNamed('MyQuizExerciseLog');
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
