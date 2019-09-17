import 'dart:convert';
import 'Pojo/pojo_getclasses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class Selectassignmentclass extends StatefulWidget {
  @override
  _SelectassignmentclassState createState() => _SelectassignmentclassState();
}

class _SelectassignmentclassState extends State<Selectassignmentclass> {


  List<Classes> Class_list = new List();
  bool isSelected = false;

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Getteacherclasses() async{
    await http.post("http://edusupportapp.com/api/get_teacher_classes.php",body: {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Getteacherclasses();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Select Classes",
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
                  itemCount: Class_list.length,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  GestureDetector(
                      onTap: (){

                        if(Class_list[index].selected==false){
                          Class_list[index].selected=true;
                        }else{
                          Class_list[index].selected=false;
                        }
                        setState(() {

                        });


                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Class_list[index].selected==true?Colors.blue[50]:Colors.white,
                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 70,
                                      width: 70,
                                      margin: EdgeInsets.only(
                                          left: 20, top: 15, bottom: 10),
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(GlobalData.Class_list[index].classicon),
                                          )),
                                    ),
                                  ],
                                ),





                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(Class_list[index].classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                        Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Text('12 Students',style: TextStyle(fontSize: 12),),
                                        ),
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
                    padding: const EdgeInsets.only(bottom:20,top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            ButtonClick: (){

                              GlobalData.Selected_class=null;
                              GlobalData.Selected_class_IDS=null;

                              for(int i=0;i<Class_list.length;i++) {
                                if(Class_list[i].selected==true) {
                                  if (GlobalData.Selected_class == null) {
                                    GlobalData.Selected_class=Class_list[i].classname;
                                    GlobalData.Selected_class_IDS=Class_list[i].id;
                                  }else
                                  {
                                    GlobalData.Selected_class+=", "+Class_list[i].classname;
                                    GlobalData.Selected_class_IDS+=","+Class_list[i].id;
                                  }
                                }
                              }

                              Navigator.of(context).pushNamed('AssignmentQuestionBank');

                            },
                            linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                            text: Text("Apply",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 18,),
                              textAlign: TextAlign.center,),
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
