
class Pojo_StudentListResultSpelling {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalQuizpoints;
  String point_awarded;


  Pojo_StudentListResultSpelling(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalQuizpoints,this.point_awarded
      });

  factory Pojo_StudentListResultSpelling.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_StudentListResultSpelling(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['spelling_result']['point_awarded'].toString(),
      TotalQuizpoints: parsedJson['spelling_result']['TotalQuizpoints'].toString(),


    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'username':username,
        'email':email,
        'fullname':fullname,
        'userphoto':userphoto,


      };
}