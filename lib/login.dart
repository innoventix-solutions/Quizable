import 'dart:convert';
import 'package:newpro/global.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'classroomstudent.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:newpro/Pojo/pojostydentlist.dart';  //14-8-19 a

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {



  SharedPreferences prefs;
  bool isClassSelected =false;
  String selectedClass ="";

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  GetShared() async {
    prefs = await SharedPreferences.getInstance();
    print(await prefs.getString('selectedClass')??"");
    selectedClass =await prefs.getString('selectedClass')??"";

    if(selectedClass!="")
      {
        isClassSelected=true;
      }else
        {
         print("Selected Class "+selectedClass);
        }

  }



  @override
  void initState() {
    GetShared();
    // TODO: implement initState
    super.initState();
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }


  login() async {



    http.post("http://edusupportapp.com/api/login.php", body: {
      "username_email": email.text.toString(),
      "password": pass.text.toString()
    }).then((response) async {
      var statuss = jsonDecode(response.body);
      print(response.body.toString());
      //    print(response.body.toString());
      if (statuss['status'] == 1) {

        if(statuss['join_classdata'] == false ){

          print("error");

        }
        else {
          GlobalData.Class_list =
              (statuss['join_classdata'] as List).map((data) =>
                  Classes.fromJson(data)).toList();
        }
        print(GlobalData.Class_list.length.toString() + "Avilable class");

        Show_toast("Logged in Successfully", Colors.green);
        prefs.setString('Data',await jsonEncode(GlobalData.Class_list));
        prefs.setString("Id", statuss['userdata']['ID']);
        prefs.setString("type", statuss['userdata']['user_type']);
        prefs.setString("name", statuss['userdata']['username']);
        prefs.setString("classname", statuss['userdata']['class_name']);
        prefs.setString("phone", statuss['userdata']['phone_no']);  //14-8-19 a
        prefs.setString("Fullname", statuss['userdata']['fullname']);  //14-8-19 a
        prefs.setString("UserPhoto", statuss['userdata']['user_photo']);  //16-8-19  a
        prefs.setString("email", statuss['userdata']['email']);  //16-8-19  a
        prefs.setString("disc", statuss['userdata']['specification']);  //16-8-19  a
        prefs.setString("Parentsphone", statuss['userdata']['parents_phone_no']);  //16-9-19 a
        prefs.setString("parentsemail", statuss['userdata']['parents_email']);
        prefs.setString("gender", statuss['userdata']['gender']);
        prefs.setString("signupdate", statuss['userdata']['signup_date']);
        prefs.setString('dob', statuss['userdata']['birthdate']);//16-10-19
        GlobalData.Username=statuss['userdata']['username'];
        GlobalData.Phone=statuss['userdata']['phone_no'];  //14-8-19 a
        GlobalData.Fullname=statuss['userdata']['fullname'];  //14-8-19 a
        GlobalData.Userphoto=statuss['userdata']['user_photo'];   //16-8-19  a
        GlobalData.email=statuss['userdata']['email'];
        GlobalData.disc=statuss['userdata']['specification'];
        GlobalData.parentsphone=statuss['userdata']['parents_phone_no'];  //16-9-19 a
        GlobalData.parentsemail=statuss['userdata']['parents_email'];//16-9-19 a
        GlobalData.gendersel = statuss['userdata']['gender'];
        GlobalData.signupdate = statuss['userdata']['signup_date'];
        GlobalData.dob=statuss['userdata']['birthdate'];
        print(statuss['userdata']['user_type']);
        print(statuss['userdata']['ID']);
        GlobalData.uid = statuss['userdata']['ID'].toString();
        GlobalData.Username = statuss['userdata']['username'].toString();
        GlobalData.class_name = statuss['userdata']['class_name'].toString();
        GlobalData.userType = statuss['userdata']['user_type'].toString();
        GlobalData.Phone = statuss['userdata']['phone_no'].toString();  //14-8-19 a
        GlobalData.Fullname = statuss['userdata']['fullname'].toString();  //14-8-19 a
        GlobalData.gendersel = statuss['userdata']['gender'];
        GlobalData.email=statuss['userdata']['email'].toString();
        GlobalData.disc=statuss['userdata']['specification'].toString();
        GlobalData.dob=statuss['userdata']['birthdate'].toString();
        GlobalData.parentsphone=statuss['userdata']['parents_phone_no'].toString();  //16-9-19 a
        GlobalData.parentsemail=statuss['userdata']['parents_email'].toString();   //16-9-19 a
        GlobalData.signupdate = statuss['userdata']['signup_date'].toString();

        await getMembershipdetails();


        if (statuss['userdata']['user_type'] == "teacher") {

          if(GlobalData.Class_list.isNotEmpty ) {

            if(GlobalData.Class_list.length==1) {
              GetmyCurrentClass("teacherdashboard");
            }else
              {
                Navigator.of(context).pushReplacementNamed(

                    'teacherSelectClass'
                );
              }
            }
          else {
            Navigator.of(context).pushReplacementNamed(

                    'techerjoinclass'
                    );
          }

        } else if (statuss['userdata']['user_type'] == "admin_teacher") {
          if(GlobalData.Class_list.isNotEmpty ) {

            if(GlobalData.Class_list.length==1) {
              GetmyCurrentClass("teacherdashboard");
            }else
            {
              Navigator.of(context).pushReplacementNamed(

                  'teacherSelectClass'
              );
            }
          }
          else {
          Navigator.of(context).pushReplacementNamed(
              'welcome');
        }
        } else {
          if(GlobalData.Class_list.length == 0) {
            Navigator.of(context).pushReplacementNamed('studentjoin');
          }
          else
          {
            if(GlobalData.Class_list.length==1) {
              GetmyCurrentClass("studentdashboard");
            }else
            {
              Navigator.of(context).pushReplacementNamed(

                  'studentselectclass'
              );
            }

          }
        }
      } else {
        Show_toast("Invalid Username or Password", Colors.red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:100),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Image.asset(
                    'assets/images/wlogo.png',
                    width: 80,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(hintColor: GlobalData.white),
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            controller: email,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(50.0),
                                    borderSide: BorderSide(color: Colors.white)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Email:',
                                hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: 300,
                            child: Theme(
                              data: ThemeData(hintColor: GlobalData.white),
                              child: TextField(obscureText: true,
                                style: TextStyle(color: Colors.white, fontSize: 18),
                                controller: pass,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 5),
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(50.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    hintText: 'Password:',
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                              width: 270,
                              child: Text(
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: RaisedButton(
                              padding: EdgeInsets.only(
                                  left: 80, right: 80, top: 13, bottom: 13),
                              color: GlobalData.blue,
                              child: new Text(
                                "Log in",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
//                        print(email.text.toString());
//                        print(pass.text.toString());
                                login();
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0))),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Don't have an account?",style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),

                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 16,
                                fontWeight:FontWeight.bold ),),
                          ),onTap: (){
                          Navigator.of(context)
                              .pushNamed('returnsignup');
                        },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32,bottom: 20),
                          child: Center(
                            child: GestureDetector(
                                child: Text("Parent Login Here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.white,fontSize: 18)),
                                onTap: () {

                                  Navigator.of(context)
                                      .pushNamed('parentlogin');

                                  // do what you need to do when "Click here" gets clicked
                                }
                            ),
                          ),
                        )


                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }



  GetmyCurrentClass(String NamedPath)

  {
    int index=0;

    prefs.setString("selectedClass", GlobalData.Class_list[index].id);


          GlobalData.classid = GlobalData.Class_list[index].id;

          print("Class id ${GlobalData.classid}");

          GlobalData.createdclassdate =
              GlobalData.Class_list[index].createddate;
          GlobalData.student_code =
              GlobalData.Class_list[index].studentinvitecode;
          GlobalData.teacher_code =
              GlobalData.Class_list[index].teacherinvitecode;

          GlobalData.class_name =
              GlobalData.Class_list[index].classname;

          GlobalData.activeclass = GlobalData.Class_list[index];
          GlobalData.class_name =
              GlobalData.Class_list[index].classname;

          GlobalData.total_join = GlobalData.Class_list[index].total_join;

    GlobalData.adminmembership=GlobalData.Class_list[index].isactive;


    print(GlobalData.Class_list[index].classname);
          print(GlobalData.activeclass.classname);
          Navigator.of(context)
              .pushReplacementNamed(NamedPath);



  }

  getMembershipdetails()async{



    await http.post(
        "http://edusupportapp.com/api/get_user_membership.php",
        body: {
          "uid": GlobalData.uid,
        }).then((response) async {

      print(response.body.toString());

      var ParsedJson = jsonDecode(response.body);


      if(ParsedJson['membershipdata']==false)
      {


        GlobalData.MyMembership = Membership(
            id: 0.toString(),
            enddate: "---",
            isActive: false);
        setState(() {

        });

      }else {

        GlobalData.MyMembership = Membership(
            id: ParsedJson['membershipdata']['ID'],
            enddate: ParsedJson['membershipdata']['date'],
            isActive: ParsedJson['membershipdata']['is_active']);
        setState(() {

        });
      }
    });

  }

}

