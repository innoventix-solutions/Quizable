import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class studentssclassroom extends StatefulWidget {
  @override
  _studentssclassroomState createState() => _studentssclassroomState();
}

class _studentssclassroomState extends State<studentssclassroom> {


  getstudentcount()
  async {

    await http.post("http://edusupportapp.com/api/get_teacher_classes.php"
        ,body: {
          "UserId": GlobalData.uid,
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      if (pass['join_classdata'].toString()!= null || pass['join_classdata'].toString()!= "false") {
        GlobalData.Class_list = (pass['join_classdata'] as List).
        map((data) => Classes.fromJson(data)).toList();
      }

      print(GlobalData.Class_list.length);

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
              "Classrooms",
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
              child: GlobalData.Class_list.isEmpty?Center(child: Text("sdsd")):


              ListView.builder(
                  itemCount: GlobalData.Class_list.length,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  GestureDetector(
                      onTap: (){


                        GlobalData.classid=GlobalData.Class_list[index].id.toString();
                        print("ClassID: " + GlobalData.Class_list[index].id.toString());

                        Navigator.of(context)
                            .pushNamed('myclassresults');

                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: GlobalData.Class_list[index].selected==true?Colors.blue[50]:Colors.white,
                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[



                                    Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                      child: ClipOval(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: 'assets/images/classicon.png',
                                          image: GlobalData.Class_list[index].classicon,fit: BoxFit.cover,
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
                                        Text(GlobalData.Class_list[index].classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                        Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Text(GlobalData.Class_list[index].total_join==null?"0 Student":GlobalData.Class_list[index].total_join.toString()
                                              +" Students",style: TextStyle(fontSize: 14),),
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


          ],
        ),


      ),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstudentcount();
  }
}
