import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';

class TeacherClassList extends StatefulWidget {
  @override
  _TeacherClassListState createState() => _TeacherClassListState();
}

class _TeacherClassListState extends State<TeacherClassList> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(GlobalData.userType);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Custom Classroom",
              style: TextStyle(fontSize: 22),
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

        ),
        body:Column(
          children: <Widget>[
            Expanded(
              child: new

              ListView.builder(
                  itemCount: 0,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  Column(
                      children: <Widget>[
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
                                          Text("student name",style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),


                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
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
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
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
                        new Divider(
                          color: Colors.black,
                        ),
                      ],
                    );
                  }
              ),
            ),

          ],
        ),


      ),

    );
  }
}
