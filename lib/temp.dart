import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_subject.dart';
import 'package:newpro/selectQuizSubject.dart';


import 'global.dart';

class tempfile extends StatefulWidget {
  @override
  _tempfileState createState() => _tempfileState();
}

class _tempfileState extends State<tempfile> {

  Subjectcount Subjects;


  temp() async{
    await http.post(GlobalData.applink+"get_quizzes_by_class.php",
        body: {
      "Class_id":"1",

    }).then((response) {
      print(response.body);

      var parsedjson = jsonDecode(response.body);
      print(parsedjson['subjectcount']);

      Subjects = Subjectcount.fromJson(parsedjson['subjectcount']);


     print( Subjects.toString());

     setState(() {

     });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text(Subjects.toString())),
    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp();
  }
}
