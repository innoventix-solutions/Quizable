class leaderboard {
  String id;
  String username;
  String email;
  String fullname;
  String userphoto;
  String phone;
  String parentemail;
  String parentphone;
  String password;
  String birthdate;
  String specification;
  String gender;
  String usertype;
  String accounttype;
  String signupdate;
  bool istaken;
  String percentage;
  String totaltime;

  leaderboard(
      {this.id, this.username, this.email, this.fullname, this.userphoto,
        this.phone, this.parentemail, this.parentphone, this.password, this.birthdate,
        this.specification, this.gender, this.usertype, this.accounttype, this.signupdate,
      this.istaken,this.totaltime,this.percentage});

  factory leaderboard.fromJson(Map<String, dynamic> parsedJson){

    String tt;
    //String td;
    print("asdzfasd :" +parsedJson['ID'].toString());
    print("asdzfasd :" +parsedJson['quiz_attend_data'].toString());
    if(parsedJson['quiz_attend_data']==null||parsedJson['quiz_attend_data']==false)
    {
      tt="NA";
      //td="NA";
    }else {


      tt=parsedJson['quiz_attend_data']['t_time'];
      //td=parsedJson['quiz_attend_data']['taken_date'];
    }

    return leaderboard(
      id: parsedJson['ID'],
      username: parsedJson['username'],
      email: parsedJson['email'],
      fullname: parsedJson['fullname'],
      userphoto: parsedJson['user_photo'],
      phone: parsedJson['phone_no'],
      parentemail: parsedJson['parents_email'],
      parentphone: parsedJson['parents_phone_no'],
      password: parsedJson['password'],
      birthdate: parsedJson['birthdate'].toString(),
      specification: parsedJson['specification'],
      gender: parsedJson['gender'],
      usertype: parsedJson['user_type'],
      accounttype: parsedJson['accout_type'],
      signupdate: parsedJson['signup_date'].toString(),
      istaken: parsedJson['is_taken'],
      totaltime: tt,
      percentage: parsedJson['percentage'].toString()

    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'username':username,
        'email':email,
        'fullname':fullname,
        'userphoto':userphoto,
        'phone':phone,
        'parentemail':parentemail,
        'parentphone':parentphone,
        'password':password,
        'birthdate':birthdate,
        'specification':specification,
        'gender':gender,
        'usertype':usertype,
        'accounttype':accounttype,
        'signupdate':signupdate,

      };
}



