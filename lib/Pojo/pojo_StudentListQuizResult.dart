
class Pojo_StudentListResult {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalQuizpoints;
  String point_awarded;


  Pojo_StudentListResult(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalQuizpoints,this.point_awarded
        });

  factory Pojo_StudentListResult.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_StudentListResult(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['quiz_result']['point_awarded'].toString(),
      TotalQuizpoints: parsedJson['quiz_result']['TotalQuizpoints'].toString(),


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