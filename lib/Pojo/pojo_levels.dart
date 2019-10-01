class pojo_levels {
  int level;
  int totalLevelPoint;
  int userpointAwarded;
  int totalfalseanswer;
  int totaltrueanswer;
  double percentage;

  pojo_levels(
      {this.level,
        this.totalLevelPoint,
        this.userpointAwarded,
        this.totalfalseanswer,
        this.totaltrueanswer,
        this.percentage});

  pojo_levels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    totalLevelPoint = json['total_level_point'];
    userpointAwarded = json['userpoint_awarded'];
    totalfalseanswer = json['totalfalseanswer'];
    totaltrueanswer = json['totaltrueanswer'];
    percentage = double.parse(json['percentage'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['total_level_point'] = this.totalLevelPoint;
    data['userpoint_awarded'] = this.userpointAwarded;
    data['totalfalseanswer'] = this.totalfalseanswer;
    data['totaltrueanswer'] = this.totaltrueanswer;
    data['percentage'] = this.percentage;
    return data;
  }
}