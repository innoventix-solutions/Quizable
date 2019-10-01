class Classes{
  String id;
  String userid;
  String classname;
  String classicon;
  String studentinvitecode;
  String teacherinvitecode;
  String createddate;
  bool selected;
  String accout_type;
  String username;
  String total_join;
  String status;


  Classes({this.id,this.userid,this.classname,this.classicon,this.studentinvitecode,
  this.teacherinvitecode,this.createddate,this.selected,this.accout_type,this.username,this.total_join,this.status});


  factory Classes.fromJson(Map<String,dynamic> parsedJson){

    return Classes(
      id: parsedJson['ID'].toString(),
      userid: parsedJson['user_id'],
      classname: parsedJson['class_name'],
      classicon: parsedJson['class_icon'],
      studentinvitecode: parsedJson['student_invite_code'],
      teacherinvitecode: parsedJson['teacher_invite_code'],
      createddate: parsedJson['create_date'],
        accout_type:parsedJson['accout_type'],
        username:parsedJson['username'],
        total_join:parsedJson['total_join'].toString(),
      status: parsedJson['status'].toString(),
      selected: false
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'userid': userid,
        'classname': classname,
        'classicon':classicon,
        'studentinvitecode': studentinvitecode,
        'teacherinvitecode': teacherinvitecode,
        'createddate': createddate,
        'accout_type':accout_type,
        'username':username,
        'total_join':total_join,
        'status':status,
        'selected':true
      };


}


