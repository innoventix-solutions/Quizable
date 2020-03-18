
class pojouserrslist {
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

  pojouserrslist(
      {this.id, this.username, this.email, this.fullname, this.userphoto,
        this.phone, this.parentemail, this.parentphone, this.password, this.birthdate,
        this.specification, this.gender, this.usertype, this.accounttype, this.signupdate});

  factory pojouserrslist.fromJson(Map<String, dynamic> parsedJson){
    return pojouserrslist(
      id: parsedJson['ID'].toString(),
      username: parsedJson['username'].toString(),
      email: parsedJson['email'].toString(),
      fullname: parsedJson['fullname'].toString(),
      userphoto: parsedJson['user_photo'],
      phone: parsedJson['phone_no'].toString(),
      parentemail: parsedJson['parents_email'].toString(),
      parentphone: parsedJson['parents_phone_no'].toString(),
      password: parsedJson['password'].toString(),
      birthdate: parsedJson['birthdate'].toString(),
      specification: parsedJson['specification'].toString(),
      gender: parsedJson['gender'].toString(),
      usertype: parsedJson['user_type'].toString(),
      accounttype: parsedJson['accout_type'].toString(),
      signupdate: parsedJson['signup_date'].toString(),

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