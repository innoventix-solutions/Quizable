import 'package:flutter/material.dart';
import 'global.dart';

class myquizexercise extends StatefulWidget {
  @override
  _myquizexerciseState createState() => _myquizexerciseState();
}

class _myquizexerciseState extends State<myquizexercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "My Quiz Exercises",
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



      drawer:drawerquiz(),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[




            Container(
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(gradient: LinearGradient(
                colors: <Color>[GlobalData.pinkred, GlobalData.yellow],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,),),

              child: Column(

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 30,right:20,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            linearGradient:LinearGradient(begin:Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.yellow,Colors.yellow]) ,
                            text: Text("New",
                              style: TextStyle(color: GlobalData.gray,
                                fontWeight: FontWeight.bold,fontSize: 15,),
                              textAlign: TextAlign.center,),
                            ButtonClick: (){
                            },),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('20-02-2019',style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                          ),),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 30),
                    child: Row(
                      children: <Widget>[
                        Text('The World and Climate Change',style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 30),
                        child: Row(
                          children: <Widget>[
                            Text('Level 1',style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('105 Minutes',style: TextStyle(
                                  fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top:25,left: 30,right: 20,bottom: 20),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            linearGradient:LinearGradient(begin:Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[GlobalData.gray,GlobalData.gray]) ,
                            text: Text("Closing",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 15,),
                              textAlign: TextAlign.center,),
                            ButtonClick: (){
                            },),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Sat. 27 Mar, 2019, 12:00',style:TextStyle(
                              fontSize: 15,color: GlobalData.white
                          ) ,),
                        )
                      ],
                    ),
                  ),


                ],
              ),

            ),




            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 15),
                    child: Card(elevation: 5.0,color: GlobalData.white,
                      child:Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 10 ),
                                  child: Text("Quiz Title",style: TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold
                                  ),),
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: RaisedButton(child: Text("Status",style: TextStyle(
                                    color: GlobalData.white
                                  ),),
                                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Levels"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("Time"),
                              ),
                            ],),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: RaisedButton(child: Text("Status",style: TextStyle(color: GlobalData.white,

                                  ),),
                                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Date"),
                                ),
                              ],
                            ),
                          ),



                        ],
                      ) ,),
                  )
                ],
              ) ,)




          ],
        ),
      ),
    );
  }
}


