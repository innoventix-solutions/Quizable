import 'dart:convert';

import 'package:newpro/Pojo/pojo_matchs.dart';

import '../global.dart';

class Pojo_Answers{
  bool trueanswer;
  String value;

  Pojo_Answers({this.value,this.trueanswer});

  factory Pojo_Answers.fromJson(Map<String, dynamic> parsedJson){



    return Pojo_Answers(
        trueanswer: GlobalData.userType=="student"?false:((parsedJson['trueanswer']==""||parsedJson['trueanswer']==null)?false:parsedJson['trueanswer'].toString().toLowerCase()=="true"?true:false),
        value: parsedJson['value'].toString(),

    );
  }
  Map<String, dynamic> toJson() =>
      {
        'trueanswer': trueanswer,
        'value': value,
      };

}
