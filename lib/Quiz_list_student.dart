import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';

class Quiz_List_student extends StatefulWidget {
  @override
  _Quiz_List_studentState createState() => _Quiz_List_studentState();
}

class _Quiz_List_studentState extends State<Quiz_List_student> {
  List<Pojo_quizzes> Quizz_List = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_user_quizzes_by_join_class.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      Quizz_List = (ParsedJson['quizdata'] as List).map((data)=>Pojo_quizzes.fromJson(data)).toList();

      print(Quizz_List.length);
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
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Manage Class Activities",
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
              onPressed: (){},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),

        drawer: Drawer(
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


                          ],),
                      )
                    ],),
                ),),
              ),decoration: bg12,),



              Padding(
                padding: const EdgeInsets.only(left: 45,top:30),
                child: Row(children: <Widget>[Icon(Icons.home,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Home',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.assignment,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('About eduSupport',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.account_circle,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Edit Profile',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
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
                ),onTap: (){},
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
                ),onTap: (){},
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
                ),onTap: (){},
              ),





            ],
          ),
        ),

        body:
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: Quizz_List.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.QuizID=Quizz_List[i].id;
                        GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                        Navigator.of(context).pushNamed('exam');
                      },
                      child: classactivitys(
                        color: GlobalData.pinkred,
                        heading: Quizz_List[i].quiz_title+" - "+Quizz_List[i].id,
                        paragraph: Quizz_List[i].quiz_subject,
                      ),
                    );
                  }),
            ),
          ],
        )


    );
  }
}