import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/global.dart' as prefix0;
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';

class Quiz_List_student extends StatefulWidget {
  @override
  _Quiz_List_studentState createState() => _Quiz_List_studentState();
}

class _Quiz_List_studentState extends State<Quiz_List_student> {
  List<Pojo_quizzes> Quizz_List = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_quizzes_by_join_class.php",
        body: {
          "UserId":GlobalData.uid,
          "subject": GlobalData.Selected_subject
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      Quizz_List = (ParsedJson['quizdata'] as List).map((data)=>Pojo_quizzes.fromJson(data)).toList();

      print(Quizz_List.length);
      print(jsonEncode(Quizz_List).toString());
      setState(() {

      });
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
              "My Quiz Exercises",
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
        /*drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the Drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(child: Padding(
                padding: const EdgeInsets.only(bottom: 40,top: 25),
                child: DrawerHeader(child: Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                          radius: 35.0,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(GlobalData.Username,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                          ),

                            Container(
                              child: Text(GlobalData.activeclass!=null?GlobalData.activeclass.classname:"No Class Selected",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 12),),
                            ),


                          ],),
                      )
                    ],),
                ),),
              ),decoration: bg12,),



              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:30),
                  child: Row(children: <Widget>[Icon(Icons.home,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Home',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    )],),
                ),onTap: (){
                Navigator.of(context)
                    .pushNamed('studentdashboard');
              },
              ),

              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.assignment,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('About eduSupport',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    )],),
                ),onTap: (){
                Navigator.of(context)
                    .pushNamed('AboutEduSupport');
              },
              ),

              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.account_circle,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Edit Profile',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    )],),
                ),onTap: (){
                Navigator.of(context)
                    .pushNamed('EditProfileStudent');
              },
              ),


              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.gamepad,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Game Room',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),],),
                ),onTap: (){
                Navigator.of(context)
                    .pushNamed('GameRoom');
              },
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.surround_sound,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Announcements',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),],),
                ),onTap: (){
                Navigator.of(context)
                    .pushNamed('Announcements');
              },
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.share,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Share App',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),],),
                ),onTap: (){},
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.power_settings_new,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Log Out',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),],),
                ),onTap: ()async{
                LogoutFunction(context);
              },

              ),





            ],
          ),
        ),*/

        body:
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
                              child: Text(Quizz_List.isNotEmpty?Quizz_List[0].publish_date:"",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.bold),),
                            ),

                      ),



                      Expanded(
                        child: SizedBox(width: 100,
                          child: GestureDetector(onTap: (){

                            if(Quizz_List.isEmpty){
                              CustomShowDialog(context,title: "Unavailable",msg:
                              "No Quiz Exercise published yet");
                            }
                            else{
                              GlobalData.isGlobal=false;
                              GlobalData.QuizID=Quizz_List[0].id;
                              GlobalData.QuizLevels=Quizz_List[0].no_of_levels;
                              GlobalData.ExamQuiz=Quizz_List[0].quiz_title;
                              GlobalData.DurationofEachLevel=Quizz_List[0].dur_each_level;//studentLevelList
                              // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                              Navigator.of(context).pushNamed('studentLevelList');
                            }

                          },
                            child: Card(color:Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("New",textAlign: TextAlign.center,
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
                      Text(Quizz_List.isNotEmpty?Quizz_List[0].quiz_title:"No Quiz Available",style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                      ),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 20),
                  child: Row(
                    children: <Widget>[
                      Text(Quizz_List.isNotEmpty?Quizz_List[0].no_of_levels + " Levels":"",style: TextStyle(
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
                        child: Text(Quizz_List.isNotEmpty?Quizz_List[0].closing_date.substring(0,19):"",style:TextStyle(
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
              child:Quizz_List.isEmpty ? Center(child: Text('No Quiz Exercises published yet')) :  //22-8-19 a
              ListView.builder(
                  itemCount: Quizz_List.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){


                        if(Quizz_List[i].label == "New" ||  Quizz_List[i].label == "Pending")
                        {
                          GlobalData.EditQuiz=false;
                          GlobalData.QuizID=Quizz_List[i].id;
                          GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                          GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level;
                          GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                          Navigator.of(context).pushNamed(GlobalData.userType=="student"?'studentLevelList':'Question_List');

                        }
                        else{Fluttertoast.showToast(msg: "Quiz "+Quizz_List[i].label,fontSize: 16,backgroundColor: Colors.red);}



                        /* GlobalData.isGlobal=false;
                        GlobalData.QuizID=Quizz_List[i].id;
                        GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                        GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                        GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level; //studentLevelList
                       // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                        Navigator.of(context).pushNamed('studentLevelList');
                      */},
                      child: /*Quizz_List[i].is_taken==false?   */    //22-8-19 a
                    classactivitys(
                    quiz: Quizz_List[i],
                        color: GlobalData.pinkred,
                        heading: Quizz_List[i].quiz_title+" - "+Quizz_List[i].id,
                        paragraph: Quizz_List[i].quiz_subject,
                        title: Quizz_List[i].quiz_title,
                        id: Quizz_List[i].id,
                        is_taken: Quizz_List[i].is_taken.toString()=="true"?true:false,
                      duration: Quizz_List[i].dur_each_level,
                      closingdate: Quizz_List[i].closing_date,
                      //is_taken: false,
                      )/*:SizedBox()*/
                    );
                  }),
            ),
          ],
        )


    );
  }
}
