import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/global.dart';
import 'Pojo/pojo_getclasses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class classroomstudent extends StatefulWidget {
  @override
  _classroomstudentState createState() => _classroomstudentState();
}

class _classroomstudentState extends State<classroomstudent> {

  List<Classes> Class_list = new List();
  bool isSelected = false;

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Getteacherclasses() async{
    await http.post(GlobalData.applink+"get_teacher_classes.php",body: {
      "UserId":GlobalData.uid,

    }).then((response) {
      print(response.body);


      var ParsedJson=jsonDecode(response.body);
      Class_list=(ParsedJson['join_classdata'] as List).map((data)=>Classes.fromJson(data)).toList();
      print(Class_list.length);
      setState(() {

      });

    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,

            title: Center(
              child: Text(
                "Messiah Classrooms",
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
                                      Padding(
                                        padding: const EdgeInsets.only(top:5),
                                        child: Text('"I\'m Victor"',style: TextStyle(fontSize: 12),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:16),
                                child: PopupMenuButton(
                                  child: Icon(Icons.more_vert),
                                  itemBuilder: (_) => <PopupMenuItem<String>>[
                                    new PopupMenuItem<String>(
                                        child: new Text('Short Easy'), value: 'Short Easy'),
                                    new PopupMenuItem<String>(
                                        child: new Text('Assignment'), value: 'Assignment'),
                                  ],
                                  onSelected: ( value){},
                                ),
                              ),
                            ], ),



                          new Divider(
                            color: Colors.black,
                          ), ],
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Text('P Stand for student parent',style: TextStyle(color: GlobalData.green,fontWeight: FontWeight.bold,fontSize: 15),),
                    Text('email or phone number',style: TextStyle(color: GlobalData.green,fontWeight: FontWeight.bold,fontSize: 15),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,right: 20),
                child: Row(mainAxisAlignment:MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('Add Student',style: TextStyle(color: GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),

                    Card(shape: CircleBorder(),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: new Icon(Icons.add,color: GlobalData.white,),
                        ),
                       color:GlobalData.lightblue,

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
