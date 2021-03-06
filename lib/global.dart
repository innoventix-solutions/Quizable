import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_getclasses.dart';
import 'package:http/http.dart' as http;

import 'Pojo/pojo_questions.dart';
import 'package:newpro/Pojo/pojostydentlist.dart';
import 'package:share/share.dart';
import 'package:share/share.dart';

import 'Pojo/pojo_quizzes.dart';
import 'Pojo/pojo_spellingquestions.dart';
import 'Pojo/pojo_getspelling.dart';
import 'Pojo/pojo_getassignment.dart';
import 'Pojo/pojo_subject.dart';
import 'Pojo/pojo_quizbyclass.dart';
import 'Pojo/pojo_spellingbyclass.dart';
import 'Pojo/pojo_assignmentbyclass.dart';

class GlobalData{

  static List<Pojo_quizzes> Quizz_List = new List();
  static List<Pojo_spelling> spellinglist = new List();
  static List<Subjectcount> mysub = new List();
  static List<Pojo_quizzclass> quizclass = new List<Pojo_quizzclass>();
  static List<Pojo_spellingclass> spellingclass = new List<Pojo_spellingclass>();
  static List<Pojo_assignmentclass> assignmentclass = new List<Pojo_assignmentclass>();

  static bool EditQuiz = false;
  static Pojo_questions Current_Que_To_Edit;
  static Pojo_Spellingquestions Edit_spelling_Questions;
  static Color gradientblue = Color(0Xff1F0BE5); //a
  static Color gradientviolet = Color(0Xff730676); //a
  static Color bluecard = Color(0Xff1560A1); //a
  static Color pinkcard = Color(0XffEF5F7D); //a
  static Color blue = Color(0Xff575DFF);
  static Color white = Color(0XffFFFFFF);
  static Color greya = Color(0Xff373B44);
  static Color pink = Color(0xff4286f4);
  static Color black = Color(0Xff878787);
  static Color darkpink = Color(0XffFF4779);
  static Color darkblue = Color(0Xff000428);
  static Color darkpurple = Color(0Xff004e92);
  static Color lightblue = Color(0Xff004e92);
  static Color gray = Color(0Xff000000);
  static Color green = Color(0Xff19CB60);
  static Color navy = Color(0XffFF0099);
  static Color navyblue = Color(0xff493240);
  static Color orange = Color(0xffFF8658);
  static Color greencard = Color(0xff6DCE8A);
  static Color pinkred =  Color(0xff7F00FF);
  static Color bgblue = Color(0xff4268B3);
  static Color bgdarkblue = Color(0xff4267B8);
  static Color yellow = Color(0xffE100FF);
  static Color lightpink = Color(0xffE16B8B);
  static Color gradientStart = Colors.blue; //Change start gradient color here
  static Color gradientEnd = Colors.purple;
  static List<Classes> Class_list = new List();
  static Classes activeclass ;
  static bool LoadData = true;
  static int QuestionNumber=0;
  static String userType;
  static String accounttype;
  static String uid;
  static String class_name;
  static String class_icon;
  static String student_code;
  static String teacher_code;
  static String Username;
  static String Selected_subject;
  static String Selected_class;
  static String Selected_class_IDS;
  static List<bool> Slected_subject_bool=[false,false,false,false,false,false,false,false,false];
  static String QuizTitle="";
  static String QuizLevels="";
  static String NosofQuesPerLevel="";
  static String DurationofEachLevel="";
  static String ExamQuiz="";
  static String QuizID="";
  static String classid = "";
  static String createdclassdate = "";
  static String question = "";
  static String useranswer = "";
  static String trueans = "";
  static String CurrentStudentID="";
  static String Userphoto="";      //13-8-19 a
  static String Phone="";   //14-8-19 a
  static String Fullname="";  //14-8-19 a
  static List<pojouserrslist> Studentlist = new List();
  static String Queidofquiz = "";
  static String email ="";
  static String disc = "";
  static pojouserrslist user;   //16-9-19 a
  static String parentsphone=""; //16-9-19 a
  static String parentsemail=""; //16-9-19 a
  static String age="";
  static String accout_type="";
  static String username="";
  static String total_join="";
/* assignmment data*/
  static String AssignmentTitle="";
  static String NosofQuesassignment="";
  static String teacherinstruction="";
  static String teacherobjective="";
  static String AssignmentID="";
  static String Essayinstructions="";
  static pojouserrslist currentteacher;
  static var gendersel="";
  static int CurrentLevel=0;
  static bool isGlobal=false;
  static String signupdate="";
  static String dob="";
  static String adminmembership="";
  static String quizstatus="";
  static String questionid="";
  static String assignmentstatus="";
  static String spellingstatus="";
  static String pointawrded="";
  static String Recoveremail="";
  static String Recoverycode="";
  static String adminaccounttype;
  static String classadminid;
  static String accountname="";
  static String adminaccountname="";
  static String essayteacherid="";
  static String assignmentteacehrid="";
  static String quiztecherid="";
  static String spellteacherid="";
  static String applink="http://app.quizable.in/api/";






 AssetImage getgender(){


   return GlobalData.gendersel.toLowerCase() == "male" ?
   GlobalData.userType.toLowerCase()=="student"?
   AssetImage('assets/images/boy.png') :
   AssetImage('assets/images/man.png'):
   GlobalData.userType.toLowerCase()=="student"?
   AssetImage('assets/images/girl.png') :
    AssetImage('assets/images/women.png');


  }


  AssetImage getUserGender(String teaimg){


    return teaimg.toLowerCase() == "male" ?

    AssetImage('assets/images/man.png'):

    AssetImage('assets/images/women.png');


  }



/* spelling data*/

static String teacherguide = "";
static String spelltitle ="";
static String spellLevels = "";
static String spellNosofQuesPerLevel = "";
static String spellDurationofEachLevel ="";
static String spellingid="";
static Membership MyMembership = Membership(isActive: false,enddate: DateTime.now(),id: "adsf");

static ClassMembership classmemberships = ClassMembership(isActive: false,enddate: DateTime.now(),id: "adsf");
}

class ClassMembership{
  String id;
  DateTime enddate;
  bool isActive;

  ClassMembership({this.id, this.enddate, this.isActive});
}

class Membership{

  String id;
  DateTime enddate;
  bool isActive;

  Membership({this.id, this.enddate, this.isActive});

}
            /*Logout dialog 30-9-19*/
