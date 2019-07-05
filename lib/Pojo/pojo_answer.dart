class Pojo_Answers{
  bool selected;
  String Name;

  Pojo_Answers({this.Name,this.selected});

  factory Pojo_Answers.fromJson(Map<String, dynamic> parsedJson){



    return Pojo_Answers(
      selected: parsedJson['Selected'],
      Name: parsedJson['Text'].toString()
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'Selected': selected,
        'Text': Name,
      };

}
