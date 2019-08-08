class pojo_anslog{
  String id;
  String question;
  String useranswer;
  String trueans;


  pojo_anslog({this.id, this.question, this.useranswer, this.trueans});

  factory pojo_anslog.fromJson(Map<String,dynamic> parsedJson){

    return pojo_anslog(
        id: parsedJson['ID'],
        question: parsedJson['question'],
        useranswer: parsedJson['user_answer'],
        trueans: parsedJson['is_true'],

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


