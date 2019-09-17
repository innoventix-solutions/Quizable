class Pojo_getassignment{
  String id;
  String assignment_title;
  String techer_id;
  //String no_of_levels;
  //String que_each_level;
  //String dur_each_level;
  //String quiz_subject;
  String total_que;
  String teacher_instruction;
  String teacher_objective;
  String class_id;
  String status;
  String publish_date;
  String closing_date;
  String created_date;
  String classes;
  bool is_taken;
  String TotalAssignmentspoints;
  String point_awarded;

  Pojo_getassignment({this.id, this.assignment_title, this.techer_id, this.total_que,
      this.teacher_instruction, this.teacher_objective, this.class_id,
      this.status, this.publish_date, this.closing_date, this.created_date,
      this.classes, this.is_taken, this.TotalAssignmentspoints, this.point_awarded});




  factory Pojo_getassignment.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_getassignment(
      id: parsedJson['ID'].toString(),
      class_id: parsedJson['class_id'].toString(),
      classes: parsedJson['classes'].toString(),
      closing_date: parsedJson['closing_date'].toString(),
      created_date: parsedJson['created_date'].toString(),
     // dur_each_level: parsedJson['dur_each_level'].toString(),
     // no_of_levels: parsedJson['no_of_levels'].toString(),
      publish_date: parsedJson['publish_date'].toString(),
      //que_each_level: parsedJson['que_each_level'].toString(),
      //quiz_subject: parsedJson['quiz_subject'].toString(),
      assignment_title: parsedJson['assignment_title'].toString(),
      status: parsedJson['status'].toString(),
      techer_id: parsedJson['techer_id'].toString(),
      is_taken: parsedJson['is_taken'],
      teacher_instruction: parsedJson['teacher_instruction'].toString(),
      teacher_objective: parsedJson['teacher_objective'].toString(),
      total_que: parsedJson['no_of_questions'],
      point_awarded: parsedJson['assignment_result']['point_awarded'].toString(),
      TotalAssignmentspoints: parsedJson['assignment_result']['TotalAssignmentpoints'].toString(),

    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,

      };
}
