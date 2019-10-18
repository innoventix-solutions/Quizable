class Subjectcount {
  String subject;
  String noRec;

  Subjectcount({this.subject, this.noRec});

  Subjectcount.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    noRec = json['no_rec'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['no_rec'] = this.noRec;
    return data;
  }
}