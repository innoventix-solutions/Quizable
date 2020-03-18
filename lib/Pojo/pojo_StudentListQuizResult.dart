
class Pojo_StudentListResult {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalQuizpoints;
  String point_awarded;
  String percentage;
  String progresslabel;
  String totaltime;
  String takendate;
  Pojo_StudentListResult(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalQuizpoints,this.point_awarded,this.totaltime,this.progresslabel,
        this.takendate,this.percentage
        });

  factory Pojo_StudentListResult.fromJson(Map<String, dynamic> parsedJson){

    String tt;
    String td;

    print("asdzfasd :" +parsedJson['ID'].toString());
    print("asdzfasd :" +parsedJson['quiz_attend_data'].toString());
    if(parsedJson['quiz_attend_data']==null||parsedJson['quiz_attend_data']==false)
    {
      tt="NA";
      td="NA";
    }else {


      tt=parsedJson['quiz_attend_data']['t_time'];
      td=parsedJson['quiz_attend_data']['taken_date'];
    }

    return Pojo_StudentListResult(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['quiz_result']['point_awarded'].toString(),
      TotalQuizpoints: parsedJson['quiz_result']['TotalQuizpoints'].toString(),
      percentage:parsedJson['quiz_result']['percentage'].toString(),
      progresslabel:parsedJson['quiz_result']['progresslabel'],
      totaltime: tt,
      takendate: td,


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