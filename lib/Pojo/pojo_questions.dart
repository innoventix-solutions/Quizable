import 'dart:convert';
import 'package:newpro/Pojo/pojo_answer.dart';
import 'package:newpro/Pojo/pojo_matchs.dart';

class Pojo_questions{
  String id;
  String question;
  String point_awarded;
  String answer_type;
  List<Pojo_Matchs> anwer_options;
  String level_no;
  String quiz_id;
  String TrueorFalse;
  String ques_no;
  List<Pojo_Answers> Options;


  Pojo_questions({this.id, this.question, this.point_awarded, this.answer_type,
      this.anwer_options, this.level_no, this.quiz_id,this.TrueorFalse,this.Options,this.ques_no});

  factory Pojo_questions.fromJson(Map<String, dynamic> parsedJson){
    List<Pojo_Matchs> matchs = new List();
    List<Pojo_Answers> answers = new List();
    String Answer="";



    if(parsedJson['answer_type'].toString()=="Match Type")
      {
       matchs= (jsonDecode(parsedJson['anwer_options']) as List).map((data)=>Pojo_Matchs.fromJson((data))).toList();
      }
    if(parsedJson['answer_type'].toString()!="Match Type" && parsedJson['answer_type'].toString()!="True or False")
      {
      answers= (jsonDecode(parsedJson['anwer_options']) as List).map((data)=>Pojo_Answers.fromJson((data))).toList();
      }
    if(parsedJson['answer_type'].toString()=="True or False")
      {
      Answer=parsedJson['anwer_options'];
      }

    return Pojo_questions(
      id: parsedJson['ID'].toString(),
      question: parsedJson['question'].toString(),
      answer_type : parsedJson['answer_type'].toString(),
      anwer_options: parsedJson['answer_type']=="Match Type"?matchs:[],
      Options: answers,
      point_awarded: parsedJson['point_awarded'].toString(),
      level_no: parsedJson['level_no'].toString(),
      quiz_id: parsedJson['quiz_id'].toString(),
      TrueorFalse: Answer,
      ques_no:parsedJson['ques_no'].toString(),

    );
  }
}


