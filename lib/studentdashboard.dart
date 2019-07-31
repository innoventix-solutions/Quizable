import 'package:flutter/material.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:shared_preferences/shared_preferences.dart';



class studentdashboard extends StatefulWidget {
  @override
  _studentdashboardState createState() => _studentdashboardState();
}

class _studentdashboardState extends State<studentdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Student Dashboard",
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
              ),onTap: ()async{

              SharedPreferences pre= await SharedPreferences.getInstance();
              pre.clear();
              Navigator.of(context).dispose();
              Navigator.of(context).pushNamed('login');

            },


            
            ),





          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 180,
              //decoration: bg12,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                        radius: 35.0,
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(GlobalData.activeclass!=null?GlobalData.activeclass.classname:"No Class Selected",style:
                    TextStyle(fontSize: 18,color:GlobalData.gray,fontWeight: FontWeight.bold),),
                  ),Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(onTap: (){
                      Navigator.of(context).pushReplacementNamed('studentselectclass');
                    },
                      child: Text('Switch Classroom',style:
                      TextStyle(fontSize: 15,color: GlobalData.pinkred,decoration: TextDecoration.underline),),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("Global Quiz",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                                Navigator.of(context).pushNamed('GlobalQuiz');

                              },)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                              text: Text("View my Class Activities",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),textAlign: TextAlign.center,),
                              ButtonClick: (){

                                Navigator.of(context).pushNamed('Quiz_List_student');

                              },)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                              text: Text("View my Classroom",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                                },)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GradientButtonText(
                              linearGradient:LinearGradient(
                                  colors: <Color>[GlobalData.pinkred,GlobalData.yellow]) ,
                              text: Text("See my Results",
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,),
                                textAlign: TextAlign.center,),
                              ButtonClick: (){
                               },)
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),



            Container(
              width: MediaQuery.of(context).size.width,

              decoration: bg12,

              child: Column(

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 20,right:20,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            linearGradient:LinearGradient(begin:Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[GlobalData.yellow,GlobalData.pinkred]) ,
                            text: Text("Quiz",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 15,),
                              textAlign: TextAlign.center,),
                            ButtonClick: (){
                              },),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20),
                    child: Row(
                      children: <Widget>[
                        Text('The World & Climate Change',style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 20),
                    child: Row(
                      children: <Widget>[
                        Text('Anchor for the Quiz',style: TextStyle(
                            fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 20),
                    child: Row(
                      children: <Widget>[
                        Text('Matthew 1 – 11',style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 20,right: 20,bottom: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            linearGradient:LinearGradient(begin:Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[GlobalData.pinkred,GlobalData.lightpink]) ,
                            text: Text("Closing",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 15,),
                              textAlign: TextAlign.center,),
                            ButtonClick: (){
                            },),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('Sat. 27 Mar, 2019, 12:00',style:TextStyle(
                            fontSize: 15,color: GlobalData.white
                          ) ,),
                        )
                      ],
                    ),
                  ),


                ],
              ),

            ),


            Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 35),
                    child: Row(
                      children: <Widget>[
                        Text('Classroom Leaderboard',style:
                        TextStyle(fontSize: 18,color:GlobalData.lightblue,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,left: 35),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                                  radius: 35.0,
                                ),Text("Ginika Okputu",style: TextStyle(fontSize: 12,color: GlobalData.gray),),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                                    radius: 35.0,
                                  ),Text("Ginika Okputu",style: TextStyle(fontSize: 12,color: GlobalData.gray),),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                                    radius: 35.0,
                                  ),Text("Ginika Okputu",style: TextStyle(fontSize: 12,color: GlobalData.gray),),
                                ],
                              ),
                            ),

                          ],
                        ),

                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Go to Global Quiz & Spelling Challenge",
                    style: TextStyle(fontSize: 15,color: GlobalData.lightblue,
                        fontWeight: FontWeight.bold),),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 10),
                    child: Text("Parent Login Here",
                      style: TextStyle(fontSize: 20,color: GlobalData.lightblue,
                          fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
