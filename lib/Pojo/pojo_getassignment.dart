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
  int total_fill_question;
  String percentage;
  String progresslabel;
  String label ="-";
  String totaltime;
  String takendate;
  String attemped_questions;

  Pojo_getassignment({this.id, this.assignment_title, this.techer_id, this.total_que,
      this.teacher_instruction, this.teacher_objective, this.class_id,
      this.status, this.publish_date, this.closing_date, this.created_date,
      this.classes, this.is_taken, this.TotalAssignmentspoints, this.point_awarded,
    this.total_fill_question,
    this.percentage,
     this.progresslabel,
     this.label,
    this.takendate,this.totaltime,this.attemped_questions
  });




  factory Pojo_getassignment.fromJson(Map<String, dynamic> parsedJson){


    String date;
    if(parsedJson['status'].toString()!=null){
      int DateStatus = DateTime.now().compareTo(
          DateTime.parse(parsedJson['publish_date']));

      if(DateStatus ==-1)
      {
        date="Scheduled";

      }
      else{
          date=parsedJson['status'].toString();
      }
    }


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

    String Label="-";
    if(parsedJson['attemped_questions']!=null) {

      int AttempedQuestions = int.parse(
          parsedJson['attemped_questions'].toString());
      int TotalQuestions = int.parse(parsedJson['no_of_questions'].toString());
      DateTime closingTime = DateTime.parse(parsedJson['closing_date']);
      int DateStatus = DateTime.now().compareTo(
          DateTime.parse(parsedJson['closing_date']));
      // 0 = Same
      // -1 = Ahead
      // 1 = Gone
      int difference = TotalQuestions - AttempedQuestions;
      if (AttempedQuestions == TotalQuestions) {
        Label = "Taken";
      } else if (DateStatus == 1 && AttempedQuestions == 0) {
        Label = "Missed";
      } else if (DateStatus == 1 && AttempedQuestions > 0) {
        Label = "Taken";
      } else if (DateStatus == -1 && AttempedQuestions == 0) {
        Label = "New";
      }else if (DateStatus == -1 && AttempedQuestions == TotalQuestions) {
        Label = "Taken";
      } else if (DateStatus == -1 &&
          (AttempedQuestions > 0 && AttempedQuestions < TotalQuestions)) {
        Label = "Pending";
      }
    }
    else{
      Label="something wrong";
    }




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
      status: date,
      techer_id: parsedJson['techer_id'].toString(),
      is_taken: parsedJson['is_taken'],
      teacher_instruction: parsedJson['teacher_instruction'].toString(),
      teacher_objective: parsedJson['teacher_objective'].toString(),
      total_que: parsedJson['no_of_questions'],
      point_awarded: parsedJson['assignment_result']['point_awarded'].toString(),
      TotalAssignmentspoints: parsedJson['assignment_result']['TotalAssignmentpoints'].toString(),
      total_fill_question:parsedJson['total_fill_question'],
      percentage:parsedJson['assignment_result']['percentage'].toString(),
      progresslabel:parsedJson['assignment_result']['progresslabel'],
        totaltime: tt,
        takendate: td,
        attemped_questions: parsedJson['attemped_questions'].toString(),
        label: Label

    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,

      };
}
