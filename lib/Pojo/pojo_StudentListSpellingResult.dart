
class Pojo_StudentListResultSpelling {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalSpellingpoints;
  String point_awarded;
  String timetaken;
  String takendate;


  Pojo_StudentListResultSpelling(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalSpellingpoints,this.point_awarded,
        this.timetaken,this.takendate
      });

  factory Pojo_StudentListResultSpelling.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_StudentListResultSpelling(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['spelling_result']['point_awarded'].toString(),
      TotalSpellingpoints: parsedJson['spelling_result']['Totalspellingpoints'].toString(),
      timetaken: parsedJson['spelling_attend_data']['t_time'].toString(),
      takendate: parsedJson['spelling_attend_data']['taken_date'].toString(),



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