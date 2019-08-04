class Pojo_Answers{
  bool trueanswer;
  String value;

  Pojo_Answers({this.value,this.trueanswer});

  factory Pojo_Answers.fromJson(Map<String, dynamic> parsedJson){

    return Pojo_Answers(
        trueanswer: (parsedJson['trueanswer']==""||parsedJson['trueanswer']==null)?false:parsedJson['trueanswer'].toString().toLowerCase()=="true"?true:true,
       // trueanswer:false,
        value: parsedJson['value'].toString()
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'trueanswer': trueanswer,
        'value': value,
      };

}
