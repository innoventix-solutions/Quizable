import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'Pojo/pojo_getspelling.dart';



class StudentReportSpelling extends StatefulWidget {
  @override
  _StudentReportSpellingState createState() => _StudentReportSpellingState();
}

class _StudentReportSpellingState extends State<StudentReportSpelling> {

  List<Pojo_spelling> Spellinglist = new List();

  bool isloading = true;

  GetTest() async{


    isloading = true;
    setState(() {

    });

    await http.post("http://edusupportapp.com/api/get_spellings.php",
        body: {
          "UserId":GlobalData.uid,
         // "Class_id":GlobalData.classid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);

      if(ParsedJson['spellingdata']==false){

      }
      else {
        Spellinglist = (ParsedJson['spellingdata'] as List).map((data) =>
            Pojo_spelling.fromJson(data)).toList();
      }
      print(Spellinglist.length);
      setState(() {

      });


    });isloading = false;
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
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Spelling Report",
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

        /*drawer:
      drawerquiz(),*/

        body:isloading==true?Center(child: Text("Loading...",style: TextStyle(
            fontSize: 18
        ),)):
        Column(
          children: <Widget>[
            Expanded(
              child: Spellinglist.isEmpty ? Center(child: Text('You have not published any class activity yet')) :
              ListView.builder(
                  itemCount: Spellinglist.length,
                  itemBuilder: (c,i){
                    return GestureDetector(
                      onTap: (){GlobalData.isGlobal=false;
                      GlobalData.spellingid=Spellinglist[i].id;
                      GlobalData.spellLevels=Spellinglist[i].no_of_levels;
                      GlobalData.ExamQuiz=Spellinglist[i].spelling_title;
                      GlobalData.spellDurationofEachLevel=Spellinglist[i].dur_each_level;
                      Navigator.of(context).pushNamed('StudentListBySpelling');
                      },
                      child: StudentActivityReport(
                        color: GlobalData.pinkred,
                        heading: Spellinglist[i].spelling_title,
                        paragraph: Spellinglist[i].spelling_subject,
                        id:Spellinglist[i].id ,
                        title: Spellinglist[i].spelling_title,
                        is_taken: Spellinglist[i].is_taken,
                        duration: Spellinglist[i].dur_each_level,
                        levels: Spellinglist[i].no_of_levels,
                      ),
                    );
                  }),
            ),
          ],
        )
    );
  }
}
