import 'package:flutter/material.dart';

import 'global.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
        backgroundColor: Color(0Xff1F0BE6),


        title: Center(
          child: Text(
            "Announcment",
            style: TextStyle(fontSize: 22),
          ),
        ),
        flexibleSpace: Container(
          decoration: bg12,
        ),
        actions: <Widget>[
          IconButton(onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 45,right: 45,left: 45),
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Announcment EduSupport',style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold),),
                          //SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, ")),

                              ],
                            ),
                          ),//SizedBox(height: 10),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
