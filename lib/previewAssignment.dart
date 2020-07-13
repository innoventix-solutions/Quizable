import 'dart:convert';

import 'package:flutter/material.dart';
//import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_getassignment.dart';



class PreviewAssignment extends StatefulWidget {
  @override
  _PreviewAssignmentState createState() => _PreviewAssignmentState();
}

class _PreviewAssignmentState extends State<PreviewAssignment> {

  List<Pojo_getassignment> assignment_list = new List();

  bool isloading = true;


  GetAssignment() async{
    isloading = true;
    setState(() {

    });
    await http.post("http://edusupportapp.com/api/get_assignments.php",
        body: {
          "UserId":GlobalData.uid,
          //"Class_id":GlobalData.classid,
          //"publish_onhold_both":"dd"

        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      if(ParsedJson['assignmentsdata']==false){

      }
      else {
        assignment_list = (ParsedJson['assignmentsdata'] as List).
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

                          Navigator.of(context).pushNamed('SetAssignmentQuestion');
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

            Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 15,top: 15),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Row(children: <Widget>[

                      Icon(
                        Icons.add_circle,
                        color: GlobalData.lightblue,
                        size: 20,
                      ),

                      Text(
                        'Add New Assignment Topic',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: GlobalData.lightblue),
                      ),],

                    ),
                  ],
                ),
                onTap: () async{
                  print("adminmembership:" +GlobalData.adminmembership.toString());
                  print("classname:" +GlobalData.class_name .toString());
                  print("Class ID: "+GlobalData.classid.toString());
                  print("MyMebership: " +GlobalData.MyMembership.isActive.toString());
                  print(GlobalData.uid);

                  if(GlobalData.adminmembership == "" ||GlobalData.adminmembership=="null" ||
                      GlobalData.adminmembership==false.toString()||
                      GlobalData.adminmembership==null && GlobalData.classmemberships==null||
                      GlobalData.classmemberships.isActive==false)

                  {
                    print("Level 1");

                    if(GlobalData.MyMembership==null || GlobalData.MyMembership.isActive==false)
                    {print("Level 2");

                    await GetclassAssignment();

                    // print(GlobalData.quizclass.length);

                    if(GlobalData.assignmentclass!=null && GlobalData.assignmentclass.isNotEmpty)
                    {

                      GlobalData.classadminid==GlobalData.uid?

                      GlobalData.userType=="admin_teacher"?
                      CustomShowDialog(context,title: "Subscription Required",msg:
                      "Only One Assignment with max 10 Questions is Allowed for Free User\n\nSubscribe to create more Assignment",onPressed:(){
                        Navigator.of(context).pushNamed('ManageAccount');

                      }):
                      CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                      "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset questions above 10.\n\nThank you",
                          onPressed:(){
                            Navigator.of(context).pushNamed('dashboard');

                          }):CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                      "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset questions above 10.\n\nThank you",
                          onPressed:(){
                            Navigator.of(context).pushNamed('dashboard');

                          });
                    }

                    else {

                      GlobalData.AssignmentTitle="";
                      GlobalData.NosofQuesassignment="";
                      GlobalData.teacherinstruction="";
                      GlobalData.teacherobjective="";
                      /*Navigator.of(context)
                .pushNamed('developpage');*/
                      Navigator.of(context)
                          .pushNamed('SetAssignment');
                    }

                    }else
                    {
                      GlobalData.AssignmentTitle="";
                      GlobalData.NosofQuesassignment="";
                      GlobalData.teacherinstruction="";
                      GlobalData.teacherobjective="";
                      /*Navigator.of(context)
                .pushNamed('developpage');*/
                      Navigator.of(context)
                          .pushNamed('SetAssignment');
                    }

                  }
                  else {
                    GlobalData.AssignmentTitle="";
                    GlobalData.NosofQuesassignment="";
                    GlobalData.teacherinstruction="";
                    GlobalData.teacherobjective="";
                    /*Navigator.of(context)
                .pushNamed('developpage');*/
                    Navigator.of(context)
                        .pushNamed('SetAssignment');
                  }

                },
              ),
            ),
          ],
        )
    );
  }
}



