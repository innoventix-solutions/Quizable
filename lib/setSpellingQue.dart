import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class setspellingquestion extends StatefulWidget {
  @override
  _setspellingquestionState createState() => _setspellingquestionState();
}

class _setspellingquestionState extends State<setspellingquestion> {
  DateTime date1;
  DateTime date2;

  String selectedvalue = "Select Quiz Subject";
  String selectedvalue2 = "Select Class";
  TextEditingController teacher =
      new TextEditingController(text: GlobalData.Username);
  TextEditingController spelltitle =
      new TextEditingController(text: GlobalData.spelltitle);
  TextEditingController spelllevel =
      new TextEditingController(text: GlobalData.spellLevels);
  TextEditingController queslevel =
      new TextEditingController(text: GlobalData.spellNosofQuesPerLevel);
  TextEditingController durlevel =
      new TextEditingController(text: GlobalData.spellDurationofEachLevel);
  TextEditingController teaguide =
      new TextEditingController(text: GlobalData.teacherguide);
  TextEditingController spellsubject = new TextEditingController();
  TextEditingController spellclass = new TextEditingController();
  //TextEditingController publishdate= new TextEditingController();
  //TextEditingController closingdate= new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  setalldetails() {
    GlobalData.spelltitle = spelltitle.text;
    GlobalData.spellLevels = spelllevel.text;
    GlobalData.spellNosofQuesPerLevel = queslevel.text;
    GlobalData.spellDurationofEachLevel = durlevel.text;
    GlobalData.teacherguide = teaguide.text;
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

