import 'package:flutter/material.dart';
import 'global.dart';
import 'package:share/share.dart';





class TeacherInviteCode extends StatefulWidget {
  @override
  _TeacherInviteCodeState createState() => _TeacherInviteCodeState();
}

class _TeacherInviteCodeState extends State<TeacherInviteCode> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Text(
          "Add Teacher",
          style: TextStyle(fontSize: 22),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [GlobalData.gradientblue, GlobalData.gradientviolet],
            ),
          ),
        ),

      ),



      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text('Use this Classroom Code to invite \nTeacher to current Classroom',
                  style: TextStyle(color: GlobalData.gray,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
            ),






            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Teacher Invite Code',
                style: TextStyle(color: GlobalData.lightblue, fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.only(left: 3),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        // You can use like this way or like the below line
                        //borderRadius: new BorderRadius.circular(10.0),

                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.share,
                          color:Colors.transparent,
                          size: 20,
                        ),
                      )

                  ),

                  Container(
                      child: Card(elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 45, right: 45),
                              child: Text(
                                GlobalData.teacher_code,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25,color: GlobalData.gray,fontWeight: FontWeight.bold),
                              ),
                            )),
                      )),
                  Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.only(left: 3),

                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        // You can use like this way or like the below line
                        //borderRadius: new BorderRadius.circular(10.0),
                        color: GlobalData.lightblue,
                      ),
                      child: IconButton(onPressed: (){
                        Share.share(GlobalData.Username +" Invites you to join the "+ GlobalData.class_name+" Please use this code "+GlobalData.teacher_code  +" to Join the Class.");},

                        icon: Icon(
                          Icons.share,
                          color: GlobalData.white,
                          size: 20,
                        ),
                      ))
                ],
              ),
            ),





          ],
        ),
      ),
    );
  }
}