void showDialog1(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Log Out"),
        content: new Text("Are You Sure Want To Log Out?"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20
                  ),
                  child:  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('teacherdashboard');
                      },child: new Text("Cancel")),
                ),

              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          FlatButton(
            child: Row(
              children: <Widget>[

                GestureDetector(
                    onTap: () async {
                      LogoutFunction(context);
                      // Navigator.of(context).pushNamed('dashboard');
                    },child: new Text("Ok")),
              ],
            ),
            onPressed: () async{
              LogoutFunction(context);
              //Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
                                  //Custom drawer for quiz menu
class drawerquiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[SizedBox(height: 30,),


        /*  Container(child: Padding(
            padding: const EdgeInsets.only(bottom: 40,top: 25),
            child: DrawerHeader(child: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CircleAvatar(backgroundImage:GlobalData.Userphoto!=null?
                    NetworkImage(GlobalData.Userphoto):AssetImage('assets/images/pic.png',),
                      radius: 35.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(GlobalData.Username,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 16),),
                      ),

                        Text(GlobalData.activeclass!=null?GlobalData.activeclass.classname:"No Class Selected",
                          style: TextStyle(color: Colors.white,fontSize: 13),)
                      ],),
                  )
                ],),
            ),),
          ),decoration: bg12,),
*/


          Padding(
            padding: const EdgeInsets.only(left: 35,top:50),
            child: Row(children: <Widget>[Icon(Icons.home,color: GlobalData.lightblue,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  child: Text('Home',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  onTap: (){Navigator.of(context)
                      .pushNamed('dashboard');},
                ),
              )],),
          ),

          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.assignment,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Assignment Question Bank',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                )],),
            ),onTap: ()async{

            print("adminmembership:" +GlobalData.adminmembership.toString());
            print("classname:" +GlobalData.class_name .toString());
            print("Class ID: "+GlobalData.classid.toString());



            if(GlobalData.adminmembership == "" ||GlobalData.adminmembership==null || GlobalData.adminmembership==false.toString())

            {
              print("Level 1");

              if(GlobalData.MyMembership==null || GlobalData.MyMembership.isActive==false)
              {print("Level 2");

              await GetclassAssignment();

              // print(GlobalData.quizclass.length);

              if(GlobalData.assignmentclass!=null && GlobalData.assignmentclass.isNotEmpty)
              {

                GlobalData.userType=="admin_teacher"?
                CustomShowDialog(context,title: "Subscription Required",msg:
                "Only One Assignment with max 10 Questions is Allowed for Free User\n\nSubscribe to create more Assignment",onPressed:(){
                  Navigator.of(context).pushNamed('ManageAccount');

                }):
                CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset questions above 10.\n\nThank you",
                    onPressed:(){
                      Navigator.of(context).pushNamed('dashboard');

                    });
              }

              else {

                GlobalData.AssignmentTitle="";
                GlobalData.NosofQuesassignment="";
                GlobalData.teacherinstruction="";
                GlobalData.teacherobjective="";
                /*Navigator.of(context)
                .pushNamed('developpage');*/
                Navigator.of(context)
                    .pushNamed('SetAssignment');
              }

              }else
              {
                GlobalData.AssignmentTitle="";
                GlobalData.NosofQuesassignment="";
                GlobalData.teacherinstruction="";
                GlobalData.teacherobjective="";
                /*Navigator.of(context)
                .pushNamed('developpage');*/
                 Navigator.of(context)
                    .pushNamed('SetAssignment');
              }



            }
            else {
              GlobalData.AssignmentTitle="";
              GlobalData.NosofQuesassignment="";
              GlobalData.teacherinstruction="";
              GlobalData.teacherobjective="";
              /*Navigator.of(context)
                .pushNamed('developpage');*/
              Navigator.of(context)
                  .pushNamed('SetAssignment');
            }


          },
          ),

          Padding(
            padding: const EdgeInsets.only(left: 35,top:20),
            child: Row(children: <Widget>[Icon(Icons.live_help,color: GlobalData.lightblue,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  child: Text('Quiz Question Bank ',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  onTap: () async {
                    print("adminmembership:" +GlobalData.adminmembership.toString());
                    print("classname:" +GlobalData.class_name .toString());
                    print("Class ID: "+GlobalData.classid.toString());



                   if(GlobalData.adminmembership == "" ||GlobalData.adminmembership=="null" || GlobalData.adminmembership==false.toString())

                   {
                     print("Level 1");

                        if(GlobalData.MyMembership==null || GlobalData.MyMembership.isActive==false)
                        {print("Level 2");

                          await Getclassquiz();

                         // print(GlobalData.quizclass.length);

                      if(GlobalData.quizclass!=null && GlobalData.quizclass.isNotEmpty)
                        {

                              GlobalData.userType=="admin_teacher"?
                              CustomShowDialog(context,title: "Subscription Required",msg:
                              "Only One Quiz with maximum 10 Questions with one Level is Allowed for Free User\n\nSubscribe to create more Quiz",onPressed:(){
                                Navigator.of(context).pushNamed('ManageAccount');

                              }):
                              CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                              "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset multi-level questions above 10.\n\nThank you",
                                  onPressed:(){
                                    Navigator.of(context).pushNamed('dashboard');

                                  });
                        }

                      else {
                        GlobalData.QuizTitle  = "";
                        GlobalData.QuizLevels = "";
                        GlobalData.NosofQuesPerLevel = "";
                        GlobalData.DurationofEachLevel =  "";
                        GlobalData.Selected_subject = null ;
                        GlobalData.Selected_class = null;

                        Navigator.of(context)
                            .pushNamed('setquizquestions');
                      }

                    }else
                    {
                      GlobalData.QuizTitle  = "";
                      GlobalData.QuizLevels = "";
                      GlobalData.NosofQuesPerLevel = "";
                      GlobalData.DurationofEachLevel =  "";
                      GlobalData.Selected_subject = null ;
                      GlobalData.Selected_class = null;
                      Navigator.of(context)
                          .pushNamed('setquizquestions');
                    }



                  }
                  else {
                     GlobalData.QuizTitle  = "";
                     GlobalData.QuizLevels = "";
                     GlobalData.NosofQuesPerLevel = "";
                     GlobalData.DurationofEachLevel =  "";
                     GlobalData.Selected_subject = null ;
                     GlobalData.Selected_class = null;
                     Navigator.of(context)
                         .pushNamed('setquizquestions');
                   }

    }
                ),
              )],),
          ),

          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.offline_pin,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Spelling challenge Bank',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                ),],),
            ),onTap: ()async{
            print("adminmembership:" +GlobalData.adminmembership.toString());
            print("classname:" +GlobalData.class_name .toString());
            print("Class ID: "+GlobalData.classid.toString());



            if(GlobalData.adminmembership == "" ||GlobalData.adminmembership=="null" || GlobalData.adminmembership==false.toString())

            {
              print("Level 1");

              if(GlobalData.MyMembership==null || GlobalData.MyMembership.isActive==false)
              {print("Level 2");

              await GetclassSpellinng();



              if(GlobalData.spellingclass!=null && GlobalData.spellingclass.isNotEmpty)
              {

                GlobalData.userType=="admin_teacher"?
                CustomShowDialog(context,title: "Subscription Required",msg:
                "Only One Spelling with maximum 10 Questions with one Level is Allowed for Free User\n\nSubscribe to create more Spellings",onPressed:(){
                  Navigator.of(context).pushNamed('ManageAccount');

                }):
                CustomShowDialog(context,title: "SUBSCRIPTION REQUIRED",msg:
                "Your Class Admin is on a Trial Subscription. \n\nPlease refer to Class Admin to upgrade account to enable you \nset multi-level questions above 10.\n\nThank you",
                    onPressed:(){
                      Navigator.of(context).pushNamed('dashboard');

                    });
              }

              else {
                GlobalData.spelltitle = "";
                GlobalData.spellLevels = "";
                GlobalData.spellNosofQuesPerLevel = "";
                GlobalData.spellDurationofEachLevel = "";
                GlobalData.teacherguide = "";
                GlobalData.Selected_subject = null ;
                    GlobalData.Selected_class = null;

                Navigator.of(context)
                    .pushNamed('setspellingque');
              }

              }else
              {

                GlobalData.spelltitle = "";
                GlobalData.spellLevels = "";
                GlobalData.spellNosofQuesPerLevel = "";
                GlobalData.spellDurationofEachLevel = "";
                GlobalData.teacherguide = "";
                GlobalData.Selected_subject = null ;
                GlobalData.Selected_class = null;
                Navigator.of(context)
                    .pushNamed('setspellingque');
              }



            }
            else {

              GlobalData.spelltitle = "";
              GlobalData.spellLevels = "";
              GlobalData.spellNosofQuesPerLevel = "";
              GlobalData.spellDurationofEachLevel = "";
              GlobalData.teacherguide = "";
              GlobalData.Selected_subject = null ;
              GlobalData.Selected_class = null;
              Navigator.of(context)
                  .pushNamed('setspellingque');
            }

          },
          ),

          GestureDetector(

            child: Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.power_settings_new,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Log out',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                ),],),
            ),onTap: ()async{
            showDialog1(context);
          },
          ),




        ],
      ),
    );
  }
}





