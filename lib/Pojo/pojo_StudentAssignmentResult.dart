
class Pojo_StudentAssignmentResult {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalAssignmentpoints;
  String point_awarded;
  String percentage;
  String progresslabel;
  String totaltime;
  String takendate;


  Pojo_StudentAssignmentResult(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalAssignmentpoints,this.point_awarded,this.percentage,this.progresslabel,
        this.takendate,this.totaltime
      });

  factory Pojo_StudentAssignmentResult.fromJson(Map<String, dynamic> parsedJson){

    String tt;
    String td;

    print("asdzfasd :" +parsedJson['ID'].toString());
    print("asdzfasd :" +parsedJson['assignment_attend_data'].toString());
    if(parsedJson['assignment_attend_data']==null||parsedJson['assignment_attend_data']==false)
    {
      tt="NA";
      td="NA";
    }else {


      tt=parsedJson['assignment_attend_data']['t_time'];
      td=parsedJson['assignment_attend_data']['taken_date'];
    }

    return Pojo_StudentAssignmentResult(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['assignment_result']['point_awarded'].toString(),
      TotalAssignmentpoints: parsedJson['assignment_result']['TotalAssignmentpoints'].toString(),
      percentage:parsedJson['assignment_result']['percentage'].toString(),
      progresslabel:parsedJson['assignment_result']['progresslabel'],
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