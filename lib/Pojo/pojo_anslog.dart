import 'dart:convert';

import 'package:newpro/Pojo/pojo_matchs.dart';

class pojo_anslog{
  String id;
  String question;
  String useranswer;
  String trueans;
  String level_no;
  String que_no;
  int is_true;
  String json;
  List<Pojo_Matchs> anwer_options;
  List<Pojo_Matchs> user_anwer_options;


  pojo_anslog({this.id, this.question, this.useranswer, this.trueans,this.level_no,this.que_no,this.is_true,this.anwer_options,this.json,this.user_anwer_options});

  factory pojo_anslog.fromJson(Map<String,dynamic> parsedJson){

    List<Pojo_Matchs> matchs = new List();
    List<Pojo_Matchs> matchs1 = new List();

    if(parsedJson['answer_type'].toString()=="Match Type")
    {
      if(parsedJson['user_answer']=="s_k_i_p"){
        matchs.add(Pojo_Matchs(val1: "Skipped",val2: "Skipped"));
      }
      else {
        matchs = (jsonDecode(parsedJson['user_answer']) as List).map((data) =>
            Pojo_Matchs.fromJson((data))).toList();
      }
      matchs1= (jsonDecode(parsedJson['answer_options']) as List).map((data)=>Pojo_Matchs.fromJson((data))).toList();
    }

    return pojo_anslog(
        id: parsedJson['ID'].toString(),
        question: parsedJson['question'].toString(),
        useranswer: parsedJson['user_answer'].toString(),
        trueans: parsedJson['true_answer'].toString(),
      level_no: parsedJson['level_no'].toString(),
      que_no: parsedJson['question_no'].toString(),
      is_true: parsedJson['is_true'],
      anwer_options:parsedJson['answer_type']=="Match Type"?matchs:[],
        user_anwer_options:parsedJson['answer_type']=="Match Type"?matchs1:[],
      json: parsedJson['answer_options']

    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'question': question,
        'useranswer': useranswer,
        'trueans':trueans,
      };


}