Show_toast_Now(String msg,Color color){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb	: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

var bg = new BoxDecoration(
  gradient: new LinearGradient(
      colors: [GlobalData.gradientStart, GlobalData.gradientEnd],
      begin: const FractionalOffset(0.5, 0.0),
      end: const FractionalOffset(0.0, 0.5),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

var bg12 = BoxDecoration(
  gradient: LinearGradient(
    colors: <Color>[GlobalData.darkblue, GlobalData.darkpurple],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  ),
);

/*Custom Card*/
class CustomCard extends StatelessWidget {
  final Color cardcolor;
  final String text;

  //final Icon icon;
  final Image image;

  CustomCard({this.cardcolor, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 25),
              child: SizedBox(
                child: Card(
                  color: cardcolor,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        image,
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            text,
                            style: TextStyle(
                                fontSize: 13,
                                color: GlobalData.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
/*Custom dropdown*/

class Mydropdown extends StatelessWidget {
  final List<String> dropdownValues;

  final String hint;
  final VoidCallback onChanged;

  Mydropdown({this.dropdownValues, this.hint,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: dropdownValues
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
      onChanged:(value){ onChanged;},
      isExpanded: false,
      hint: Text(hint),
    );
  }
}

class MyText extends StatelessWidget {
  final String hint;
  final Icon icon2;
  final VoidCallback onPressed;
  final TextEditingController controller;

  MyText({this.hint, this.icon2, this.onPressed, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      padding: EdgeInsets.only(bottom: 10),
      child: new Theme(
        data: new ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: TextField(
          controller: controller,
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.only(left: 5),
              border: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: new BorderRadius.circular(50.0),
              ),
              prefixIcon: icon2,
              hintText: (hint),
              hintStyle: TextStyle(color: GlobalData.black)),
        ),
      ),
    );
  }
}

class CusstomText extends StatefulWidget {
  @override
  _CusstomTextState createState() => _CusstomTextState();
}

class _CusstomTextState extends State<CusstomText> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(hintColor: GlobalData.white),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
            prefixIcon: Icon(
              Icons.account_circle,
              color: GlobalData.blue,
            ),
            hintText: 'User Name',
            hintStyle: TextStyle(color: GlobalData.black)),
      ),
    );
  }
}

class CustomTextFieldBorder extends StatelessWidget {
  final Color hintColor;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final bool password;
  final keyboardtype;
  final int min;
  final int max;






  CustomTextFieldBorder(
      {this.controller,
      this.hintColor,
      this.icon,
      this.hintText,
      this.hintStyle,
      this.password,
      this.keyboardtype,
        this.max,
        this.min
      });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
        child: Theme(
          data: ThemeData(hintColor: hintColor),
          child: TextField(keyboardType: keyboardtype,
            obscureText: password == null?false:true,
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5),
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: Colors.white)),
                prefixIcon: icon,
                hintText: hintText,
                hintStyle: hintStyle,
            ),

          ),
        ),
      ),
    );
  }
}


class CustomTextFieldBorderNew extends StatelessWidget {
  final Color hintColor;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final bool password;
  final keyboardtype;
  final int min;
  final int max;






  CustomTextFieldBorderNew(
      {this.controller,
        this.hintColor,
        this.icon,
        this.hintText,
        this.hintStyle,
        this.password,
        this.keyboardtype,
        this.max,
        this.min
      });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
        child: Theme(
          data: ThemeData(hintColor: hintColor),
          child: TextField(keyboardType: keyboardtype,
            obscureText: password == null?false:true,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.white)),
              prefixIcon: icon,
              hintText: hintText,
              hintStyle: hintStyle,
            ),

          ),
        ),
      ),
    );
  }
}



class appbar extends StatefulWidget {
  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: (){},
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Center(
        child: Text(
          "Add Student",
          style: TextStyle(fontSize: 22),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [GlobalData.darkblue, GlobalData.darkpurple],
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class GradientButtonText extends StatelessWidget {
  final Text text;
  final LinearGradient linearGradient;
  final VoidCallback ButtonClick;

  GradientButtonText({this.ButtonClick, this.text, this.linearGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          splashColor: Colors.blue,
          onTap: () {
            ButtonClick();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: text,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Color hintColor;
  final String Texth;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final bool Inputnumber ;
  final bool enabled;
  final int maxline;

  CustomTextField(
      {this.controller,
        this.hintColor,
        this.Inputnumber,
        this.Texth,
        this.enabled,
        this.hintStyle,
      this.maxline});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.bottomLeft,

          ),
        ),
        Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(maxLines: maxline,
              enabled: enabled==null?true:false,
              keyboardType: Inputnumber==true?TextInputType.numberWithOptions(decimal: false,signed:false):TextInputType.visiblePassword,
              decoration:
              InputDecoration(border: InputBorder.none,hintText: Texth,hintStyle: hintStyle),
              textAlign: TextAlign.left,style: TextStyle(color: Colors.black),
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}

class calc extends StatelessWidget {

  final String number;


  calc(
  {
    this.number,

}
      );
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(number,style: TextStyle(
                fontSize: 14,color: GlobalData.gray,
              ),),onPressed: (){},color: GlobalData.white
            )
          ],
        ),

      );
  }
}


/*class quizstatus extends StatelessWidget {


  DateTime closingdate;
  DateTime currentdate=DateTime.now();
  int totallevel;
  int attemptedlevel;
  String istaken;
  Color color;


  quizstatus({this.closingdate,this.attemptedlevel,this.currentdate,this.totallevel,this.istaken});

  @override
  Widget build(BuildContext context) {

    if(currentdate.isAfter(closingdate)){
      istaken="Missed";
      color=Colors.red;
    }
    if(totallevel==attemptedlevel){
      istaken="Taken";
      color=Colors.green;
    }
    else if(totallevel > attemptedlevel)
    {
      istaken="Retake";
      color=Colors.deepOrange;
    }


    Card(color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(istaken,style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 15,color: GlobalData.white),textAlign: TextAlign.center,),
      ),
    );
  }
}*/


class classactivitys extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String levels;
  final String duration;
  final String closingdate;
  final Pojo_quizzes quiz;


  classactivitys(
      {
        this.heading,
        this.paragraph,
        this.color,
      this.title,
      this.id,
      this.is_taken,
      this.duration,
      this.levels,
      this.closingdate,
      this.quiz});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                           if(value=="edit")
                                             {
                                               GlobalData.EditQuiz=true;
                                               GlobalData.QuizID=id;
                                               GlobalData.ExamQuiz=title;
                                               Navigator.of(context).pushNamed('Question_List');
                                             }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                    Expanded(
                      child: Card(color: is_taken?Colors.green:Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Text(quiz.label,style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: GlobalData.white),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(children: <Widget>[
                 Card(color: Colors.red,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Closing Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                     color: GlobalData.white),textAlign: TextAlign.center,),
                   ),
                 ),
                 Text(closingdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,
                     color: GlobalData.gray),textAlign: TextAlign.center,),

               ],),
             )

             /* GestureDetector(
                onTap: (){




                  GlobalData.QuizID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("QID"+(id==null?" Null Value":id));
//print("Title : "+title);
//                    print("levels : "+levels);
//print("Duration : "+duration);



                    GlobalData.ExamQuiz=title;
                    GlobalData.DurationofEachLevel=duration;
                    GlobalData.QuizLevels=levels??"1";
                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AnswerLog':'studentLevelList');


                  }else
                    {

                      Navigator.of(context).pushNamed('StudentListByQuiz');
                    }

                },
                child: GlobalData.userType=="student"?Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: (is_taken==true)?Colors.blue:Colors.green),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(is_taken==true?"Quiz Report":"Give Exam",textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                    ),

                                ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                ):
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Quiz Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/





            ],
          ),

        ),
      );
  }
}

class GlobalQuizActivity extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;

  final String levels;
  final String duration;
  final String closingdate;
  final Pojo_quizzes quiz;


  GlobalQuizActivity(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,

        this.duration,
        this.levels,
        this.closingdate,
      this.quiz});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {
                                              GlobalData.EditQuiz=true;
                                              GlobalData.QuizID=id;
                                              GlobalData.ExamQuiz=title;
                                              Navigator.of(context).pushNamed('Question_List');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                 /*   Expanded(
                      child: Card(color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(quiz.label,style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: GlobalData.white),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),*/


                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 25,top: 5,right: 30,bottom: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(levels +" Levels",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                    Expanded(
                      child: Text(duration +" Minutes",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),


                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Card(color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Closing Date : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                          color: Colors.white),textAlign: TextAlign.center,),
                    ),
                  ),
                  Text(closingdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,
                      color: GlobalData.gray),textAlign: TextAlign.center,),

                ],),
              ),









            ],
          ),

        ),
      );
  }
}




class levelcomplete extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;

  levelcomplete(
      {
        this.heading,
        this.paragraph,
        this.color});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(heading,textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(paragraph,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                  ],
                ),
              ),





            ],
          ),

        ),
      );
  }
}


/*class option {
  bool selected;
  String Text;
  option({this.selected,this.Text});
  option.fromJson(Map<String, dynamic> json)
      : selected = json['selected'],
        Text = json['Text'];
  Map<String, dynamic> toJson() =>
      {
        'Selected': selected,
        'Text': Text,
      };
}*/

class point{
  String pointessay;

  point({this.pointessay});
  point.fromJson(Map<String, dynamic> json)
      :pointessay = json['point'];
  Map<String, dynamic> toJson() =>
      {
        'point':pointessay,
      };
}

