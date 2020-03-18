import 'dart:convert';
import 'Pojo/pojo_quizzes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class setquizquestion extends StatefulWidget {
  @override
  _setquizquestionState createState() => _setquizquestionState();
}

class _setquizquestionState extends State<setquizquestion> {
  List<Pojo_quizzes> Quizz_List = new List();


  DateTime date1;
  DateTime date2;

  String selectedvalue = "Select Quiz Subject";
  String selectedvalue2 = "Select Class";
  TextEditingController teacher = new TextEditingController(text:GlobalData.Username );
  TextEditingController quiztitle = new TextEditingController(text:GlobalData.QuizTitle );
  TextEditingController quizlevel = new TextEditingController(text: GlobalData.QuizLevels);
  TextEditingController queslevel = new TextEditingController(text: GlobalData.NosofQuesPerLevel);
  TextEditingController durlevel = new TextEditingController(text: GlobalData.DurationofEachLevel);
  TextEditingController quizsubject = new TextEditingController();
  TextEditingController quizclass = new TextEditingController();
 // TextEditingController age = new TextEditingController(text: 10.toString());
  //TextEditingController publishdate= new TextEditingController();
  //TextEditingController closingdate= new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }





setalldetails(){
  GlobalData.QuizTitle  = quiztitle.text;
  GlobalData.QuizLevels = quizlevel.text;
  GlobalData.NosofQuesPerLevel = queslevel.text;
  GlobalData.DurationofEachLevel =  durlevel.text;
  //GlobalData.age = 10.toString();
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

  Createquiz() async {
    http.post("http://edusupportapp.com/api/create_quiz.php", body: {
      "quiz_title":  quiztitle.text.toString(),
      "no_of_levels": quizlevel.text.toString(),
      "que_each_level": queslevel.text.toString(),
      "dur_each_level": durlevel.text.toString(),
      "quiz_subject": quizsubject.text.toString(),
      "class_id": quizclass.text.toString(),
      "techer_id": teacher.text.toString(),
      //"publish_date":publishdate.text.toString(),
      //"closing_date":closingdate.text.toString(),
      //"age":10.toString(),
     // "startage":endwithlower.toString(),
     // "endage":endwithupper.toString(),

    }).then((response) {
      var status = jsonDecode(response.body);


      print("result from Server : "+status['status'].toString());

      if (status['status'].toString() == "1") {
        Show_toast("Registered Successfully", Colors.green);
        Navigator.of(context)
            .pushNamed('login');
      } else {
        Show_toast(status['msg'], Colors.red);
      }
    });
  }





  final formats = {
    InputType.both: DateFormat("yyyy-MM-dd h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime Starting_date;
  DateTime Closing_date;



  double _lowerValue = 20;
  double _upperValue = 80;
  double _lowerValueFormatter = 10.0;
  double _upperValueFormatter = 10.0;

  var endwithlower;
  var endwithupper;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Set Quiz Questions",
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
              Navigator.of(context)
                  .pushNamed(
                  'previewQuiz');
            },
            icon: Icon(
              Icons.line_weight,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),


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
                      CustomTextField(controller:teacher,enabled: false,),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Title of Quiz',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(controller: quiztitle,),


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
                                                  'Nos. of Quiz\nLevels.',
                                                  style: TextStyle(
                                                    color: GlobalData.lightblue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              CustomTextField(Inputnumber: true,controller: quizlevel,),
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
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text(
                                                    'Nos. of Questions In each Level.',
                                                    style: TextStyle(
                                                      color: GlobalData.lightblue,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                CustomTextField(Inputnumber: true,controller: queslevel,),
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
                      CustomTextField(Inputnumber: true,controller: durlevel,Texth: "Specify time in minutes",hintStyle: TextStyle(fontSize: 20),),


                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Select Quiz Subject Category.',
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
                        child: Container(width: 400,
                          child: Card(
                            elevation: 5.0, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child:  Container(
                              padding: EdgeInsets.only(top: 15,left: 20,bottom: 15),
                              child:  GestureDetector(
                                child: Row(
                                  children: <Widget>[

                                    Expanded(
                                      child: Text(GlobalData.Selected_subject==null?'Click Select Quiz Subject':GlobalData.Selected_subject,style: TextStyle(
                                          fontSize: 15,fontWeight: FontWeight.bold
                                      ),),
                                    ),

                                  ],
                                ),onTap: (){

                                  setalldetails();

                                Navigator.of(context)
                                    .pushNamed(
                                    'selectsubject');
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
                        child: Container(width: 400,
                          child: Card(
                            elevation: 5.0, shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child:  Container(
                              padding: EdgeInsets.only(top: 15,left: 20,bottom: 15),
                              child:  GestureDetector(
                                child: Row(
                                  children: <Widget>[

                                    Expanded(
                                      child: Text(
                                        GlobalData.Selected_class!=null?GlobalData.Selected_class:'Click to Select Class',style: TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.bold
                                      ),),
                                    ),



                                  ],
                                ),onTap: (){
                                Navigator.of(context)
                                    .pushNamed(
                                    'selectclass');
                              },
                              ),
                            ),
                          ),
                        ),
                      ),


                     /* Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Target Quiz Participants.(Age Range)',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),*/
                     /* CustomTextField(Inputnumber: true,controller: age,Texth: "Age Category/Range | Year",hintStyle: TextStyle(fontSize: 16),),
*/
      //age range starts



      /*Padding(
  padding: const EdgeInsets.only(top: 10),
  child:   frs.RangeSlider(
    min: 0,
    max: 100,
    lowerValue: _lowerValue,
    upperValue: _upperValue,
    divisions: 100,
    allowThumbOverlap: true,

    valueIndicatorMaxDecimals: 0,
    showValueIndicator: true,
    onChanged: (double newLowerValue, double newUpperValue) {
      setState(() {
        _lowerValue = newLowerValue;
        _upperValue = newUpperValue;
      });
    },

    onChangeStart:
        (double startLowerValue, double startUpperValue) {

          endwithlower = startLowerValue;
          endwithupper = startUpperValue;
      print(


          'endwithlower: $startLowerValue endwithupper $startUpperValue');
    },
    onChangeEnd: (double newLowerValue, double newUpperValue) {
      print(
          'Ended with endwithlower: $newLowerValue and endwithupper $newUpperValue');
    },

  ),
),*/

      //
      // Simple example
      //
                      // ..add(



                      /* Select starting date and time */


                      /*Padding(
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
                              firstDate: DateTime.now(),
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
                              firstDate: DateTime.now(),
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
                            child: SizedBox(width: 100,
                              child: GradientButtonText(ButtonClick: (){
                                Navigator.of(context).pushReplacementNamed('dashboard');

                              },
                                linearGradient: LinearGradient(
                                    colors: <Color>[GlobalData.navy, GlobalData.navyblue]),
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
                            child: SizedBox(width: 100,
                              child: GradientButtonText(
                                linearGradient:
                                LinearGradient(colors: <Color>[GlobalData.purple, GlobalData.pink]),
                                text: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),ButtonClick: (){

                                setalldetails();
                                print("Levels "+GlobalData.QuizLevels);
                                print("Questions per Level"+GlobalData.NosofQuesPerLevel??"Not allocated");
                                print(GlobalData.MyMembership.isActive);

                                print(GlobalData.adminmembership.toString());

                                if(GlobalData.MyMembership.isActive==false)
                                {

                                  print("yahoo");

                                  print(GlobalData.classid);
                                  print(GlobalData.adminmembership.toString());
                                  
                                  if (GlobalData.adminmembership == "" ||
                                      GlobalData.adminmembership == null ||
                                      GlobalData.adminmembership == false.toString())
                                  {

                                    print("Level 1");

                                    if (int.parse(GlobalData.QuizLevels) > 1 || int.parse(GlobalData.NosofQuesPerLevel) > 10)
                                    {
                                      GlobalData.userType=="admin_teacher"?
                                      CustomShowDialog(context,title: "Subscription Required",msg:
                                      "Please reduce the number of Quiz Level to 1 and upto 10 Questions\nfor a trial.\nOtherwise, subscribe to set unlimited questions in multiple levels\n\nSubscribe now?",onPressed:(){
                                        Navigator.of(context).pushNamed('ManageAccount');
                                      },
                                          onpressed1: (){
                                        Navigator.of(context).pop();
                                      }):
                                      CustomShowDialog(context,title: "Subscription Required",msg:
                                    "You cannot set more than 10 questions each level. \n\nPlease contact your Admin to Subscribe for the institution's account.",onPressed:(){
                                      Navigator.of(context).pop();

                                    });
                                    } else {

                                      if (GlobalData.QuizTitle == null || GlobalData.QuizLevels == null ||
                                          GlobalData.NosofQuesPerLevel == null ||
                                          GlobalData.DurationofEachLevel == null ||
                                          GlobalData.Selected_subject == null||
                                          GlobalData.Selected_class== null
                                      //|| Starting_date==null||
                                      //Closing_date==null
                                      //||GlobalData.age == null
                                      ) {

                                        _showDialog();
                                      }
                                      else{ savingquestion(context);
                                      SaveQuiz();
                                      }

                                    }
                                  } else {
                                    if (GlobalData.QuizTitle == null || GlobalData.QuizLevels == null ||
                                        GlobalData.NosofQuesPerLevel == null ||
                                        GlobalData.DurationofEachLevel == null ||
                                        GlobalData.Selected_subject == null||
                                        GlobalData.Selected_class== null
                                    //|| Starting_date==null||
                                    //Closing_date==null
                                    //||GlobalData.age == null
                                    ) {

                                      _showDialog();
                                    }
                                    else{ savingquestion(context);
                                    SaveQuiz();
                                    }
                                  }
                                }else{
                                  if (GlobalData.QuizTitle == null || GlobalData.QuizLevels == null ||
                                      GlobalData.NosofQuesPerLevel == null ||
                                      GlobalData.DurationofEachLevel == null ||
                                      GlobalData.Selected_subject == null||
                                      GlobalData.Selected_class== null
                                  //|| Starting_date==null||
                                  //Closing_date==null
                                  //||GlobalData.age == null
                                  ) {

                                    _showDialog();
                                  }
                                  else{ savingquestion(context);
                                  SaveQuiz();
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
                          onTap: () {setalldetails();SaveQuiz();
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
              child: new Text("Close",style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




  SaveQuiz()async {

    print(
      "quiz_title : "+ GlobalData.QuizTitle +
      "\ntecher_id : "+ GlobalData.uid +
      "\nno_of_levels : "+ GlobalData.QuizLevels +
      "\nque_each_level :"+ GlobalData.NosofQuesPerLevel +
      "\ndur_each_level :"+ GlobalData.DurationofEachLevel +
      "\nquiz_subject : "+ GlobalData.Selected_subject.toString() +
      "\nclass_id : "
    //  "\npublish_date : 2019-06-23 00:00:01"+
    //  "\nclosing_date : 2019-06-26 00:00:01"
       // "\n age:" + GlobalData.age

    );


    if (GlobalData.QuizTitle == null || GlobalData.QuizLevels == null ||
        GlobalData.NosofQuesPerLevel == null ||
        GlobalData.DurationofEachLevel == null ||
        GlobalData.Selected_subject == null||
        GlobalData.Selected_class== null
        //|| Starting_date==null||
        //Closing_date==null
    //||GlobalData.age == null
        ) {

      _showDialog();
    }
    else{
      http.post("http://edusupportapp.com/api/create_quiz.php", body: {
        "quiz_title": GlobalData.QuizTitle,
        "techer_id": GlobalData.uid,
        "no_of_levels": GlobalData.QuizLevels,
        "que_each_level": GlobalData.NosofQuesPerLevel,
        "dur_each_level": GlobalData.DurationofEachLevel,
        "quiz_subject": GlobalData.Selected_subject,
        "class_id": GlobalData.Selected_class_IDS,
       // "publish_date":Starting_date.toString(),
       // "closing_date":Closing_date.toString(),
        //"age":GlobalData.age,
      }).then((response) {
        print(response.body.toString());
        var statuss = jsonDecode(response.body);

      if(statuss['status']==1){


        GlobalData.QuizID=statuss['quizdata']['ID'];
        print(GlobalData.QuizID);
        print("gonadsf to qwesdf");
      //  ClearRegisterData();
        Navigator.of(context).pushNamed('questions');


      }else
      {




      }
//        Navigator.of(context)
//            .pushNamed(
//            'questions');
      }

      );
  }
  }




}
