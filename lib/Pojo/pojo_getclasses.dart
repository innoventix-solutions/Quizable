class Classes{
  String id;
  String userid;
  String classname;
  String classicon;
  String studentinvitecode;
  String teacherinvitecode;
  String createddate;
  bool selected;


  Classes({this.id,this.userid,this.classname,this.classicon,this.studentinvitecode,
  this.teacherinvitecode,this.createddate,this.selected});


  factory Classes.fromJson(Map<String,dynamic> parsedJson){

    return Classes(
      id: parsedJson['ID'],
      userid: parsedJson['user_id'],
      classname: parsedJson['class_name'],
      classicon: parsedJson['class_icon'],
      studentinvitecode: parsedJson['student_invite_code'],
      teacherinvitecode: parsedJson['teacher_invite_code'],
      createddate: parsedJson['create_date'],
      selected: false
    );
  }
}


