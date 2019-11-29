import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_getassignment.dart';
import 'Pojo/pojo_getspelling.dart';

class RecentQuestion extends StatefulWidget {
  @override
  _RecentQuestionState createState() => _RecentQuestionState();
}

class _RecentQuestionState extends State<RecentQuestion> {
  List<Pojo_quizzes> Quizz_List = new List();
  List<Pojo_getassignment> assignment_list = new List();
  List<Pojo_spelling> spellinglist = new List();

  GetAssignment() async {
    await http.post("http://edusupportapp.com/api/get_assignments.php",
        body: {"UserId": GlobalData.uid,
       }).then((res) {
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      assignment_list = (ParsedJson['assignmentsdata'] as List)
          .map((data) => Pojo_getassignment.fromJson(data))
          .toList();

      print(assignment_list.length);
      setState(() {});
    });
  }

  GetQuiz() async {
    await http.post("http://edusupportapp.com/api/get_quizzes",
        body: {"UserId": GlobalData.uid,

       }).then((res) {
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Quizz_List = (ParsedJson['quizdata'] as List)
          .map((data) => Pojo_quizzes.fromJson(data))
          .toList();
      print(Quizz_List.length);
      setState(() {});
    });
  }


  Getspellings() async {
    await http.post("http://edusupportapp.com/api/get_spelling_by_class.php",
        body: {"UserId": GlobalData.uid,
          "Class_id":GlobalData.classid
          }).then((res) {
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      spellinglist = (ParsedJson['spellingdata'] as List)
          .map((data) => Pojo_spelling.fromJson(data))
          .toList();
      print(spellinglist.length);
      setState(() {});
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAssignment();
    GetQuiz();
    Getspellings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Center(
            child: Text(
              "Recent Questions",
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
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),
        drawer: drawerquiz(),
        body: Column(
          children: <Widget>[
            assignment_list.isEmpty && Quizz_List.isEmpty && spellinglist.isEmpty
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "You have not published any class \nactivity yet.",
                      style: TextStyle(fontSize: 18, height: 1.2),
                      textAlign: TextAlign.center,
                    ),
                  ))
                :

            Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: assignment_list.isEmpty
                        ?
                    dummytext(color:Colors.red,
                      paragraph: "No Assignment created for this class yet",heading: "Class Assignments",)
                        :



                        Card(
                            elevation: 5.0,
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Class Assignments',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: GlobalData.gray),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
            Expanded(
              child: assignment_list.isEmpty
                  ? Center(child: Text(''))
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                          onTap: () {},
                          child: recentquestions(
                            color: GlobalData.pinkred,
                            heading: assignment_list[i].assignment_title,
                            paragraph: assignment_list[i].publish_date,
                            id: assignment_list[i].id,
                            title: assignment_list[i].total_que +" Questions",
                          ),
                        );
                      }),
            ),

/*Quiz section*/

            Column(
              children: <Widget>[
                Quizz_List.isEmpty
                    ? Center(child: Text(''))
                    : Card(
                        elevation: 5.0,
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 5),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Quiz Exercise',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: GlobalData.gray),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            Expanded(
              child: Quizz_List.isEmpty
                  ? Center(child: Text(''))
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                          onTap: () {},
                          child: recentquestions(
                            color: GlobalData.pinkred,
                            heading: Quizz_List[i].quiz_title,
                            paragraph: Quizz_List[i].publish_date,
                            id: Quizz_List[i].id,
                            title: (int.parse(Quizz_List[i]
                                        .que_each_level
                                        .toString()) *
                                    int.parse(
                                        Quizz_List[i].no_of_levels.toString()))
                                .toString()+ " Questions",
                          ),
                        );
                      }),
            ),



            /*Spelling section*/
            Column(
              children: <Widget>[
                spellinglist.isEmpty
                    ? Center(child: Text(''))
                    : Card(
                        elevation: 5.0,
                        color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Spelling Challenge',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: GlobalData.gray),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            Expanded(
              child: spellinglist.isEmpty
                  ? Center(child: Text(''))
                  : ListView.builder(
                  itemCount: 1,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                      onTap: () {},
                      child: recentquestions(
                        color: GlobalData.pinkred,
                        heading: spellinglist[i].spelling_title,
                        paragraph: spellinglist[i].publish_date,
                        id: spellinglist[i].id,
                        title: (int.parse(spellinglist[i]
                            .que_each_level
                            .toString()) *
                            int.parse(
                                spellinglist[i].no_of_levels.toString()))
                            .toString()+ " Questions",
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

