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

  String assignment_id;   //3-9-19
  String essay_instructions;  //17-9-19  a

  String spellingid;




  Pojo_questions({this.id, this.question, this.point_awarded, this.answer_type,
      this.anwer_options, this.level_no, this.quiz_id,this.TrueorFalse,this.Options,this.ques_no,
      this.assignment_id,this.essay_instructions,this.spellingid});

  factory Pojo_questions.fromJson(Map<String, dynamic> parsedJson){
    List<Pojo_Matchs> matchs = new List();
    List<Pojo_Answers> answers = new List();
    String Answer="";



    if(parsedJson['answer_type'].toString()=="Match Type")
      {
       matchs= (jsonDecode(parsedJson['anwer_options']) as List).map((data)=>Pojo_Matchs.fromJson((data))).toList();
      }
    if(parsedJson['answer_type'].toString()!="Match Type" && parsedJson['answer_type'].toString()!="True or False" && parsedJson['answer_type'].toString()!="Short Essay")
      {
      answers= (jsonDecode(parsedJson['anwer_options']) as List).map((data)=>Pojo_Answers.fromJson((data))).toList();
      }
    if(parsedJson['answer_type'].toString()=="True or False")
      {
      Answer=parsedJson['anwer_options'];
      }
    if(parsedJson['answer_type'].toString()=="Short Essay")    //5-9-19
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

      assignment_id:parsedJson['assignment_id'].toString(),   //3-9-19
      essay_instructions:parsedJson['essay_instructions'].toString(),  //17-9-19

      spellingid: parsedJson['spelling_id'].toString(),

    );
  }
}


