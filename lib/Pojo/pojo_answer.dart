class Pojo_Answers{
  String selected;
  String Name;

  Pojo_Answers({this.Name,this.selected});

  factory Pojo_Answers.fromJson(Map<String, dynamic> parsedJson){



    return Pojo_Answers(
      selected: parsedJson['Selected'].toString(),
      Name: parsedJson['Text'].toString()
    );
  }
}
