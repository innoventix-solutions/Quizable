import 'dart:convert';

import 'package:flutter/material.dart';
//import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_getassignment.dart';



class AllAssignment extends StatefulWidget {
  @override
  _AllAssignmentState createState() => _AllAssignmentState();
}

class _AllAssignmentState extends State<AllAssignment> {

  List<Pojo_getassignment> assignment_list = new List();
  bool isloading = true;



  GetAssignment() async{
    isloading = true;
    setState(() {

    });
    await http.post("http://edusupportapp.com/api/get_assignments_by_class.php",
        body: {
          "user_id":GlobalData.uid,
          "Class_id":GlobalData.classid,
          "publish_onhold_both":"dd"

        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      if(ParsedJson['assignmentdata']==false){

      }
      else {
        assignment_list = (ParsedJson['assignmentdata'] as List).
        map((data) => Pojo_getassignment.fromJson(data)).toList();
      }
      print(assignment_list.length);
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
    print("AssignmentTecaherid: " + GlobalData.assignmentteacehrid);
    GetAssignment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Center(
            child: Text(
              "Preview Assignment Question",
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
            GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('dashboard');

                },child: Icon(Icons.exit_to_app))
          ],
        ),

        /*drawer:
        drawerquiz(),*/

        body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
            fontSize: 18
        ),)):
        Column(
          children: <Widget>[
            Expanded(
              child: assignment_list.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: assignment_list.length,
                  itemBuilder: (c,i){

                    int totalQuestions=  int.parse(assignment_list[i].total_que);


                    return GestureDetector(
                      onTap: (){
                        GlobalData.EditQuiz=false;
                        GlobalData.AssignmentID=assignment_list[i].id;
                        GlobalData.ExamQuiz=assignment_list[i].assignment_title;
                        GlobalData.teacherinstruction=assignment_list[i].teacher_instruction;
                        GlobalData.teacherobjective=assignment_list[i].teacher_objective;
                        GlobalData.AssignmentTitle=assignment_list[i].assignment_title;
                        GlobalData.NosofQuesassignment=assignment_list[i].total_que;
                        GlobalData.Selected_class=assignment_list[i].classes;
                        GlobalData.assignmentstatus=assignment_list[i].status;
                        GlobalData.assignmentteacehrid=assignment_list[i].techer_id;

                        print((assignment_list[i].total_fill_question<int.parse(assignment_list[i].total_que)));

                        if((assignment_list[i].total_fill_question<int.parse(assignment_list[i].total_que))){
                          //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                          GlobalData.QuestionNumber=assignment_list[i].total_fill_question;

                          GlobalData.assignmentteacehrid=assignment_list[i].techer_id;
                          print("AssignmentTecaherid: " + GlobalData.assignmentteacehrid);

                          assignment_list[i].techer_id==GlobalData.uid?
                          Navigator.of(context).pushNamed('SetAssignmentQuestion'):
                          Show_toast_Now("Access Denied", Colors.red);
                        }else {
                          //Navigator.of(context).pushNamed(GlobalData.userType=="student"?'exam':'Question_List');

                          print("asdfasdf");
                          Navigator.of(context).pushNamed(GlobalData.userType=="student"?'spellans':'previewassignmentquestionlist');
                        }
                        //GlobalData.DurationofEachLevel=assignment_list[i].dur_each_level;
                        // GlobalData.QuizLevels=assignment_list[i].no_of_levels;
                        //Navigator.of(context).pushNamed('AssignmentQuestionList');
                      },
                      child:  assignment_list[i].is_taken==false?
                      PreviewAssignments(
                        color: GlobalData.pinkred,
                        heading: assignment_list[i].assignment_title,
                        paragraph: assignment_list[i].teacher_instruction,
                        id:assignment_list[i].id ,
                        title: assignment_list[i].assignment_title,
                        //is_taken: assignment_list[i].is_taken,

                        isActive: assignment_list[i].status.toLowerCase()=="publish"?true:false,
                        incomplete: (assignment_list[i].total_fill_question<int.parse(assignment_list[i].total_que.toString()) ),
                        continueTo:assignment_list[i].total_fill_question,
                        publishedDate: assignment_list[i].publish_date,
                        Assignment: assignment_list[i],
                      ): SizedBox()
                    );
                  }),
            ),

           
          ],
        )
    );
  }
}



