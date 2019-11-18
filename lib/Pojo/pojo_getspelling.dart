import 'package:flutter/material.dart';

class Pojo_spelling{
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
  String teacherinstruction;
  bool is_taken;
  //String TotalQuizpoints;
  //String point_awarded;
  //String age;
  int total_fill_question;

 // String percentage;
  //String progresslabel;
  //String totaltime;
 // String takendate;
  //String quizattemptlevel;
  //String label ="-";

  Pojo_spelling({this.id, this.spelling_title, this.techer_id, this.no_of_levels,
    this.que_each_level, this.dur_each_level, this.spelling_subject,
    this.class_id, this.status, this.publish_date, this.closing_date,
    this.created_date,this.classes,this.teacherinstruction,this.total_fill_question,this.is_taken});

  factory Pojo_spelling.fromJson(Map<String, dynamic> parsedJson){

    //String tt;
    //String td;

    //print("asdzfasd :" +parsedJson['ID'].toString());
    //print("asdzfasd :" +parsedJson['quiz_attend_data'].toString());
   // if(parsedJson['quiz_attend_data']==null||parsedJson['quiz_attend_data']==false)
   // {
    //  tt="NA";
    //  td="NA";
   // }else {


      //tt=parsedJson['quiz_attend_data']['t_time'];
     // td=parsedJson['quiz_attend_data']['taken_date'];
    //}
    //String Label="-";
    /*if(parsedJson['quiz_attemped_levels']!=null) {

      int AttempedLevel = int.parse(
          parsedJson['quiz_attemped_levels'].toString());
      int TotalLevels = int.parse(parsedJson['no_of_levels'].toString());
      DateTime closingTime = DateTime.parse(parsedJson['closing_date']);
      int DateStatus = DateTime.now().compareTo(
          DateTime.parse(parsedJson['closing_date']));
      // 0 = Same
      // -1 = Ahead
      // 1 = Gone
      int LevelDiffereance = TotalLevels - AttempedLevel;
      if (AttempedLevel == TotalLevels) {
        Label = "Taken";
      } else if (DateStatus == 1 && AttempedLevel == 0) {
        Label = "Missed";
      } else if (DateStatus == 1 && AttempedLevel > 0) {
        Label = "Taken";
      } else if (DateStatus == -1 && AttempedLevel == 0) {
        Label = "New";
      }else if (DateStatus == -1 && AttempedLevel == TotalLevels) {
        Label = "Taken";
      } else if (DateStatus == -1 &&
          (AttempedLevel > 0 && AttempedLevel < TotalLevels)) {
        Label = "Pending";
      }
    }*/








    return Pojo_spelling(
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
        teacherinstruction: parsedJson['teacher_instruction'].toString(),
        //age:parsedJson['age'].toString(),
       is_taken: parsedJson['is_taken'],
       // point_awarded: parsedJson['quiz_result']['point_awarded'].toString(),
       // TotalQuizpoints: parsedJson['quiz_result']['TotalQuizpoints'].toString(),
        total_fill_question:parsedJson['total_fill_question'],
       // percentage:parsedJson['quiz_result']['percentage'].toString(),
       // progresslabel:parsedJson['quiz_result']['progresslabel'],
       // totaltime: tt,
       // takendate: td,
       // quizattemptlevel: parsedJson['quiz_attemped_levels'].toString(),
        //label: Label

    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
      };
}
