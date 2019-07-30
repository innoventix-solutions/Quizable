import 'package:flutter/material.dart';
import 'global.dart';
import'package:newpro/Pojo/pojo_getclasses.dart';

class studentselectclass extends StatefulWidget {
  @override
  _studentselectclassState createState() => _studentselectclassState();
}

class _studentselectclassState extends State<studentselectclass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "My Class",
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
                      onTap: (){
    GlobalData.activeclass = GlobalData.Class_list[index];
                print(GlobalData.Class_list[index].classname);
print(GlobalData.activeclass.classname);
    Navigator.of(context).pushReplacementNamed('studentjoinclass');


                      },
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
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:10,top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(onTap:(){

                            Navigator.of(context)
                                .pushNamed('studentdashboard');

                          } ,
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.purple,
                                    GlobalData.pink]) ,text:
                            Text("Join New Class",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),textAlign: TextAlign.center,),
                            ),
                          ),
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