class option {
  bool trueanswer;
  String value;
  option({this.trueanswer,this.value});
  option.fromJson(Map<String, dynamic> json)
      : trueanswer = json['trueanswer'],
        value = json['value'];
  Map<String, dynamic> toJson() =>
      {
        'trueanswer': trueanswer,
        'value': value,
      };
}

class MatchClass {
  String val1;
  String val2;
  MatchClass({this.val1,this.val2});
  MatchClass.fromJson(Map<String, dynamic> json)
      : val1 = json['val1'],
        val2 = json['val2'];
  Map<String, dynamic> toJson() =>
      {
        'val1': val1,
        'val2': val2,
      };
}

ClearRegisterData(){

 GlobalData.Selected_subject=null;
 GlobalData.Selected_class;
 GlobalData.Selected_class_IDS;
 GlobalData.Slected_subject_bool=[false,false,false,false,false,false,false,false,false];
 GlobalData.QuizTitle="";
 GlobalData.QuizLevels="";
 GlobalData.NosofQuesPerLevel="";
 GlobalData.DurationofEachLevel="";
 GlobalData.ExamQuiz="";
 GlobalData.QuizID="";
 GlobalData.QuestionNumber=0;
 GlobalData.age="";
 GlobalData.AssignmentTitle="";  //20-8-19
  GlobalData.NosofQuesassignment="";   //20-8-19
  GlobalData.teacherinstruction="";   //20-8-19
  GlobalData.AssignmentID="";         //26-8-19
  GlobalData.teacherobjective="";     //5-9-19
  GlobalData.spelltitle="";
  GlobalData.spellLevels="";
  GlobalData.spellDurationofEachLevel="";
  GlobalData.spellNosofQuesPerLevel="";
  GlobalData.teacherguide="";
  GlobalData.spellingid="";
}


LogoutFunction(context)async {

  SharedPreferences pre= await SharedPreferences.getInstance();
  pre.clear();


  GlobalData.Class_list = new List();

  GlobalData.activeclass=null;
  GlobalData.LoadData = true;
  GlobalData.QuestionNumber=0;
  GlobalData.userType=null;
  GlobalData.accounttype;
  GlobalData.uid;
  GlobalData.class_name;
  GlobalData.class_icon;
  GlobalData.student_code;
  GlobalData.teacher_code;
  GlobalData.Username;
  GlobalData.Selected_subject;
  GlobalData.Selected_class;
  GlobalData.Selected_class_IDS;
  GlobalData.Slected_subject_bool=[false,false,false,false,false,false,false,false,false];
  GlobalData.QuizTitle="";
  GlobalData.QuizLevels="";
  GlobalData.NosofQuesPerLevel="";
  GlobalData.DurationofEachLevel="";
  GlobalData.ExamQuiz="";
  GlobalData.QuizID="";
  GlobalData.age="";
  GlobalData.parentsphone="";
  GlobalData.parentsemail="";
  GlobalData.adminmembership=null;

  //5-9-19
  GlobalData.AssignmentTitle="";
  GlobalData.teacherobjective="";
  GlobalData.teacherinstruction="";
  GlobalData.AssignmentID="";
  GlobalData.NosofQuesassignment="";
  GlobalData.MyMembership=null;
  GlobalData.classmemberships=null;

  GlobalData.spelltitle="";
  GlobalData.spellLevels="";
  GlobalData.spellDurationofEachLevel="";
  GlobalData.spellNosofQuesPerLevel="";
  GlobalData.teacherguide="";
  GlobalData.spellingid="";
  GlobalData.quizclass=null;
  GlobalData.Selected_class_IDS=null;
  GlobalData.Selected_class=null;
  GlobalData.accountname="";
  GlobalData.adminaccountname="";
  GlobalData.accounttype="";


  // Navigator.of(context).dispose();
  // await Navigator.of(context).dispose();
  // Navigator.of(context).pushNamed('login');
  Navigator.of(context)
      .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
}


Getstudent() async {



   await http.post(GlobalData.applink+"login.php", body: {
      "username_email": GlobalData.parentsemail,
      "type":"parents_login"
    }).then((response) async {
      var statuss = jsonDecode(response.body);
      print(response.body.toString());

      if (statuss['userdata'].toString()!= null || statuss['userdata'].toString()!= "false") {
        print(statuss['userdata']);
        GlobalData.Studentlist = (statuss['userdata'] as List)
            .map((data) => pojouserrslist.fromJson(data))
            .toList();
      }
      else{

        print("TESTSTDBFBH");
      }

      print("STUDENTSLIST "+ GlobalData.Studentlist.length.toString());


    });
  }


 GetMyClasses() async{

  await http.post(GlobalData.applink+"get_teacher_classes.php",body: {
    "UserId":GlobalData.uid
  }).then((res) async {

    print(res.body);
    var ParsedData = await jsonDecode(res.body);

    if(ParsedData['join_classdata']== false) {

    }
    else
      {
      GlobalData.Class_list =
          (ParsedData['join_classdata'] as List).map((data) =>
              Classes.fromJson(data)).toList();


        //GlobalData.userType="teacher";
    }




  }

  );

}

class shareclasscode extends StatelessWidget {

  final String classname;
  final String studentcode;
  final String teachercode;
  final Image image;

  shareclasscode({this.classname, this.studentcode, this.teachercode,this.image});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: <Widget>[
          Expanded(
            child: new

            ListView.builder(
                itemCount: classname.length,

                itemBuilder: (BuildContext ctxt, int index) {
                  return  GestureDetector(

                    child: Column(
                      children: <Widget>[
                        Container(

                          child: Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  image,
                                ],
                              ),


                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:30),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                      Text(studentcode,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                            fontSize: 14),),
                                      Text(teachercode,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                            fontSize: 14),),

                                    ],
                                  ),
                                ),
                              ),


                            ], ),
                        ),
                        new Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),


        ],
      );
  }
}

/*  recxent que code */

class recentquestions extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final String schedule;

  recentquestions(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.schedule
      });

  @override
  Widget build(BuildContext context) {


    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),


                    Expanded(
                      child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),



                  ],
                ),

              ),


              Container(child:Padding(
                padding: const EdgeInsets.only(left: 25,top: 0,right: 30,bottom: 10),
                child: Row(
                  children: <Widget>[

                       Text(schedule,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                  ],
                ),
              ) ,),

              SizedBox(height: 10,),





            ],
          ),

        ),
      );
  }
}

/* Quiz Exercise log */   // 22-8-19

