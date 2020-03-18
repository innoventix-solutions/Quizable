
class Pojo_StudentListResultSpelling {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String TotalSpellingpoints;
  String point_awarded;
  String percentage;
  String progresslabel;
  String totaltime;
  String takendate;



  Pojo_StudentListResultSpelling(
      {this.id, this.username, this.email,
        this.fullname, this.userphoto,
        this.TotalSpellingpoints,this.point_awarded,
        this.totaltime,this.takendate,this.percentage,this.progresslabel
      });

  factory Pojo_StudentListResultSpelling.fromJson(Map<String, dynamic> parsedJson){

    String tt;
    String td;

    print("asdzfasd :" +parsedJson['ID'].toString());
    print("asdzfasd :" +parsedJson['spelling_attend_data'].toString());
    if(parsedJson['spelling_attend_data']==null||parsedJson['spelling_attend_data']==false)
    {
      tt="NA";
      td="NA";
    }else {


      tt=parsedJson['spelling_attend_data']['t_time'];
      td=parsedJson['spelling_attend_data']['taken_date'];
    }
    return Pojo_StudentListResultSpelling(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      point_awarded: parsedJson['spelling_result']['point_awarded'].toString(),
      TotalSpellingpoints: parsedJson['spelling_result']['Totalspellingpoints'].toString(),
      percentage:parsedJson['spelling_result']['percentage'].toString(),
      progresslabel:parsedJson['spelling_result']['progresslabel'],
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