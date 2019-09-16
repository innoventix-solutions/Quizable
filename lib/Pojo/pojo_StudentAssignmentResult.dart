
class Pojo_StudentAssignmentResult {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalAssignmentpoints;
  String point_awarded;


  Pojo_StudentAssignmentResult(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalAssignmentpoints,this.point_awarded
      });

  factory Pojo_StudentAssignmentResult.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_StudentAssignmentResult(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['assignment_result']['point_awarded'].toString(),
      TotalAssignmentpoints: parsedJson['assignment_result']['TotalAssignmentpoints'].toString(),


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