class QuizExerciseLog extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String levels;
  final String duration;
  //final String percent;
  final String progresslabel;

  QuizExerciseLog(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
      this.is_taken,
      this.duration,
      this.levels,
      //this.percent,
      this.progresslabel});

  @override
  Widget build(BuildContext context) {







    String TimerText ="-:--:--";

    String RoundTime(String time){

      if(time.length==1)
      {
        time ="0"+time;
      }

      return time;

    }
    String getLevelTime(){

      // Show_toast_Now(TimerText.substring(2,4),Colors.green);
      int second = int.parse(TimerText.substring(5,7));
      int min = int.parse(TimerText.substring(2,4));
      int ConsumedTime = (int.parse(GlobalData.DurationofEachLevel)*60)-((min*60)+second);
      int usedSecond= ConsumedTime%60;
      int usedMin = (ConsumedTime/60).floor();
      int hour = usedMin==0?0:(usedMin/60).floor();

      String ActualTime = RoundTime(hour.toString())+":"+RoundTime(usedMin.toString())+":"+RoundTime(usedSecond.toString());

      //  Show_toast_Now(RoundTime(hour.toString())+":"+RoundTime(usedMin.toString())+":"+RoundTime(usedSecond.toString()),Colors.green);




      return ActualTime;

    }






    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                   ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                              getscore(grade:progresslabel)],
                          ),
                        ),
                        Spacer(),

                        //getscoreborder(per: double.parse(percent),),
                     ],
                    ),

                   ],
                ),
              ),

              /*GestureDetector(
                onTap: (){




                  GlobalData.QuizID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("QID"+(id==null?" Null Value":id));
//print("Title : "+title);
//                    print("levels : "+levels);
//print("Duration : "+duration);



                    GlobalData.ExamQuiz=title;
                    GlobalData.DurationofEachLevel=duration??"20";
                    GlobalData.QuizLevels=levels??"1";
                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AnswerLog':'exam');


                  }else
                  {

                    Navigator.of(context).pushNamed('StudentListByQuiz');
                  }

                },
                child:
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Quiz Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                 ]),
                              ),

                              ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/




            ],
          ),

        ),
      );
  }
}




class QuizResult extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String levels;
  final String duration;
  final String percent;
  final String progresslabel;
  final String timetaken;

  QuizResult(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
        this.duration,
        this.levels,
        this.percent,
        this.progresslabel,
        this.timetaken
      });

  @override
  Widget build(BuildContext context) {







    String TimerText ="-:--:--";

    String RoundTime(String time){

      if(time.length==1)
      {
        time ="0"+time;
      }

      return time;

    }






    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 3),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right:4),
                                    child: PopupMenuButton(
                                      child: GestureDetector(
                                          onTap: (){
                                            Share.share("My Quizable Quiz Result \n \n"+ GlobalData.Username + " completed Quiz: " + heading + "\n \n"+"My result is: " + percent +" %"
                                                +"\n"  + progresslabel);



                                          },child: Icon(Icons.share,color: Colors.white,)),
                                      itemBuilder: (_) => <PopupMenuItem<String>>[
                                        /*new PopupMenuItem<String>(
                                            child: GestureDetector(onTap: (){
                                              Navigator.of(context).pushNamed('levelsList');
                                            },
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: Icon(
                                                      Icons.remove_red_eye,
                                                      color: GlobalData.pinkred,size: 14,
                                                    ),
                                                  ),
                                                  new Text('View',style: TextStyle(fontSize: 15),),
                                                ],
                                              ),
                                            ),),*/

                                       /* PopupMenuItem<String>(
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 4),
                                                child: GestureDetector(onTap: (){
                                                  Share.share("Title Of Quiz Is: " + heading + "\n" "Student Name: " + GlobalData.Username+" \n"+"Grade Of Student is: " + percent +" "
                                                      +"\n" + "Result: " + progresslabel);

  },
                                                  child: Icon(
                                                    Icons.share,
                                                    color: GlobalData.pinkred,size: 14,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(onTap: (){
    Share.share("My EduSupport Quiz Result \n \n"+ GlobalData.Username + " completed Quiz: " + heading + "\n \n"+"My result is: " + percent +" %"
    +"\n"  + progresslabel);

    }
                                              ,
                                                  child: new Text('Share',style: TextStyle(fontSize: 15),)),
                                            ],
                                          ),),*/
                                      ],

                                    )
                                  ),],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 10,right: 30,bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                              getscore(grade:progresslabel)],
                          ),
                        ),
                        Spacer(),

                        getscoreborder(per: double.parse(percent),),

                      ],
                    ),Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Time : " + timetaken,style: TextStyle(fontSize: 14,color: Colors.black),)),
                          Expanded(child: Text("Exam Date : " + title,style: TextStyle(fontSize: 14,color: Colors.black),)),

                        ],
                      ),
                    )

                  ],
                ),
              ),






            ],
          ),

        ),
      );
  }
}


class getscore extends StatelessWidget {

  String grade;
  Color color;

  getscore({this.grade});

  @override
  Widget build(BuildContext context) {

    if(grade=="Fair"){
      color=Colors.amber;
    }
    else if(grade=="Fail"){
      color=Colors.red;
    }
      else if(grade=="Pass")
      {
        color=Colors.green;
      }
    else if(grade=="Excellent"){
      color=Colors.purple;

    }

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Card(elevation: 5,
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(grade,textAlign: TextAlign.center,style:
            TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          constraints: BoxConstraints(
              maxHeight: 100.0,
              maxWidth: 100.0,
              minWidth: 70.0,
              minHeight: 10.0
          ),
        ),
      ),


    );
  }
}



class getscoreborder extends StatelessWidget {

  double per;
  Color color;

  getscoreborder({this.per});

  @override
  Widget build(BuildContext context) {

    if(per>= 25 && per<50){
      color=Colors.amber;
    }
    else if(per<25){
      color=Colors.red;
    }
    else if(per >= 50 && per<75)
    {
      color=Colors.green;
    }
    else if(per>= 75){
      color=Colors.purple;

    }

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: new Border.all(
            color:color,
            width: 5,


          ),
          color: Colors.white,



        ),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
          Text(per.toString() + "%", textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),


    );
  }
}



/* Preview Quiz*/

class PreviewQuizs extends StatelessWidget {

  final bool isActive;
  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
 // final bool is_taken;
  final String levels;
  final String duration;
  final bool incomplete;
  final int  continueTo;
  final String publishedDate;
  final String classes;
  final Pojo_quizzes Quiz;
  final Pojo_spelling Spelling;


  PreviewQuizs(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
      //  this.is_taken,
        this.duration,
        this.levels,
      this.isActive,this.incomplete,this.continueTo,this.publishedDate,this.classes,this.Quiz,this.Spelling});


  // 28-8-19 a
  Delete(String id) async{

    await http.post(GlobalData.applink+"delete_quiz.php",
        body: {
          "quiz_id":GlobalData.QuizID,
        }).then((res){
      print(res.body);
        });
  }

      //29-8-19 a
  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are You Sure Want To Delete selected Quiz?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50
                    ),
                    child: new Text("Cancel"),

                  ),

                ],
              ),
              onPressed: (){
                Navigator.of(context).pushNamed('previewQuiz');

              },

            ),

            new FlatButton(
              child: Row(
                children: <Widget>[

                  new Text("Ok"),
                ],
              ),
              onPressed: (){
                Delete(id);
                Show_toast("Delete Successfully", Colors.green);
                Navigator.of(context).pushNamed('dashboard');
              },

            )
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
//29-8-19 a


  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):
                                        isActive?
                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){

                                            if(value=="delete")     //28-8-19 a
                                                {

                                              print("QuizTecaherid: " + GlobalData.quiztecherid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.quiztecherid==GlobalData.uid?
                                              showDialog1(context):
                                              Show_toast_Now("Access Denied", Colors.red);
                                            }
                                          },
                                        )
                                            :

                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {
                                              GlobalData.EditQuiz=true;
                                              GlobalData.QuizID=id;
                                              GlobalData.ExamQuiz=title;
                                              GlobalData.QuizLevels=levels;
                                              GlobalData.QuizTitle=title;
                                              GlobalData.DurationofEachLevel=duration;

                                              print("QuizTecaherid: " + GlobalData.quiztecherid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.quiztecherid==GlobalData.uid?

                                              Navigator.of(context).pushNamed('levelsList')
                                                  :
                                              Show_toast_Now("Access Denied", Colors.red);
                                            }
                                            if(value=="delete")     //28-8-19 a
                                               {
                                              print("QuizTecaherid: " + GlobalData.quiztecherid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.quiztecherid==GlobalData.uid?

                                                showDialog1(context)
                                              :
                                            Show_toast_Now("Access Denied", Colors.red);

                                          }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Classes : "+Quiz.classes,style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
    SizedBox(height: 10,),
                            Text("Created On: " + Quiz.created_date,style:
                            TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text(isActive?"Published on :"+Quiz.publish_date:"Scheduled :"+Quiz.publish_date,style:
                            TextStyle(color: isActive?Colors.green:Colors.red,fontWeight: FontWeight.bold),),
    SizedBox(height: 10,),
                            Text("Closing On: "+Quiz.closing_date,style:
                            TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
    SizedBox(height: 10,)
                          ],
                        ),
                      ),),
                    ),
                    incomplete?
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(color: Colors.red,child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Incomplete",style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),),
                    ):Text(""),

                    /*Icon(Icons.remove_red_eye,color: isActive?Colors.green:Colors.red,)*/

                  ],
                ),
              ),

              /*GestureDetector(
                onTap: (){




                  GlobalData.QuizID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("QID"+(id==null?" Null Value":id));
//print("Title : "+title);
//                    print("levels : "+levels);
//print("Duration : "+duration);



                    GlobalData.ExamQuiz=title;
                    GlobalData.DurationofEachLevel=duration??"20";
                    GlobalData.QuizLevels=levels??"1";
                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AnswerLog':'exam');


                  }else
                  {

                    Navigator.of(context).pushNamed('StudentListByQuiz');
                  }

                },
                child: GlobalData.userType=="student"?Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: (is_taken==true)?Colors.blue:Colors.green),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(is_taken==true?"Quiz Report":"Give Exam",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                ):
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Quiz Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/





            ],
          ),

        ),
      );
  }
}


/*2nd sept*/

