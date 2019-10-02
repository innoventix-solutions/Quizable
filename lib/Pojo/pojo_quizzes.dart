class Pojo_quizzes{
  String id;
  String quiz_title;
  String techer_id;
  String no_of_levels;
  String que_each_level;
  String dur_each_level;
  String quiz_subject;
  String class_id;
  String status;
  String publish_date;
  String closing_date;
  String created_date;
  String classes;
  bool is_taken;
  String TotalQuizpoints;
  String point_awarded;
  String age;
  int total_fill_question;


  Pojo_quizzes({this.id, this.quiz_title, this.techer_id, this.no_of_levels,
      this.que_each_level, this.dur_each_level, this.quiz_subject,
      this.class_id, this.status, this.publish_date, this.closing_date,
      this.created_date, this.classes,this.point_awarded,this.is_taken,this.TotalQuizpoints,this.age,this.total_fill_question});

  factory Pojo_quizzes.fromJson(Map<String, dynamic> parsedJson){
    return Pojo_quizzes(
      id: parsedJson['ID'].toString(),
      class_id: parsedJson['class_id'].toString(),
      classes: parsedJson['classes'].toString(),
      closing_date: parsedJson['closing_date'].toString(),
      created_date: parsedJson['created_date'].toString(),
      dur_each_level: parsedJson['dur_each_level'].toString(),
      no_of_levels: parsedJson['no_of_levels'].toString(),
      publish_date: parsedJson['publish_date'].toString(),
      que_each_level: parsedJson['que_each_level'].toString(),
      quiz_subject: parsedJson['quiz_subject'].toString(),
      quiz_title: parsedJson['quiz_title'].toString(),
      status: parsedJson['status'].toString(),
      techer_id: parsedJson['techer_id'].toString(),
      age:parsedJson['age'].toString(),
      is_taken: parsedJson['is_taken'],
      point_awarded: parsedJson['quiz_result']['point_awarded'].toString(),
      TotalQuizpoints: parsedJson['quiz_result']['TotalQuizpoints'].toString(),
        total_fill_question:parsedJson['total_fill_question']
      
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,

      };
}
