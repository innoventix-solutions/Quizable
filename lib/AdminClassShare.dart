import 'package:flutter/material.dart';
import 'global.dart';
import'package:newpro/Pojo/pojo_getclasses.dart';

class AdminClassShare extends StatefulWidget {
  @override
  _AdminClassShareState createState() => _AdminClassShareState();
}

class _AdminClassShareState extends State<AdminClassShare> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "My Classes",
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
        body:Column(
          children: <Widget>[
            Expanded(
              child: new

              ListView.builder(
                  itemCount: GlobalData.Class_list.length,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  GestureDetector(

                      child: Column(
                        children: <Widget>[
                          Container(

                            child: Row(
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
                                        Text(GlobalData.Class_list[index].classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),

                                      ],
                                    ),
                                  ),
                                ),


                              ], ),
                          ),
                          new Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
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
