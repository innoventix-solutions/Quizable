

class Pojo_Matchs{
  String val1;
  String val2;



  Pojo_Matchs({this.val1,this.val2});
  factory Pojo_Matchs.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_Matchs(
      val1: parsedJson['val1'].toString(),
      val2: parsedJson['val2'].toString(),

    );
  }
}
