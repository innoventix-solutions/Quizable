import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import'package:newpro/Pojo/pojo_getclasses.dart';

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
                    return  GestureDetector(onTap: (){
                      GlobalData.classid = GlobalData.Class_list[index].id;

                      GlobalData.activeclass = GlobalData.Class_list[index];

                      print(GlobalData.Class_list[index].classname);
                      print(GlobalData.activeclass.classname);
                      Navigator.of(context)
                          .pushNamed('StudentList');

                    },
                      child: Column(
                        children: <Widget>[
                          Container(

                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[

                                        Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/images/classicon.png',
                                            image: GlobalData.Class_list[index].classicon,fit: BoxFit.cover,
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


                                          ],
                                        ),
                                      ),
                                    ),


                                  ], ),
                                GlobalData.Class_list[index].userid==GlobalData.uid?
                                Row(
                                  children: <Widget>[
                                    Expanded(child: FlatButton(onPressed: (){
                                      Share.share(GlobalData.Username +" Invites you to join the "+ GlobalData.Class_list[index].classname+" Please use this code "+GlobalData.Class_list[index].teacherinvitecode  +" to Join the Class.");
                                    }, child: Text("Invite Teachers"))),
                                    Expanded(child: FlatButton(onPressed: (){
                                      Share.share(GlobalData.Username +" Invites you to join the "+ GlobalData.Class_list[index].classname+" Please use this code "+GlobalData.Class_list[index].studentinvitecode  +" to Join the Class.");
                                    }, child: Text("Invite Students")))
                                  ],
                                ):Text("")
                              ],
                            ),
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
