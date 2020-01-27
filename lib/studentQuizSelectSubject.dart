import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'pojo/pojo_subject.dart';


void main() => runApp(MaterialApp(
  home: QuizExamSelectSubject(),
));
class QuizExamSelectSubject extends StatefulWidget {
  @override
  _QuizExamSelectSubjectState createState() => _QuizExamSelectSubjectState();
}
class _QuizExamSelectSubjectState extends State<QuizExamSelectSubject> {



 List<String> subjectlist = ["Religion","Arts & Literature","Current Affairs","Entertainment & Sports","Geography","History","Mathematics","Science","General Knowledge"];

  List<Subjectcount> mysub = new List();

  bool loading= false;

  _onLoading() {
   setState(() {
     loading = true;

   });}

  countsub() async{
    await http.post("http://edusupportapp.com/api/get_quizzes_by_class.php",
        body: {
          "Class_id":GlobalData.classid,
          "UserId":GlobalData.uid

        }).then((response) {
      print(response.body);

      var parsedjson = jsonDecode(response.body);
      print(parsedjson['subjectcount']);

      mysub = (parsedjson['subjectcount'] as List).map((data)=> Subjectcount.fromJson(data)).toList();

      setState(() {
        loading = true;
      });

    });
  }



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




        body:
        Column(
          children: <Widget>[

            Expanded(
              child:mysub.isEmpty?
              Center
                (child:Text("Loading...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),)

              ) :
              new ListView.builder
                (
                  itemCount: mysub.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return
                      GestureDetector(onTap: (){



                          GlobalData.Selected_subject = mysub[index].subject;


                          Navigator.of(context).pushNamed('Quiz_List_student');

                      },
                        child: Card( //                           <-- Card widget
                          child: ListTile(

                            title: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(child: Text(subjectlist[index])),
                                    Spacer(flex: 1,),
                                    Expanded(child: Container(

                                      padding: const EdgeInsets.all(5.0),//I used some padding without fixed width and height
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,// You can use like this way or like the below line
                                        //borderRadius: new BorderRadius.circular(30.0),
                                        color: Colors.green,
                                      ),
                                      child: new Text(mysub[index].noRec, style: new TextStyle(color: Colors.white, fontSize: 16.0),textAlign: TextAlign.center,),// You can add a Icon instead of text also, like below.

                                    ),
                                    )
                                  ],
                                ),


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
    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
    countsub();
  }
}