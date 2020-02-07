import 'dart:convert';
//import 'package:newpro/Pojo/pojo_answer.dart';
//import 'package:newpro/Pojo/pojo_matchs.dart';

class Pojo_Spellingquestions{
  String id;
  String question;
  String point_awarded;
  //String answer_type;
  String anwer_options;
  String level_no;
  String ques_no;
  String audio_file;
  String spellingid;




  Pojo_Spellingquestions({this.id, this.question, this.point_awarded,
    this.anwer_options, this.level_no,this.ques_no,this.spellingid,this.audio_file});

  factory Pojo_Spellingquestions.fromJson(Map<String, dynamic> parsedJson){

    String Answer="";



      Answer=parsedJson['anwer_options'];



    return Pojo_Spellingquestions(
      id: parsedJson['ID'].toString(),
      question: parsedJson['question'].toString(),
     // answer_type : parsedJson['answer_type'].toString(),
      anwer_options: parsedJson['answer_options'].toString(),
      point_awarded: parsedJson['point_awarded'].toString(),
      level_no: parsedJson['level_no'].toString(),
      ques_no:parsedJson['ques_no'].toString(),
      spellingid: parsedJson['spelling_id'].toString(),
        audio_file:parsedJson['audio_file'].toString()

    );
  }
}


