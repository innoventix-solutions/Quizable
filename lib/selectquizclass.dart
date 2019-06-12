import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class quizclass extends StatefulWidget {
  @override
  _quizclassState createState() => _quizclassState();
}

class _quizclassState extends State<quizclass> {


  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Center(
            child: Text(
              "My Classrooms",
              style: TextStyle(fontSize: 22),
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
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        body:Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(

                child: new
                ListView.builder(
                  //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),

                    itemBuilder: (BuildContext ctxt, int index) {
                      return  Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image:AssetImage('assets/images/bg.png'),
                                        )
                                    ),),
                                ],
                              ),





                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:30),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Messih Class',style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                      Padding(
                                        padding: const EdgeInsets.only(top:5),
                                        child: Text('12 Students',style: TextStyle(fontSize: 12),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                            ], ),
                          new Divider(
                            color: Colors.black,
                          ),
                        ],
                      );
                    }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:20,top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GradientButtonText(
                          linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,
                          text: Text("Apply",
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,fontSize: 18,),
                            textAlign: TextAlign.center,),
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
