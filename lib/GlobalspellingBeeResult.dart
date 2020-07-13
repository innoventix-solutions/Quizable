import 'dart:convert';
import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setquizquestion.dart';
import 'Pojo/pojo_getspelling.dart';

class GlobalSpellingResult extends StatefulWidget {
  @override
  _GlobalSpellingResultState createState() => _GlobalSpellingResultState();
}

class _GlobalSpellingResultState extends State<GlobalSpellingResult> {
  List<Pojo_spelling> spellinglist = new List();


  bool isloading = true;

  GetTest() async{
    isloading = true;
    setState(() {

    });
    await http.post("http://edusupportapp.com/api/get_global_spellings.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      if(ParsedJson['spellingdata']==false){

      }
      else {
        spellinglist = (ParsedJson['spellingdata'] as List).
        map((data) => Pojo_spelling.fromJson(data)).toList();
      }
      spellinglist.sort((a, b) {
        return b.takendate.toLowerCase().compareTo(a.takendate.toLowerCase());
      });


      print(spellinglist.length);
      print(jsonEncode(spellinglist).toString());
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
    GetTest();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      /* appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "My Quiz Result",
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
        ),*/



        body:
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("My Spelling Results",style: TextStyle(
                  fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold
              ),textAlign: TextAlign.left,),
            ),
            isloading==true?Center(child: Text("Loading...",style: TextStyle(
                fontSize: 18
            ),)):
            Expanded(
              child:spellinglist.isEmpty ? Center(child: Text('No Spelling Exercises Log')) :
              ListView.builder(
                  itemCount: spellinglist.length,
                  itemBuilder: (c,i){
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.spellingid=spellinglist[i].id;
                        GlobalData.spellLevels=spellinglist[i].no_of_levels;
                        GlobalData.ExamQuiz=spellinglist[i].spelling_title;
                        GlobalData.spellDurationofEachLevel=spellinglist[i].dur_each_level;
                        GlobalData.CurrentStudentID=GlobalData.uid;


                        Navigator.of(context).pushNamed('spellinglevelsList');
                      },
                      child: spellinglist[i].is_taken==true?
                      SpellingResult(
                        color: GlobalData.green,
                        heading: spellinglist[i].spelling_title+" - "+spellinglist[i].id,
                        paragraph: spellinglist[i].spelling_subject,
                        title: spellinglist[i].takendate.toString(),
                        id: spellinglist[i].id,
                        is_taken: spellinglist[i].is_taken,
                        percent: spellinglist[i].percentage.toString(),
                        progresslabel:spellinglist[i].progresslabel,
                        timetaken: spellinglist[i].totaltime.toString(),
                      ):SizedBox(),
                    );
                  }
              ),
            ),
          ],
        )


    );
  }
}
