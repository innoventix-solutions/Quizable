import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Quizboard extends StatefulWidget {
  @override
  _QuizboardState createState() => _QuizboardState();
}

class _QuizboardState extends State<Quizboard> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Quiz Exercise Bank",
              style: TextStyle(fontSize: 18),textAlign: TextAlign.center,
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
        body:
        SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(onTap: ()async{

                    print("adminmembership:" +GlobalData.adminmembership.toString());
                    print("classname:" +GlobalData.class_name .toString());
                    print("Class ID: "+GlobalData.classid.toString());
                    print("MyMebership: " +GlobalData.MyMembership.isActive.toString());
                    print(GlobalData.uid);



                    if(GlobalData.adminmembership == "" ||GlobalData.adminmembership=="null" ||
                        GlobalData.adminmembership==false.toString() ||GlobalData.adminmembership==null)

                    {
                      print("Level 1");

                      if(GlobalData.MyMembership==null || GlobalData.MyMembership.isActive==false)
                      {print("Level 2");

                      await Getclassquiz();

                      // print(GlobalData.quizclass.length);

                      if(GlobalData.quizclass!=null && GlobalData.quizclass.isNotEmpty)
                      {

                        GlobalData.classadminid==GlobalData.uid?
                        GlobalData.userType=="admin_teacher"?
                        CustomShowDialog(context,title: "Subscription Required",msg:
                        "Only One Quiz with maximum 10 Questions with one Level is Allowed for Free User\n\nSubscribe to create more Quiz",onPressed:(){
                          Navigator.of(context).pushNamed('ManageAccount');

                        }):
                        CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                        "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset multi-level questions above 10.\n\nThank you",
                            onPressed:(){
                              Navigator.of(context).pushNamed('dashboard');

                            }):CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                        "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset multi-level questions above 10.\n\nThank you",
                            onPressed:(){
                              Navigator.of(context).pushNamed('dashboard');

                            });
                      }

                      else {
                        GlobalData.QuizTitle="";
                        GlobalData.QuizLevels="";
                        GlobalData.NosofQuesPerLevel="";
                        GlobalData.DurationofEachLevel="";
                        GlobalData.Selected_subject=null ;
                        GlobalData.Selected_class=null;

                        Navigator.of(context)
                            .pushNamed('setquizquestions');
                      }

                      }else
                      {
                        GlobalData.QuizTitle  = "";
                        GlobalData.QuizLevels = "";
                        GlobalData.NosofQuesPerLevel = "";
                        GlobalData.DurationofEachLevel =  "";
                        GlobalData.Selected_subject = null ;
                        GlobalData.Selected_class = null;
                        Navigator.of(context)
                            .pushNamed('setquizquestions');
                      }



                    }
                    else {
                      GlobalData.QuizTitle  = "";
                      GlobalData.QuizLevels = "";
                      GlobalData.NosofQuesPerLevel = "";
                      GlobalData.DurationofEachLevel =  "";
                      GlobalData.Selected_subject = null ;
                      GlobalData.Selected_class = null;
                      Navigator.of(context)
                          .pushNamed('setquizquestions');
                    }

                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Set New Quiz Questions',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray)
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(onTap: (){

                    Navigator.of(context)
                        .pushNamed(
                        'previewQuiz');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('My Quiz Exercises Log',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(onTap: (){

                    Navigator.of(context)
                        .pushNamed(
                        'allquizlog');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('All Quiz Exercises Log',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed('manageclassactivities');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('My Quiz Results',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed('allquizresult');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('All Quiz Results',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),


      ),

    );
  }


}
