import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_getassignment.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';

class AssignmentListStudents extends StatefulWidget {
  @override
  _AssignmentListStudentsState createState() => _AssignmentListStudentsState();
}

class _AssignmentListStudentsState extends State<AssignmentListStudents> {
  List<Pojo_getassignment> assignment_list = new List();

  bool isloading = true;

  GetTest() async{
    isloading = true;
    setState(() {

    });
    await http.post("http://edusupportapp.com/api/get_assignments_by_class.php",
        body: {
          "user_id":GlobalData.uid,
          "Class_id":GlobalData.classid,

        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if (ParsedJson['assignmentdata'] == false) {

      }
      else{
        assignment_list = (ParsedJson['assignmentdata'] as List).map((data) =>
            Pojo_getassignment.fromJson(data)).toList();
      }
      print(assignment_list.length);
      print(jsonEncode(assignment_list).toString());
      setState(() {

      });
    });
    isloading = false;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Center(
            child: Text(
              "My Assignment Exercises",
              style: TextStyle(fontSize: 20),
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
              onPressed: (){
                Navigator.of(context).pushNamed('studentdashboard');

              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),



        body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
            fontSize: 18
        ),)):
        Column(
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(color: Colors.pinkAccent),

              child: Column(

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 20,right:20,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(assignment_list.isNotEmpty?assignment_list[0].publish_date:"",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 16,
                                  fontWeight: FontWeight.bold),),
                          ),

                        ),



                        Expanded(
                          child: SizedBox(width: 100,
                            child: GestureDetector(onTap: (){

                              if(assignment_list.isEmpty){
                                CustomShowDialog(context,title: "Unavailable",msg:
                                "No Assignment Exercise published yet");
                              }
                              else{
                                if(assignment_list[0].label == "New" ||  assignment_list[0].label == "Pending")
{
                                  GlobalData.isGlobal=false;
                                GlobalData.AssignmentID=assignment_list[0].id;
                               // GlobalData.QuizLevels=Quizz_List[0].no_of_levels;
                                GlobalData.ExamQuiz=assignment_list[0].assignment_title;
                                GlobalData.teacherinstruction=assignment_list[0].teacher_instruction;
                                GlobalData.teacherobjective=assignment_list[0].teacher_objective;
                                GlobalData.NosofQuesassignment=assignment_list[0].total_que;
                                //GlobalData.DurationofEachLevel=assignment_list[0].dur_each_level;//studentLevelList
                                // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                                Navigator.of(context).pushNamed('assignmentexam');
                              }
                                else{
                                  Fluttertoast.showToast(msg: "Assignment "+assignment_list[0].label,fontSize: 16,backgroundColor: Colors.red);

                                }
}

                            },
                              child: Card(color:Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(assignment_list.isNotEmpty?assignment_list[0].label:"-",textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 16,
                                        fontWeight: FontWeight.bold),),
                                ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20),
                    child: Row(
                      children: <Widget>[
                        Text(assignment_list.isNotEmpty?assignment_list[0].assignment_title:"No Assignment Available",style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 20),
                    child: Row(
                      children: <Widget>[
                        Text(assignment_list.isNotEmpty?assignment_list[0].teacher_instruction + " Instructions":"",style: TextStyle(
                            fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 20,right: 20,bottom: 15),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            linearGradient:LinearGradient(begin:Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.orange,Colors.deepOrange]) ,
                            text: Text("Closing",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 16,),
                              textAlign: TextAlign.center,),
                            ButtonClick: (){
                            },),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(assignment_list.isNotEmpty?assignment_list[0].closing_date.substring(0,19):"",style:TextStyle(
                              fontSize: 15,color: GlobalData.white
                          ) ,),
                        )
                      ],
                    ),
                  ),


                ],
              ),

            ),

            Expanded(
              child:assignment_list.isEmpty ? Center(child: Text('No Assignment Exercises published yet')) :

              isloading==true?Center(child: Text("Loading...",style: TextStyle(
                  fontSize: 18
              ),)):

              ListView.builder(
                  itemCount: assignment_list.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                        onTap: (){
                          if(assignment_list[i].label == "New" ||  assignment_list[i].label == "Pending")
                           {
                          GlobalData.AssignmentID=assignment_list[i].id;
                          //GlobalData.QuizLevels=assignment_list[i].no_of_levels;
                          GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                          GlobalData.teacherinstruction=assignment_list[i].teacher_instruction;
                          GlobalData.teacherobjective=assignment_list[i].teacher_objective;
                          GlobalData.NosofQuesassignment=assignment_list[i].total_que;
                          //GlobalData.DurationofEachLevel=assignment_list[i].dur_each_level;
                          Navigator.of(context).pushNamed(GlobalData.userType=="student"?'assignmentexam':'AssignmentQuestionList');
                       }
                        else{
                          Fluttertoast.showToast(msg: "Assignment "+assignment_list[i].label,fontSize: 16,backgroundColor: Colors.red);
                         }

    },
                        child: //assignment_list[i].is_taken==false?
                        StudentAssignmentReport(
                          assignment: assignment_list[i],
                          color: GlobalData.pinkred,
                          heading: assignment_list[i].assignment_title+" - "+assignment_list[i].id,
                          paragraph: assignment_list[i].teacher_instruction,
                          title: assignment_list[i].assignment_title,
                          id: assignment_list[i].id,
                          is_taken: assignment_list[i].is_taken.toString()=="true"?true:false,
                          closingdate: assignment_list[i].closing_date,
                        ),//:SizedBox()
                    );
                  }),
            ),
          ],
        )


    );
  }
}
