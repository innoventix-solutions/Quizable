import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class TeacherList extends StatefulWidget {
  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Custom Classroom ",
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [GlobalData.darkblue, GlobalData.darkpurple],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),
        body:  Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start,
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
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:10,bottom: 3),
                      child: Text("Class Admin",textAlign: TextAlign.left,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 3),
                      child: Text("Pastor Efosa Joseph",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Created: 15 March 2019",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),




            ], ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Teachers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(

              child: Column(
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
                              Text("Messie",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,),


                            ],
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              itemBuilder: (_) => <PopupMenuItem<String>>[
                                new PopupMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Icon(
                                          Icons.remove,
                                          color: GlobalData.lightblue,size: 12,
                                        ),
                                      ),
                                      new Text('Remove',style: TextStyle(fontSize: 15),),
                                    ],
                                  ), ),




                              ],

                            ),
                          ],
                        ),
                      ),



                    ], ),

                ],
              ),
            ),
            Container(

              child: Column(
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
                              Text("Clarrie",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,),


                            ],
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              itemBuilder: (_) => <PopupMenuItem<String>>[
                                new PopupMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Icon(
                                          Icons.remove,
                                          color: GlobalData.lightblue,size: 12,
                                        ),
                                      ),
                                      new Text('Remove',style: TextStyle(fontSize: 15),),
                                    ],
                                  ), ),




                              ],

                            ),
                          ],
                        ),
                      ),



                    ], ),

                ],
              ),
            ),
            Container(

              child: Column(
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
                              Text("Sammy",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,),


                            ],
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              itemBuilder: (_) => <PopupMenuItem<String>>[
                                new PopupMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Icon(
                                          Icons.remove,
                                          color: GlobalData.lightblue,size: 12,
                                        ),
                                      ),
                                      new Text('Remove',style: TextStyle(fontSize: 15),),
                                    ],
                                  ), ),




                              ],

                            ),
                          ],
                        ),
                      ),



                    ], ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top:20,bottom: 25, right: 20),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Add Teacher ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: GlobalData.lightblue),
                    ),
                    Icon(
                      Icons.add_circle,
                      color: GlobalData.lightblue,
                      size: 25,
                    )
                  ],
                ),
                onTap: () {
                          Navigator.of(context)
                            .pushNamed(
                              'TeacherInviteCode');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