class StudentActivityReport extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String levels;
  final String duration;


  StudentActivityReport(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
        this.duration,
        this.levels});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),


                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Subject: " + paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text("Publish Date: " + title,style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Row(
                            children: <Widget>[
                              Text("Total Levels: " + levels,style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),







            ],
          ),

        ),
      );
  }
}



/* Preview Assignments */
/*3-9-19*/

/*class PreviewAssignments extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  // final bool is_taken;
  // final String levels;
  // final String duration;


  PreviewAssignments(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        //  this.is_taken,
        // this.duration,
        //this.levels
      });


  // 3-9-19 a
  Deleteassignment() async{

    await http.post("http://edusupportapp.com/api/delete_assignment.php",
        body: {
          "assignment_id":GlobalData.AssignmentID,
        }).then((res){
      print(res.body);



    });
  }

  //3-9-19 a
  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are You Sure Want To Delete selected Assignment?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Deleteassignment();
                          Show_toast("Delete Successfully", Colors.green);
                          Navigator.of(context).pushNamed('dashboard');
                        },child: new Text("Ok")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('Previewassignment');
                      },child: new Text("Cancel")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
//29-8-19 a


  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {
                                              GlobalData.EditQuiz=true;
                                              GlobalData.AssignmentID=id;
                                              GlobalData.ExamQuiz=title;
                                              Navigator.of(context).pushNamed('AssignmentQuestionList');
                                            }
                                            if(value=="delete")     //28-8-19 a
                                                {
                                              showDialog1(context);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                  ],
                ),
              ),





            ],
          ),

        ),
      );
  }
}*/


class PreviewAssignments extends StatelessWidget
{

  final bool isActive;
  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  // final bool is_taken;
  //final String levels;
  //final String duration;
  final bool incomplete;
  final int  continueTo;
  final String publishedDate;
  final String classes;

  final Pojo_getassignment Assignment;


  PreviewAssignments(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        //  this.is_taken,
        //this.duration,
       // this.levels,
        this.isActive,this.incomplete,this.continueTo,this.publishedDate,this.classes,this.Assignment});


  // 28-8-19 a
  Delete(String id) async{

    await http.post(GlobalData.applink+"delete_assignment.php",
        body: {
          "assignment_id":GlobalData.AssignmentID,
        }).then((res){
      print(res.body);
    });
  }

  //29-8-19

  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog

        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are You Sure Want To Delete selected Assignment?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('Previewassignment');
                        },child: new Text("Cancel")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Delete(id);
                        Show_toast("Delete Successfully", Colors.green);
                        Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
//29-8-19 a


  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):
                                        isActive?
                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){

                                            if(value=="delete")     //28-8-19 a
                                                {
                                              print("AssignmentTecaherid: " + GlobalData.assignmentteacehrid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.assignmentteacehrid==GlobalData.uid?
                                              showDialog1(context):
                                              Show_toast_Now("Access Denied", Colors.red);
                                            }
                                          },
                                        )
                                            :

                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {
                                              GlobalData.EditQuiz=true;
                                              GlobalData.AssignmentID=id;
                                              GlobalData.ExamQuiz=title;

                                              GlobalData.AssignmentTitle=title;
                                              //GlobalData.=duration;

                                              print("AssignmentTecaherid: " + GlobalData.assignmentteacehrid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.assignmentteacehrid==GlobalData.uid?
                                              Navigator.of(context).pushNamed('AssignmentQuestionList'):
                                              Show_toast_Now("Access Denied", Colors.red);
                                            }
                                            if(value=="delete")     //28-8-19 a
                                                {
                                              print("AssignmentTecaherid: " + GlobalData.assignmentteacehrid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.assignmentteacehrid==GlobalData.uid?
                                              showDialog1(context):
                                              Show_toast_Now("Access Denied", Colors.red);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Classes : "+Assignment.classes,style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text("Created On:"+Assignment.created_date,style:
                            TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text(isActive?"Published on : $publishedDate":"Scheduled : $publishedDate",style:
                            TextStyle(color: isActive?Colors.green:Colors.red,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text("Closing On:"+Assignment.closing_date,style:
                            TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,)
                          ],
                        ),
                      ),),
                    ),
                   /* incomplete assignments*/
                   incomplete?
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(color: Colors.red,child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Incomplete",style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),),
                    ):Text(""),

                    /*Icon(Icons.remove_red_eye,color: isActive?Colors.green:Colors.red,)*/

                  ],
                ),
              ),






            ],
          ),

        ),
      );
  }
}



// 6-9-19

class StudentAssignmentReport extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String closingdate;
  final Pojo_getassignment assignment;
  //final String levels;
  //final String duration;


  StudentAssignmentReport(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
        this.closingdate,
        this.assignment,
        //this.duration,
        //this.levels
      });

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),


                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                    Expanded(
                      child: Card(color: is_taken?Colors.green:Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(assignment.label,style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15,color: GlobalData.white),textAlign: TextAlign.center,),
                      ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Card(color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Closing Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                          color: GlobalData.white),textAlign: TextAlign.center,),
                    ),
                  ),
                  Text(closingdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,
                      color: GlobalData.gray),textAlign: TextAlign.center,),

                ],),
              )


              /*GestureDetector(
                onTap: (){

                  GlobalData.AssignmentID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("AID"+(id==null?" Null Value":id));

                    GlobalData.ExamQuiz=title;

                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AssignmentAnswerLog':'assignmentexam');


                  }else
                  {

                    Navigator.of(context).pushNamed('StudentListByAssignment');
                  }



                },
                child: GlobalData.userType=="student"?Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: (is_taken==true)?Colors.blue:Colors.green),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(is_taken==true?"Assignment Report":"Give Exam",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                ):
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Assignment Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/





            ],
          ),

        ),
      );
  }
}



//13-9-19

class AssignmentExerciseLog extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  //final String levels;
  //final String duration;
  final String progresslabel;

  AssignmentExerciseLog(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
        this.progresslabel
       // this.duration,
        //this.levels
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        getscore(grade:progresslabel),
                      ],
                    ),

                  ],
                ),
              ),

              /*GestureDetector(
                onTap: (){




                  GlobalData.AssignmentID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("AID"+(id==null?" Null Value":id));



                    GlobalData.ExamQuiz=title;
                    //GlobalData.DurationofEachLevel=duration??"20";
                   // GlobalData.QuizLevels=levels??"1";
                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AssignmentAnswerLog':'assignmentexam');


                  }else
                  {

                    Navigator.of(context).pushNamed('StudentListByAssignment');
                  }

                },
                child:
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Assignment Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/




            ],
          ),

        ),
      );
  }
}




void CustomShowDialog(context,{String title,String msg,String buttonText,VoidCallback onPressed, VoidCallback onpressed1}) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(title),
        content: new Text(msg),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(buttonText??"Not Yet",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
            onPressed: () {
              onpressed1==null?
              Navigator.of(context).pop():
              onpressed1();
            },
          ),

          FlatButton(
            child: new Text(buttonText??"Ok",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
            onPressed: () {
              onPressed==null?
              Navigator.of(context).pop():
              onPressed();
            },
          ),


        ],
      );
    },
  );
}


/*30-9-19 dummy text*/
class dummytext extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;


  dummytext({
    this.heading,
    this.paragraph,
    this.color,
    this.title,
    this.id
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                   Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                  ],
                ),
              ),
            ],
          ),

        ),
      );
  }
}

Getclassquiz() async {
  print("Classid ${GlobalData.classid}");
  print("classname ${GlobalData.class_name}");
  if(GlobalData.quizclass!=null){GlobalData.quizclass.clear();}
  await http.post(GlobalData.applink+"get_quizzes_by_class.php",
      body: {"Class_id": GlobalData.classid,
      "publish_onhold_both":"as"}).then((res) {
    print(res.body);
    var ParsedJson = jsonDecode(res.body);
    if (ParsedJson['quizdata'] != false) {

      GlobalData.quizclass = (ParsedJson['quizdata'] as List)
          .map((data) => Pojo_quizzclass.fromJson(data))
          .toList();
    }
  });

}



GetclassSpellinng()async{
  print("Classid ${GlobalData.classid}");
  print("classname ${GlobalData.class_name}");
  if(GlobalData.spellingclass!=null){GlobalData.spellingclass.clear();}
  await http.post(GlobalData.applink+"get_spelling_by_class.php",
      body: {"Class_id": GlobalData.classid,
        "publish_onhold_both":"as"}).then((res) {
    print(res.body);
    var ParsedJson = jsonDecode(res.body);
    if (ParsedJson['spellingdata'] != false) {
      GlobalData.spellingclass = (ParsedJson['spellingdata'] as List)
          .map((data) => Pojo_spellingclass.fromJson(data))
          .toList();
    }
  });

}


