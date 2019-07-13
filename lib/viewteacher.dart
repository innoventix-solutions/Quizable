import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class viewteacher extends StatefulWidget {
  @override
  _viewteacherState createState() => _viewteacherState();
}

class _viewteacherState extends State<viewteacher> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Messiah Classroom ",
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

                              ],
                            ),





                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:20),
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
                                      child: new Text('Remove',style: TextStyle(color: GlobalData.darkpink),), value: 'Short Easy'),

                                ],
                                onSelected: ( value){},
                              ),
                            ),
                          ], ),



                      ],
                    );
                  }
              ),
            ),],
        ),
      ),
    );
  }
}
