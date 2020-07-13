import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Spellingboard extends StatefulWidget {
  @override
  _SpellingboardState createState() => _SpellingboardState();
}

class _SpellingboardState extends State<Spellingboard> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Spelling Exercise Bank",
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
                    //print("Classmembership: " +GlobalData.classmemberships.isActive.toString());

                    print(GlobalData.uid);



                    if(GlobalData.adminmembership == "" ||GlobalData.adminmembership=="null" ||
                        GlobalData.adminmembership==false.toString()||
                        GlobalData.adminmembership==null && GlobalData.classmemberships==null||
                    GlobalData.classmemberships.isActive==false)

                    {
                      print("Level 1");

                      if(GlobalData.MyMembership==null || GlobalData.MyMembership.isActive==false)
                      {print("Level 2");

                      await GetclassSpellinng();



                      if(GlobalData.spellingclass!=null && GlobalData.spellingclass.isNotEmpty)
                      {
                        GlobalData.classadminid==GlobalData.uid?

                        GlobalData.userType=="admin_teacher"?
                        CustomShowDialog(context,title: "Subscription Required",msg:
                        "Only One Spelling with maximum 10 Questions with one Level is Allowed for Free User\n\nSubscribe to create more Spellings",onPressed:(){
                          Navigator.of(context).pushNamed('ManageAccount');

                        }):
                        CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                        "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset multi-level questions above 10.\n\nThank you",
                            onPressed:(){
                              Navigator.of(context).pushNamed('dashboard');

                            }):
                        CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                        "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset multi-level questions above 10.\n\nThank you",
                            onPressed:(){
                              Navigator.of(context).pushNamed('dashboard');

                            });
                      }

                      else {
                        GlobalData.spelltitle = "";
                        GlobalData.spellLevels = "";
                        GlobalData.spellNosofQuesPerLevel = "";
                        GlobalData.spellDurationofEachLevel = "";
                        GlobalData.teacherguide = "";
                        GlobalData.Selected_subject = null ;
                        GlobalData.Selected_class = null;

                        Navigator.of(context)
                            .pushNamed('setspellingque');
                      }

                      }else
                      {

                        GlobalData.spelltitle = "";
                        GlobalData.spellLevels = "";
                        GlobalData.spellNosofQuesPerLevel = "";
                        GlobalData.spellDurationofEachLevel = "";
                        GlobalData.teacherguide = "";
                        GlobalData.Selected_subject = null ;
                        GlobalData.Selected_class = null;
                        Navigator.of(context)
                            .pushNamed('setspellingque');
                      }



                    }
                    else {

                      GlobalData.spelltitle = "";
                      GlobalData.spellLevels = "";
                      GlobalData.spellNosofQuesPerLevel = "";
                      GlobalData.spellDurationofEachLevel = "";
                      GlobalData.teacherguide = "";
                      GlobalData.Selected_subject = null ;
                      GlobalData.Selected_class = null;
                      Navigator.of(context)
                          .pushNamed('setspellingque');
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
                                Text('Set New Spelling Questions',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray)
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('previewspelling');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('My Spelling Exercises Log',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),
                                ),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),



                  GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('allspellinglog');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('All Spelling Exercises Log',style: TextStyle(fontSize: 16,
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
                        .pushNamed('Spellingreports');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('My Spelling Results',style: TextStyle(fontSize: 16,
                                    fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                              ],),
                          ),
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(onTap: (){
                    Navigator.of(context)
                        .pushNamed('allspellingreport');
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Card(elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('All Spelling Results',style: TextStyle(fontSize: 16,
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
