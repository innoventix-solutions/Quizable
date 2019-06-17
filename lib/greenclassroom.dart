import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
class greenclassroom extends StatefulWidget {



  @override
  _greenclassroomState createState() => _greenclassroomState();
}

class _greenclassroomState extends State<greenclassroom> {





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
                "Greenfield Classroom ",
                style: TextStyle(fontSize: 22),
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
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
                                      )
                                  ),
                                  Positioned(
                                    right: 8,bottom: 8,
                                    child: Card(color: Colors.green,elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(




                                            child: Text('P',style: TextStyle(color: Colors.white,fontSize: 5),)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),





                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:30),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Messih Class',style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),

                                    ],
                                  ),
                                ),
                              ), Padding(
                                padding: const EdgeInsets.only(right:16),
                                child: PopupMenuButton(
                                  child: Icon(Icons.more_vert),
                                  itemBuilder: (_) => <PopupMenuItem<String>>[
                                    new PopupMenuItem<String>(
                                        child: new Text('Remove',style: TextStyle(color: darkpink),), value: 'Short Easy'),

                                  ],
                                  onSelected: ( value){

                        

                                  },
                                ),
                              ),
                            ], ),



                           ],
                      );
                    }
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10,right: 20,top: 10),
                child: Row(mainAxisAlignment:MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('Add Student',style: TextStyle(color: lightblue,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),

                    Card(shape: CircleBorder(),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new Icon(Icons.add,color: white,),
                      ),
                      color:lightblue,

                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
