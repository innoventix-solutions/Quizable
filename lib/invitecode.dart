import 'package:flutter/material.dart';
import 'global.dart';
import 'package:share/share.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: invitecode(),
    );
  }
}

class invitecode extends StatefulWidget {
  @override
  _invitecodeState createState() => _invitecodeState();
}

class _invitecodeState extends State<invitecode> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Text(
          "Create New Classroom",
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
                child: Text('You Successfully Created',
                  style: TextStyle(color: GlobalData.black,fontSize: 15),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text(GlobalData.class_name,
                style:TextStyle(fontSize: 15,color: GlobalData.gray,fontWeight: FontWeight.bold) ,),
            ),

            Text('Your Classroom Codes are:',
              style: TextStyle(color: GlobalData.black,fontSize: 15),),


            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Text(
                'Student Invite Code',
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
                                GlobalData.student_code,
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
                      child: IconButton(onPressed: (){Share.share(GlobalData.student_code+" Please use this code to Join the Class.");},
                        icon: Icon(
                          Icons.share,
                          color: GlobalData.white,
                          size: 20,
                        ),
                      ))
                ],
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
                      child: IconButton(onPressed: (){Share.share(GlobalData.teacher_code+" Please use this code to Join the Class.");},

                        icon: Icon(
                          Icons.share,
                          color: GlobalData.white,
                          size: 20,
                        ),
                      ))
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: GestureDetector(
                child: Text('Go back to Dashboard',style: TextStyle(
                    color:GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                ),),onTap: (){
                Navigator.of(context)
                    .pushNamed('admindashboard');},
              ),
            ),





          ],
        ),
      ),
    );
  }
}
