import 'package:flutter/material.dart';

class Pojo_quizzclass{
  String id;
  String quiz_title;
  String techer_id;
  String no_of_levels;
  String que_each_level;
  String dur_each_level;
  String quiz_subject;
  String class_id;
  String status;
  String publish_date;
  String closing_date;
  String created_date;
  String classes;
  String age;



  Pojo_quizzclass({this.id, this.quiz_title, this.techer_id, this.no_of_levels,
    this.que_each_level, this.dur_each_level, this.quiz_subject,
    this.class_id, this.status, this.publish_date, this.closing_date,
    this.created_date, this.classes,this.age});

  factory Pojo_quizzclass.fromJson(Map<String, dynamic> parsedJson){




    return Pojo_quizzclass(
        id: parsedJson['ID'].toString(),
        class_id: parsedJson['class_id'].toString(),
        classes: parsedJson['classes'].toString(),
        closing_date: parsedJson['closing_date'].toString(),
        created_date: parsedJson['created_date'].toString(),
        dur_each_level: parsedJson['dur_each_level'].toString(),
        no_of_levels: parsedJson['no_of_levels'].toString(),
        publish_date: parsedJson['publish_date'].toString(),
        que_each_level: parsedJson['que_each_level'].toString(),
        quiz_subject: parsedJson['quiz_subject'].toString(),
        quiz_title: parsedJson['quiz_title'].toString(),
        status: parsedJson['status'].toString(),
        techer_id: parsedJson['techer_id'].toString(),
        age: parsedJson['age'].toString(),


    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
      };
}
