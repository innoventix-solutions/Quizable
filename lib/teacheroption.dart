import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
class teacheroption extends StatefulWidget {
  @override
  _teacheroptionState createState() => _teacheroptionState();
}

class _teacheroptionState extends State<teacheroption> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
       backgroundColor: Color(0Xff1F0BE6)),
      body:
        Container(
        decoration: BoxDecoration(color: bgblue),
    child:Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: new Card(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Center(child: Padding(
                          padding: const EdgeInsets.only(top:15),

                          child: Text('Teacher Option',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                        )),


                        new Divider(
                          color: Colors.blue,
                        ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Text('As a Teacher, you can join existing classes by Teacher Admin invitation, then you can add students to the class and set tasks for your classroom members.\n\nBut if you want to create a new class, you will need to sign up for an Admin account.\n\nDo you want to set up Admin Account?',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15,color: black),textAlign: TextAlign.justify,),

                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(color: Colors.blue,shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                              onPressed: (){
                                GlobalData.userType="admin_teacher";
                                Navigator.of(context)
                                    .pushNamed('accouttypeselect');
                              },child: Text('Admin',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: RaisedButton(color:pinkred,shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                                onPressed: (){
                                  GlobalData.userType="teacher";
                                  Navigator.of(context)
                                      .pushNamed('register');
                                },child: Text('Teacher',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),),
                            ),
                          ],
                        ),
                      )],

                    ),

                  ),



                ],


            ),
    ),
          ),
                ),
    ),
   ], ),
        ),  );
  }
}