  void savingquestion(BuildContext context)  {

    bool Selected = false;

    showDialog(barrierDismissible: false,
        context: context,
        builder: (_) => new Dialog(
          child: new Container(
            alignment: FractionalOffset.center,
            height: 80.0,
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                  child: new Text("Saving..."),
                ),
              ],
            ),
          ),
        ));
  }


  Createspelling() async {
    http.post("http://edusupportapp.com/api/create_spelling.php", body: {
      "spelling_title": spelltitle.text.toString(),
      "no_of_levels": spelllevel.text.toString(),
      "que_each_level": queslevel.text.toString(),
      "dur_each_level": durlevel.text.toString(),
      "spelling_subject": spellsubject.text.toString(),
      "class_id": spellclass.text.toString(),
      "techer_id": teacher.text.toString(),
      "teacher_instruction": teaguide.text.toString(),

      //"publish_date":publishdate.text.toString(),
      //"closing_date":closingdate.text.toString(),
    }).then((response) {
      var status = jsonDecode(response.body);

      print("result from Server : " + status['status'].toString());

      if (status['status'].toString() == "1") {
        Show_toast("Registered Successfully", Colors.green);
        Navigator.of(context).pushNamed('login');
      } else {
        Show_toast(status['msg'], Colors.red);
      }
    });
  }

  /*final formats = {
    InputType.both: DateFormat("yyyy-MM-dd h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };*/

  final formatdate = DateFormat("yyyy-MM-dd");
  final formattime = DateFormat("HH:mm");
  final formatdatetime = DateFormat("yyyy-MM-dd h:mma");



  //InputType inputType = InputType.both;
  bool editable = true;
  DateTime Starting_date;
  DateTime Closing_date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Set Spelling Challenge",
            style: TextStyle(fontSize: 20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [GlobalData.darkblue, GlobalData.darkpurple],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('previewspelling');
            },
            icon: Icon(
              Icons.line_weight,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
      // drawer:
      //drawerquiz(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Teachers Name',
                          style: TextStyle(
                            color: GlobalData.lightblue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomTextField(
                        controller: teacher,
                        enabled: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Subject of Spelling Challenge',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: spelltitle,
                      ),
                      Center(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Nos. of Spelling\nBee Levels.',
                                                  style: TextStyle(
                                                    color: GlobalData.lightblue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              CustomTextField(
                                                Inputnumber: true,
                                                controller: spelllevel,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        child: Container(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    'Nos. of Questions In each Level.',
                                                    style: TextStyle(
                                                      color:
                                                          GlobalData.lightblue,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                CustomTextField(
                                                  Inputnumber: true,
                                                  controller: queslevel,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Duration of each Level.',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(
                        Inputnumber: true,
                        controller: durlevel,
                        Texth: "10 Minutes",
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Teacher's Guide & Instructions.",
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(
                        Inputnumber: false,
                        controller: teaguide,
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Spelling Subject Category.',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 400,
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15, left: 20, bottom: 15),
                              child: GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        GlobalData.Selected_subject == null
                                            ? 'Click Select Spelling Subject'
                                            : GlobalData.Selected_subject,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  setalldetails();

                                  Navigator.of(context)
                                      .pushNamed('spellingsubject');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Class(es) you want to see task.',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 400,
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15, left: 20, bottom: 15),
                              child: GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        GlobalData.Selected_class != null
                                            ? GlobalData.Selected_class
                                            : 'Click to Select Class',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('spellingclass');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      /* Select starting date and time */

                      /* Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Date and Time',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),




                      Container(
                        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DateTimePickerFormField(
                              inputType:  inputType,
                              format: formats[inputType],
                              editable: false,
                              decoration: InputDecoration(
                                  labelText: 'Date/Time', hasFloatingPlaceholder: false,border:InputBorder.none),
                              onChanged: (dt) => setState(() => Starting_date = dt),
                            ),
                          ),
                        ),
                      ),



                      /* Select ending date*/


                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Closing Date',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),

                      Container(
                        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DateTimePickerFormField(
                              inputType:  inputType,
                              format: formats[inputType],
                              editable: false,
                              decoration: InputDecoration(
                                  labelText: 'Date/Time', hasFloatingPlaceholder: false,border:InputBorder.none),
                              onChanged: (dt) => setState(() => Closing_date = dt),
                            ),
                          ),
                        ),
                      ),*/

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 40),
                            child: SizedBox(
                              width: 100,
                              child: GradientButtonText(ButtonClick: (){
                                Navigator.of(context).pushReplacementNamed('dashboard');

                              },
                                linearGradient: LinearGradient(colors: <Color>[
                                  GlobalData.navy,
                                  GlobalData.navyblue
                                ]),
                                text: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 25, bottom: 40),
                            child: SizedBox(
                              width: 100,
                              child: GradientButtonText(
                                linearGradient: LinearGradient(colors: <Color>[
                                  GlobalData.purple,
                                  GlobalData.pink
                                ]),
                                text: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                ButtonClick: () {
                                  setalldetails();
                                  print("Levels "+GlobalData.spellLevels);
                                  print("Questions per Level"+GlobalData.spellNosofQuesPerLevel??"Not allocated");
                                  print(GlobalData.MyMembership.isActive);

                                  print(GlobalData.adminmembership.toString());

                                  if(GlobalData.MyMembership.isActive==false)
                                  {

                                    print("yahoo");

                                    print(GlobalData.classid);
                                    print(GlobalData.adminmembership.toString());

                                    if (GlobalData.adminmembership == "" ||
                                        GlobalData.adminmembership == null ||
                                        GlobalData.adminmembership == false.toString()||
                                        GlobalData.adminmembership=="null")
                                    {

                                      print("Level 1");

                                      if (int.parse(GlobalData.spellLevels) > 1 || int.parse(GlobalData.spellNosofQuesPerLevel) > 10)
                                      {
                                        GlobalData.classadminid==GlobalData.uid?

                                        GlobalData.userType=="admin_teacher"?
                                        CustomShowDialog(context,title: "Subscription Required",msg:
                                        "Please reduce the number of Spelling Level to 1 and upto 10 Questions\nfor a trial.\nOtherwise, subscribe to set unlimited questions in multiple levels\n\nSubscribe now?",onPressed:(){
                                          Navigator.of(context).pushNamed('ManageAccount');
                                        },
                                            onpressed1: (){
                                              Navigator.of(context).pop();
                                            }):
                                        CustomShowDialog(context,title: "Subscription Required",msg:
                                        "You cannot set more than 10 questions each level. \n\nPlease contact your Admin to Subscribe for the institution's account.",onPressed:(){
                                          Navigator.of(context).pop();

                                        }):
                                        CustomShowDialog(context,title: "Subscription Required",msg:
                                        "You cannot set more than 10 questions each level. \n\nPlease contact your Admin to Subscribe for the institution's account.",onPressed:(){
                                          Navigator.of(context).pop();

                                        });
                                      } else {

                                        if (GlobalData.spelltitle == null ||
                                            GlobalData.spellLevels == null ||
                                            GlobalData.spellNosofQuesPerLevel == null ||
                                            GlobalData.spellDurationofEachLevel == "" ||
                                            GlobalData.Selected_subject == null ||
                                            GlobalData.Selected_class == null ||
                                            GlobalData.teacherguide == ""
                                        //Starting_date==null||
                                        //Closing_date==null
                                        ) {
                                          _showDialog();
                                        }
                                        else{
                                          savingquestion(context);
                                          SaveSpelling();
                                        }

                                      }
                                    } else {
                                      if (GlobalData.spelltitle == null ||
                                          GlobalData.spellLevels == null ||
                                          GlobalData.spellNosofQuesPerLevel == null ||
                                          GlobalData.spellDurationofEachLevel == "" ||
                                          GlobalData.Selected_subject == null ||
                                          GlobalData.Selected_class == null ||
                                          GlobalData.teacherguide == ""
                                      //Starting_date==null||
                                      //Closing_date==null
                                      ) {
                                        _showDialog();
                                      }
                                      else{
                                        savingquestion(context);
                                        SaveSpelling();
                                      }
                                    }
                                  }else{
                                    if (GlobalData.spelltitle == null ||
                                        GlobalData.spellLevels == null ||
                                        GlobalData.spellNosofQuesPerLevel == null ||
                                        GlobalData.spellDurationofEachLevel == "" ||
                                        GlobalData.Selected_subject == null ||
                                        GlobalData.Selected_class == null ||
                                        GlobalData.teacherguide == ""
                                    //Starting_date==null||
                                    //Closing_date==null
                                    ) {
                                      _showDialog();
                                    }
                                    else{
                                      savingquestion(context);
                                      SaveSpelling();
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      /*Padding(
                        padding: const EdgeInsets.only(bottom: 25, right: 5),
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Set Questions ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: GlobalData.lightblue),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: GlobalData.lightblue,
                                size: 18,
                              )
                            ],
                          ),
                          onTap: () {setalldetails();SaveSpelling();
//                          Navigator.of(context)
//                              .pushNamed(
//                              'questions');
                          },
                        ),
                      ),*/
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Some Values Missing"),
          content: new Text("Please Fill All the Values"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Colors.black),
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

  SaveSpelling() async {
    print("spelling_title : " +
            GlobalData.spelltitle +
            "\ntecher_id : " +
            GlobalData.uid +
            "\nno_of_levels : " +
            GlobalData.spellLevels +
            "\nque_each_level :" +
            GlobalData.spellNosofQuesPerLevel +
            "\ndur_each_level :" +
            GlobalData.spellDurationofEachLevel +
            "\nspelling_subject: " +
            GlobalData.Selected_subject.toString() +
            "\nclass_id : "
        // "\npublish_date : 2019-06-23 00:00:01"+
        // "\nclosing_date : 2019-06-26 00:00:01"

        );

    if (GlobalData.spelltitle == null ||
            GlobalData.spellLevels == null ||
            GlobalData.spellNosofQuesPerLevel == null ||
            GlobalData.spellDurationofEachLevel == "" ||
            GlobalData.Selected_subject == null ||
            GlobalData.Selected_class == null ||
            GlobalData.teacherguide == ""
        //Starting_date==null||
        //Closing_date==null
        ) {
      _showDialog();
    } else {
      http.post("http://edusupportapp.com/api/create_spelling.php", body: {
        "spelling_title": GlobalData.spelltitle,
        "techer_id": GlobalData.uid,
        "no_of_levels": GlobalData.spellLevels,
        "que_each_level": GlobalData.spellNosofQuesPerLevel,
        "dur_each_level": GlobalData.spellDurationofEachLevel,
        "spelling_subject": GlobalData.Selected_subject,
        "class_id": GlobalData.Selected_class_IDS,
        "teacher_instruction": GlobalData.teacherguide,
        //"publish_date":Starting_date.toString(),
        //"closing_date":Closing_date.toString(),
      }).then((response) {
        print(response.body.toString());
        var statuss = jsonDecode(response.body);

        if (statuss['status'] == 1) {
          GlobalData.spellingid = statuss['spellingdata']['ID'];
          print(GlobalData.spellingid);
          print("gonadsf to qwesdf");
          //  ClearRegisterData();
          Navigator.of(context).pushNamed('spellque');
        } else {}
//        Navigator.of(context)
//            .pushNamed(
//            'questions');
      });
    }
  }
}
