import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'Pojo/pojo_StudentListResult.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';

class StudentListByQuiz extends StatefulWidget {
  @override
  _StudentListByQuizState createState() => _StudentListByQuizState();
}

class _StudentListByQuizState extends State<StudentListByQuiz> {

  List<Pojo_StudentListResult> globlist = new List();



  getstudent()
  async {

    print("ascasd ");

    await http.post("http://edusupportapp.com/api/get_students_by_teacher_quiz.php"
        ,body: {
          "quiz_id": GlobalData.QuizID,
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      globlist = (pass['student_data'] as List)
          .map((data) => Pojo_StudentListResult.fromJson(data))
          .toList();

      print(globlist.length);

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
              "Students List",
              style: TextStyle(fontSize: 22),textAlign: TextAlign.center,
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

        ),
        body:
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


            Expanded(
              child: new ListView.builder
                (
                  itemCount: globlist.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return
                      GestureDetector(
                        onTap: (){
                          GlobalData.CurrentStudentID = globlist[index].id;
                          Navigator.of(context).pushNamed('AnswerLog');
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
                                              image:(globlist[index].userphoto==null)?AssetImage('assets/images/bg.png'):NetworkImage(globlist[index].userphoto,),
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
                                          Text(globlist[index].username),
                                          Text(globlist[index].point_awarded+" / "+globlist[index].TotalQuizpoints),


                                        ],
                                      ),
                                    ),
                                  ),






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

    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstudent();
  }
}


