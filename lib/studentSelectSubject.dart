import 'package:flutter/material.dart';
import 'global.dart';


void main() => runApp(MaterialApp(
  home: StudentSelectSubject(),
));
class StudentSelectSubject extends StatefulWidget {
  @override
  _StudentSelectSubjectState createState() => _StudentSelectSubjectState();
}
class _StudentSelectSubjectState extends State<StudentSelectSubject> {



  List<String> Textvalues = ["Religion","Arts & Literature","Current Affairs","Entertainment & Sports","Geography","History","Mathematics","Science","General Knowledge"];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Select Quiz Subject",
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
                            child: Text('Stanley Ohanugo',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                          ),

                            Text('Distance Learning Institute',
                              style: TextStyle(color: Colors.white,fontSize: 15),)
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
                    child: Text('Assignment Question Bank',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 45,top:20),
                child: Row(children: <Widget>[Icon(Icons.live_help,color: GlobalData.lightblue,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Set Quiz Questions',style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  )],),
              ),

              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,top:20),
                  child: Row(children: <Widget>[Icon(Icons.offline_pin,color: GlobalData.lightblue,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Set Spelling Challenge',style: TextStyle(
                          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),],),
                ),onTap: (){},
              ),




            ],
          ),
        ),*/


        body:
        Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Students",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),


            Expanded(
              child:
              new ListView.builder
                (
                  itemCount: Textvalues.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return
                      GestureDetector(onTap: (){
                        GlobalData.Selected_subject="";

                        for(int i=0;i<GlobalData.Slected_subject_bool.length;i++) {
                          if(GlobalData.Slected_subject_bool[i]==true) {
                            if (GlobalData.Selected_subject == null) {
                              GlobalData.Selected_subject=Textvalues[i];
                            }else
                            {
                              GlobalData.Selected_subject+=", "+Textvalues[i];
                            }
                          }
                        }

                        Navigator.of(context).pushNamed('Quiz_List_student');

                      },
                        child: Card( //                           <-- Card widget
                          child: ListTile(

                            title: Text(Textvalues[index]),
                          ),
                        ),
                      );


                  }
              ),
            ),

          ],
        ),
    );
  }
}