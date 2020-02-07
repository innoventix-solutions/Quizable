import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'Pojo/pojo_StudentListQuizResult.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'Pojo/pojo_StudentListSpellingResult.dart';
class StudentListBySpelling extends StatefulWidget {
  @override
  _StudentListBySpellingState createState() => _StudentListBySpellingState();
}

class _StudentListBySpellingState extends State<StudentListBySpelling> {

  List<Pojo_StudentListResultSpelling> globlist = new List();



  getstudent()
  async {

    print("ascasd ");

    await http.post("http://edusupportapp.com/api/get_students_by_teacher_spelling.php"
        ,body: {
          "spelling_id": GlobalData.spellingid,
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      globlist = (pass['student_data'] as List)
          .map((data) => Pojo_StudentListResultSpelling.fromJson(data))
          .toList();

      globlist.sort((a, b) {
        return b.point_awarded.toLowerCase().compareTo(a.timetaken.toLowerCase());
      });


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
              child: globlist.isEmpty?
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
                          GlobalData.CurrentStudentID = globlist[index].id;
                          Navigator.of(context).pushNamed('StudentsspellingLevelsAnswer');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                                            Text("Name: " + globlist[index].username,style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16
                                            ),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5,bottom: 5),
                                              child: Text("Point Awarded: " + globlist[index].point_awarded+" / "+globlist[index].TotalSpellingpoints,style:
                                              TextStyle(color: Colors.black,fontSize: 14),),
                                            ),

                                            Text("Time Taken: " + globlist[index].timetaken),

                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Text("Exam Date: " + globlist[index].takendate),
                                            )

                                          ],
                                        ),
                                      ),
                                    ),






                                  ], ),

                              ],
                            ),
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


