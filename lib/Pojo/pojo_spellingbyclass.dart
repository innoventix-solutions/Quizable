import 'package:flutter/material.dart';

class Pojo_spellingclass{
  String id;
  String spelling_title;
  String techer_id;
  String no_of_levels;
  String que_each_level;
  String dur_each_level;
  String spelling_subject;
  String class_id;
  String status;
  String publish_date;
  String closing_date;
  String created_date;
  String classes;
  String teacher_instruction;



  Pojo_spellingclass({this.id, this.spelling_title, this.techer_id, this.no_of_levels,
    this.que_each_level, this.dur_each_level, this.spelling_subject,
    this.class_id, this.status, this.publish_date, this.closing_date,
    this.created_date, this.classes,this.teacher_instruction});

  factory Pojo_spellingclass.fromJson(Map<String, dynamic> parsedJson){




    return Pojo_spellingclass(
      id: parsedJson['ID'].toString(),
      class_id: parsedJson['class_id'].toString(),
      classes: parsedJson['classes'].toString(),
      closing_date: parsedJson['closing_date'].toString(),
      created_date: parsedJson['created_date'].toString(),
      dur_each_level: parsedJson['dur_each_level'].toString(),
      no_of_levels: parsedJson['no_of_levels'].toString(),
      publish_date: parsedJson['publish_date'].toString(),
      que_each_level: parsedJson['que_each_level'].toString(),
      spelling_subject: parsedJson['spelling_subject'].toString(),
      spelling_title: parsedJson['spelling_title'].toString(),
      status: parsedJson['status'].toString(),
      techer_id: parsedJson['techer_id'].toString(),
      teacher_instruction: parsedJson['teacher_instruction'].toString(),


    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
      };
}
