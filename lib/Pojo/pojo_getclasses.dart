import 'dart:convert';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  String accountname;
  String username;
  String total_join;
  String status;
  MembershipData membershipData;


  Classes({this.id,this.userid,this.classname,this.classicon,this.studentinvitecode,
  this.teacherinvitecode,this.createddate,this.selected,this.accout_type, this.accountname,
    this.username,this.total_join,this.status,this.membershipData});


  factory Classes.fromJson(Map<String,dynamic> parsedJson){

    return Classes(
      id: parsedJson['ID'].toString(),
      userid: parsedJson['user_id'].toString(),
      classname: parsedJson['class_name'].toString(),
      classicon: parsedJson['class_icon'].toString(),
      studentinvitecode: parsedJson['student_invite_code'].toString(),
      teacherinvitecode: parsedJson['teacher_invite_code'].toString(),
      createddate: parsedJson['create_date'].toString(),
        accout_type:parsedJson['accout_type'].toString(),
        username:parsedJson['username'].toString(),
        accountname: parsedJson['account_name'].toString(),
        total_join:parsedJson['total_join'].toString(),
      status: parsedJson['status'].toString(),
      selected: false,
      membershipData: parsedJson['membership_data']==null?null:
      parsedJson['membership_data']==false?null:
      MembershipData.fromJson(parsedJson['membership_data'])

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

class MembershipData {
  String iD;
  String userId;
  String month;
  String reference;
  String date;
  bool isActive;

  MembershipData({this.iD,
    this.userId,
    this.month,
    this.reference,
    this.date,
    this.isActive});

  factory MembershipData.fromJson(Map<String,dynamic> parsedJson){

    return MembershipData(
        iD: parsedJson['ID'].toString(),
        userId: parsedJson['user_id'].toString(),
        month: parsedJson['month'].toString(),
        reference: parsedJson['reference'].toString(),
        date: parsedJson['date'].toString(),
        isActive: parsedJson['is_active']



    );
  }

}