GetclassAssignment()async{
  print("Classid ${GlobalData.classid}");
  print("classname ${GlobalData.class_name}");
  if(GlobalData.assignmentclass!=null){GlobalData.assignmentclass.clear();}
  await http.post(GlobalData.applink+"get_assignments_by_class.php",
      body: {"Class_id": GlobalData.classid,
        "publish_onhold_both":"as"}).then((res) {
    print(res.body);
    var ParsedJson = jsonDecode(res.body);
    if (ParsedJson['assignmentdata'] != false) {
      GlobalData.assignmentclass = (ParsedJson['assignmentdata'] as List)
          .map((data) => Pojo_assignmentclass.fromJson(data))
          .toList();
    }
  });

}


class PreviewSpellingss extends StatelessWidget {

  final bool isActive;
  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  // final bool is_taken;
  final String levels;
  final String duration;
  final bool incomplete;
  final int  continueTo;
  final String publishedDate;
  final String classes;

  final Pojo_spelling Spelling;


  PreviewSpellingss(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        //  this.is_taken,
        this.duration,
        this.levels,
        this.isActive,this.incomplete,this.continueTo,this.publishedDate,this.classes,this.Spelling});


  // 28-8-19 a
  Delete(String id) async{

    await http.post(GlobalData.applink+"delete_spelling.php",
        body: {
          "spelling_id":GlobalData.spellingid,
        }).then((res){
      print(res.body);
      print(GlobalData.spellingid);
    });
  }

  //29-8-19 a
  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are You Sure Want To Delete selected Spelling?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('previewspelling');
                        },child: new Text("Cancel")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Delete(id);
                        Show_toast("Delete Successfully", Colors.green);
                        Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
//29-8-19 a


  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):
                                        isActive?
                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value:'delete'),

                                          ],
                                          onSelected: (value){

                                            if(value=="delete")     //28-8-19 a
                                                {
                                                  //print("Cz");
                                                  print("SPssellTecaherid: " + GlobalData.spellteacherid);
                                                  print("uid: " + GlobalData.uid);
                                                  GlobalData.spellteacherid==GlobalData.uid?
                                              showDialog1(context):
                                                  Show_toast_Now("Access Denied", Colors.red);
                                            }
                                          },
                                        )
                                            :

                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {

                                              GlobalData.EditQuiz=true;
                                              GlobalData.spellingid=id;
                                              GlobalData.ExamQuiz=title;
                                              GlobalData.spellLevels=levels;
                                              GlobalData.spelltitle=title;
                                              GlobalData.spellDurationofEachLevel=duration;
                                              print("SPssellTecaherid: " + GlobalData.spellteacherid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.spellteacherid==GlobalData.uid?
                                              Navigator.of(context).pushNamed('spellinglevelsList'):
                                              Show_toast_Now("Access Denied", Colors.red);
                                            }
                                            if(value=="delete")     //28-8-19 a
                                                {

                                              print("SPssellTecaherid: " + GlobalData.spellteacherid);
                                              print("uid: " + GlobalData.uid);
                                              GlobalData.spellteacherid==GlobalData.uid?
                                              showDialog1(context):
                                              Show_toast_Now("Access Denied", Colors.red);
                                              //showDialog1(context);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Classes : "+Spelling.classes,style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text("Created On:"+Spelling.created_date,style:
                            TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text(isActive?"Published on : $publishedDate":"Scheduled : $publishedDate",style:
                            TextStyle(color: isActive?Colors.green:Colors.red,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text("Closing On:"+Spelling.closing_date,style:
                            TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,)
                          ],
                        ),
                      ),),
                    ),
                    incomplete?
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(color: Colors.red,child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Incomplete",style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),),
                    ):Text(""),

                    /*Icon(Icons.remove_red_eye,color: isActive?Colors.green:Colors.red,)*/

                  ],
                ),
              ),

              /*GestureDetector(
                onTap: (){




                  GlobalData.QuizID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("QID"+(id==null?" Null Value":id));
//print("Title : "+title);
//                    print("levels : "+levels);
//print("Duration : "+duration);



                    GlobalData.ExamQuiz=title;
                    GlobalData.DurationofEachLevel=duration??"20";
                    GlobalData.QuizLevels=levels??"1";
                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AnswerLog':'exam');


                  }else
                  {

                    Navigator.of(context).pushNamed('StudentListByQuiz');
                  }

                },
                child: GlobalData.userType=="student"?Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: (is_taken==true)?Colors.blue:Colors.green),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(is_taken==true?"Quiz Report":"Give Exam",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                ):
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Quiz Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/





            ],
          ),

        ),
      );
  }
}

/* Spelling Report */

class StudentSpellingReport extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String levels;
  final String duration;
  final String closingdate;
  final Pojo_spelling spelling;


  StudentSpellingReport(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
        this.duration,
        this.levels,
        this.closingdate,
        this.spelling});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {
                                              GlobalData.EditQuiz=true;
                                              GlobalData.QuizID=id;
                                              GlobalData.ExamQuiz=title;
                                              Navigator.of(context).pushNamed('Question_List');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                    Expanded(
                      child: Card(color: is_taken?Colors.green:Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Text(spelling.label,style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: GlobalData.white),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),

                  ],
                ),
              ),



              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,bottom: 15),
                  child: Row(
                    children: <Widget>[
                      Text(title,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Card(color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Closing Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                          color: GlobalData.white),textAlign: TextAlign.center,),
                    ),
                  ),
                  Text(closingdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,
                      color: GlobalData.gray),textAlign: TextAlign.center,),

                ],),
              )

              /* GestureDetector(
                onTap: (){




                  GlobalData.QuizID=id;

                  if(GlobalData.userType=="student") {
                    print("UID"+GlobalData.uid);
                    print("QID"+(id==null?" Null Value":id));
//print("Title : "+title);
//                    print("levels : "+levels);
//print("Duration : "+duration);



                    GlobalData.ExamQuiz=title;
                    GlobalData.DurationofEachLevel=duration;
                    GlobalData.QuizLevels=levels??"1";
                    GlobalData.CurrentStudentID=GlobalData.uid;


                    Navigator.of(context).pushNamed(is_taken==true?'AnswerLog':'studentLevelList');


                  }else
                    {

                      Navigator.of(context).pushNamed('StudentListByQuiz');
                    }

                },
                child: GlobalData.userType=="student"?Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: (is_taken==true)?Colors.blue:Colors.green),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(is_taken==true?"Quiz Report":"Give Exam",textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                    ),

                                ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                ):
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),
                          color: Colors.blue),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Quiz Report",textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),

                                    ]),
                              ),

                            ],

                          ),
                        ),

                      ),
                    ),
                  ],
                )
                ,
              ),*/





            ],
          ),

        ),
      );
  }
}

class GlobalSpellingActivity extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;

  final String levels;
  final String duration;
  final String closingdate;
  final Pojo_spelling spelling;


  GlobalSpellingActivity(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,

        this.duration,
        this.levels,
        this.closingdate,
        this.spelling});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GlobalData.userType=="student"?Text(""):PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'edit'),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: 'delete'),

                                          ],
                                          onSelected: ( value){
                                            if(value=="edit")
                                            {
                                              GlobalData.EditQuiz=true;
                                              GlobalData.spellingid=id;
                                              GlobalData.ExamQuiz=title;
                                              Navigator.of(context).pushNamed('spellingquestionlist');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                    /*   Expanded(
                      child: Card(color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(quiz.label,style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: GlobalData.white),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),*/


                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 25,top: 5,right: 30,bottom: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(levels +" Levels",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),

                    SizedBox(width: 50,),
                    Expanded(
                      child: Text(duration +" Minutes",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                    ),


                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Card(color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Closing Date : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                          color: Colors.white),textAlign: TextAlign.center,),
                    ),
                  ),
                  Text(closingdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,
                      color: GlobalData.gray),textAlign: TextAlign.center,),

                ],),
              ),









            ],
          ),

        ),
      );
  }
}

