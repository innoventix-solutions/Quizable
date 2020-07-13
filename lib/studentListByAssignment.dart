import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'Pojo/pojo_StudentListQuizResult.dart';
import 'Pojo/pojo_getassignment.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'Pojo/pojo_StudentAssignmentResult.dart';
import 'package:share/share.dart';

class StudentListByAssignment extends StatefulWidget {
  @override
  _StudentListByAssignmentState createState() => _StudentListByAssignmentState();
}

class _StudentListByAssignmentState extends State<StudentListByAssignment> {


  List<Pojo_getassignment> assignment_list = new List();

  List<Pojo_StudentAssignmentResult> globlist = new List();

  bool isloading = true;



  sharedetail(){


    String total="";


  for(int i=0; i<globlist.length; i++){

    String temp = "Student: " + globlist[i].username +  " completed Assignment: " + GlobalData.ExamQuiz +"\n" + "Point Awarded: " + globlist[i].point_awarded + "/" + globlist[i].TotalAssignmentpoints +"\n"+ "Percentage: " + globlist[i].percentage + "\n" + "Progress Label: " + globlist[i].progresslabel + "\n \n";

    total = total + temp;

    setState(() {

    });

       }
    //print("${globlist[i].username}");

    print(total);

    Share.share(total);
    //Share.share("Student: " + username + " completed Assignment: " + GlobalData.ExamQuiz + "\n \n"+"Point Awarded: " + pointawarded + "/" + totalpoints + "\n" + "Percentage: " + percent + "\n" +  "Progress Label: " + label);

  }

  leaderboards()async{


    isloading = true;
    setState(() {

    });

    await http.post("http://edusupportapp.com/api/get_leaderboard.php",
        body: {
          "clsss_id":GlobalData.classid,
          "assignment_id": GlobalData.AssignmentID,

        }).then((response) {
      print(response.body);

      var parsedjson = jsonDecode(response.body);
      print("Leader " + parsedjson['student_data'].toString());



      if(parsedjson['student_data']==false){

      }
      else {
        globlist = (parsedjson['student_data'] as List)
            .map((data) => Pojo_StudentAssignmentResult.fromJson(data))
            .toList();
      }
      setState(() {

      });


      isloading = false;
      setState(() {

      });
    });

  }

  getstudent()
  async {
    isloading = true;
    setState(() {

    });
    print("ascasd ");

    await http.post("http://edusupportapp.com/api/get_students_by_teacher_assignment.php"
        ,body: {
          "assignment_id": GlobalData.AssignmentID,
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);
      if(pass['student_data']== false) {

      }
      else {
        globlist = (pass['student_data'] as List)
            .map((data) => Pojo_StudentAssignmentResult.fromJson(data))
            .toList();
      }
      globlist.sort((a, b) {
        return b.point_awarded.toLowerCase().compareTo(a.point_awarded.toLowerCase());
      });

      print(globlist.length);

      setState(() {

      });
    });
    isloading = false;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(onTap:(){
            Navigator.of(context)
                .pushNamed('AssignmentReport');
          },child: Icon(Icons.exit_to_app)),
            automaticallyImplyLeading: false,

            title: Text(
              "Students List",
              style: TextStyle(fontSize: 22),textAlign: TextAlign.center,
            ),
            actions: <Widget>[

             GestureDetector(onTap: (){

               sharedetail();
             },
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
               ),
             ),

            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [GlobalData.darkblue, GlobalData.darkpurple],
                ),
              ),
            ),


          ),
          body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
              fontSize: 18
          ),)):
          Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Students",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),


              Expanded(child: globlist.isEmpty ?
              Center
                (child:Text("No Student's joined yet",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),)

              ) :
              new ListView.builder
                  (
                    itemCount: globlist.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return
                        GestureDetector(
                          onTap: (){
                            isloading=true;

                            print("essayteacherid: " + GlobalData.essayteacherid);
                            print("uid: " + GlobalData.uid);

                            GlobalData.CurrentStudentID = globlist[index].id;
                            Navigator.of(context).pushNamed('AssignmentAnswerLog');
                            isloading=false;

                          },
                          child: Container(

                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.cover,
                                                image:(globlist[index].userphoto!="")?

                                                NetworkImage(globlist[index].userphoto,)
                                                    :
                                                AssetImage('assets/images/bg.png')
                                                ,
                                              )
                                          ),),
                                      ],
                                    ),
                                    //  Text("fghjkl"+globlist[index].userphoto),




                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:30),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Name: " + globlist[index].fullname),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5,bottom: 5),
                                              child: Text("Point Awarded: " + globlist[index].point_awarded+" / "+globlist[index].TotalAssignmentpoints),
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),


                                    /*GestureDetector(onTap: (){
                                      Share.share("Student: " + globlist[index].username + " completed Assignment: " + GlobalData.ExamQuiz + "\n \n"+"Point Awarded: " + globlist[index].point_awarded + "/" + globlist[index].TotalAssignmentpoints + "\n" + "Percentage: " + globlist[index].percentage + "\n" +  "Progress Label: " + globlist[index].progresslabel);

                                    },child: Icon(Icons.share)),*/

                                    SizedBox(width: 20,),








                                  ], ),

                              ],
                            ),
                          ),
                        );


                    }
                ),
              ),







            ],
          ),


        ),
      ),

    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getstudent();
    leaderboards();
  }
}


