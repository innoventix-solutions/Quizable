import 'package:flutter/material.dart';

class Pojo_assignmentclass{
  String id;
  String assignment_title;
  String techer_id;
  String no_of_questions;
  String teacher_instruction;
  String teacher_objective;

  String class_id;
  String status;
  String publish_date;
  String closing_date;
  String created_date;
  String classes;




  Pojo_assignmentclass({this.id, this.assignment_title, this.techer_id, this.no_of_questions,
    this.teacher_instruction, this.teacher_objective,this.class_id, this.status,
    this.publish_date, this.closing_date,this.created_date, this.classes,});

  factory Pojo_assignmentclass.fromJson(Map<String, dynamic> parsedJson){




    return Pojo_assignmentclass(
      id: parsedJson['ID'].toString(),
      class_id: parsedJson['class_id'].toString(),
      classes: parsedJson['classes'].toString(),
      closing_date: parsedJson['closing_date'].toString(),
      created_date: parsedJson['created_date'].toString(),
      no_of_questions: parsedJson['no_of_questions'].toString(),
      teacher_objective: parsedJson['teacher_objective'].toString(),
      publish_date: parsedJson['publish_date'].toString(),
      teacher_instruction: parsedJson['teacher_instruction'].toString(),

      assignment_title: parsedJson['assignment_title'].toString(),
      status: parsedJson['status'].toString(),
      techer_id: parsedJson['techer_id'].toString(),



    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
      };
}