class SpellingResult extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;
  final String levels;
  final String duration;
  final String percent;
  final String progresslabel;
  final String timetaken;

  SpellingResult(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
        this.duration,
        this.levels,
        this.percent,
        this.progresslabel,
        this.timetaken
      });

  @override
  Widget build(BuildContext context) {







    String TimerText ="-:--:--";

    String RoundTime(String time){

      if(time.length==1)
      {
        time ="0"+time;
      }

      return time;

    }






    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 3),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right:4),
                                      child: PopupMenuButton(
                                        child: GestureDetector(
                                            onTap: (){
                                              Share.share("My Quizable Spelling Bee Result \n \n"+ GlobalData.Username + " completed Spelling Bee: " + heading + "\n \n"+"My result is: " + percent +" %"
                                                  +"\n"  + progresslabel);



                                            },child: Icon(Icons.share,color: Colors.white,)),
                                        itemBuilder: (_) => <PopupMenuItem<String>>[
                                          /*new PopupMenuItem<String>(
                                            child: GestureDetector(onTap: (){
                                              Navigator.of(context).pushNamed('levelsList');
                                            },
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: Icon(
                                                      Icons.remove_red_eye,
                                                      color: GlobalData.pinkred,size: 14,
                                                    ),
                                                  ),
                                                  new Text('View',style: TextStyle(fontSize: 15),),
                                                ],
                                              ),
                                            ),),*/

                                          /* PopupMenuItem<String>(
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 4),
                                                child: GestureDetector(onTap: (){
                                                  Share.share("Title Of Quiz Is: " + heading + "\n" "Student Name: " + GlobalData.Username+" \n"+"Grade Of Student is: " + percent +" "
                                                      +"\n" + "Result: " + progresslabel);

  },
                                                  child: Icon(
                                                    Icons.share,
                                                    color: GlobalData.pinkred,size: 14,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(onTap: (){
    Share.share("My EduSupport Quiz Result \n \n"+ GlobalData.Username + " completed Quiz: " + heading + "\n \n"+"My result is: " + percent +" %"
    +"\n"  + progresslabel);

    }
                                              ,
                                                  child: new Text('Share',style: TextStyle(fontSize: 15),)),
                                            ],
                                          ),),*/
                                        ],

                                      )
                                  ),],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 10,right: 30,bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                              getscore(grade:progresslabel)],
                          ),
                        ),
                        Spacer(),

                        getscoreborder(per: double.parse(percent),),

                      ],
                    ),Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Time : " + timetaken,style: TextStyle(fontSize: 14,color: Colors.black),)),
                          Expanded(child: Text("Exam Date : " + title,style: TextStyle(fontSize: 14,color: Colors.black),)),

                        ],
                      ),
                    )

                  ],
                ),
              ),






            ],
          ),

        ),
      );
  }
}

class StudentAssignmentActivityReport extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;



  StudentAssignmentActivityReport(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,
       });

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),


                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Instructions: " + paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Publish Date: " + title,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.left  ,),
                    ),
                  ],
                ),
              ),








            ],
          ),

        ),
      );
  }
}



class AssignmentResult extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;
  final String title;
  final String id;
  final bool is_taken;

  final String percent;
  final String progresslabel;
  final String timetaken;

  AssignmentResult(
      {
        this.heading,
        this.paragraph,
        this.color,
        this.title,
        this.id,
        this.is_taken,

        this.percent,
        this.progresslabel,
        this.timetaken
      });

  @override
  Widget build(BuildContext context) {







    String TimerText ="-:--:--";

    String RoundTime(String time){

      if(time.length==1)
      {
        time ="0"+time;
      }

      return time;

    }






    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 3),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right:4),
                                      child: PopupMenuButton(
                                        child: GestureDetector(
                                            onTap: (){
                                              Share.share("My Quizable Assignment Result \n \n"+ GlobalData.Username + " completed Assignment: " + heading + "\n \n"+"My result is: " + percent +" %"
                                                  +"\n"  + progresslabel);



                                            },child: Icon(Icons.share,color: Colors.white,)),
                                        itemBuilder: (_) => <PopupMenuItem<String>>[

                                        ],

                                      )
                                  ),],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 10,right: 30,bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                              Row(
                                children: <Widget>[
                                  getscore(grade:progresslabel),
                                ],
                              )],
                          ),
                        ),
                       // Spacer(),

                        Expanded(child: getscoreborder(per: double.parse(percent),)),

                      ],
                    ),Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Time : " + timetaken,style: TextStyle(fontSize: 14,color: Colors.black),)),
                          Expanded(child: Text("Exam Date : " + title,style: TextStyle(fontSize: 14,color: Colors.black),)),

                        ],
                      ),
                    )

                  ],
                ),
              ),






            ],
          ),

        ),
      );
  }
}



class ClassesPerAccount extends StatelessWidget {

  final ScrollController scroncontroller = ScrollController();


  // ClassesPerAccount call krke dekh kisi page pr shi chalta hai ?

  @override
  Widget build(BuildContext context) {

    List<String> UserIds = new List();

    SharedPreferences preferences;


    for(int i=0;i<GlobalData.Class_list.length;i++){
      if(!UserIds.contains(GlobalData.Class_list[i].accountname)){
        UserIds.add(GlobalData.Class_list[i].accountname);
        print("Already tehre ");
      }else{
        print("Already tehre ");}
    }

    print("Class Admins : ${UserIds}");

    print(GlobalData.adminmembership);

    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: UserIds.length
      ,itemBuilder: (context,index){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Card(elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                  child: Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(GlobalData
                                .Class_list[index].accountname==null||GlobalData
                                .Class_list[index].accountname=="null"?"No Account Name":"${UserIds[index]}",style: TextStyle(fontSize: 20,
                                fontWeight:  FontWeight.bold,color: GlobalData.gray),),
                          ],)
                      ],),
                  ),
                ),
              ),
              Scrollbar(
                isAlwaysShown: true,
                controller: scroncontroller,
                child: ListView.builder(
                  controller: scroncontroller,
                    shrinkWrap: true,
                itemCount: GlobalData.Class_list.length
                ,
                itemBuilder: (c,i){
                  return GestureDetector(
                    onTap: ()async{


                      preferences = await SharedPreferences.getInstance();

                      preferences.setString("selectedClass", GlobalData.Class_list[index].id);

                      GlobalData.classid = GlobalData.Class_list[i].id;

                      GlobalData.createdclassdate = GlobalData.Class_list[i].createddate;

                      GlobalData.student_code = GlobalData.Class_list[i].studentinvitecode;

                      GlobalData.teacher_code = GlobalData.Class_list[i].teacherinvitecode;

                      GlobalData.class_name = GlobalData.Class_list[i].classname;

                      GlobalData.activeclass = GlobalData.Class_list[i];

                      GlobalData.class_name = GlobalData.Class_list[i].classname;

                     // GlobalData.adminmembership=GlobalData.Class_list[i].isactive;

                      GlobalData.adminmembership.toString();

                      // GlobalData.adminmembership=GlobalData.Class_list[index].membershipData==null?"false":
                      //GlobalData.Class_list[index].membershipData.isActive.toString();

                      GlobalData.adminaccounttype=GlobalData.Class_list[i].accout_type;

                      GlobalData.classadminid = GlobalData.Class_list[i].userid;
                      print(GlobalData.uid);

                      GlobalData.adminaccountname = GlobalData.Class_list[i].accountname;
                      GlobalData.accountname=GlobalData.Class_list[i].accountname;

                      print(GlobalData.classadminid);
                      print(GlobalData.adminaccountname);
                      print(GlobalData.accountname);
                      print(GlobalData.Class_list[i].accout_type);
                      print(GlobalData.adminaccounttype);
                      print(GlobalData.Class_list[i].classname);
                      print(GlobalData.activeclass.classname);
                      print(GlobalData.userType);
                      //print(GlobalData.classmemberships.isActive);

                      print(GlobalData.adminmembership);
                      print("asdadadadaddada");


                      Navigator.of(context)
                          .pushReplacementNamed('teacherdashboard');
                    },
                    child: Container(
                      child: Row(children: <Widget>[

                        GlobalData.Class_list[i].accountname==UserIds[index]?
                        Stack(
                          children: <Widget>[


                            Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                              child: ClipOval(
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/classicon.png',
                                  image: GlobalData.Class_list[i].classicon,fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ):SizedBox(),


                        GlobalData.Class_list[i].accountname==UserIds[index]?
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(GlobalData.Class_list[i].classname,
                                ),
                              ],
                            ),
                          ),
                        ):SizedBox(),

                      ],),
                    ),
                  );
                }
                ),
              ),Divider( color: Colors.black,)
            ],
          );
      }),
    );
  }
}


