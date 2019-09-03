import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class assignmentquestionbank extends StatefulWidget {
  @override
  _assignmentquestionbankState createState() => _assignmentquestionbankState();
}

class _assignmentquestionbankState extends State<assignmentquestionbank> {

  DateTime date1;
  DateTime date2;


  String selectedvalue2 = "Select Class";
  TextEditingController teacher = new TextEditingController(text:GlobalData.Username );
  TextEditingController Assignmenttitle = new TextEditingController(text:GlobalData.AssignmentTitle );
  TextEditingController noofque = new TextEditingController(text: GlobalData.NosofQuesassignment);
  TextEditingController instruction = new TextEditingController(text:GlobalData.teacherinstruction);
  TextEditingController Assignmentclass = new TextEditingController();
  TextEditingController publishdate= new TextEditingController();
  TextEditingController closingdate= new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

  setalldetails(){
   GlobalData.AssignmentTitle  = Assignmenttitle.text;
GlobalData.teacherinstruction = instruction.text;
    GlobalData.NosofQuesassignment = noofque.text;

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

  CreateAssignment() async {
    http.post("http://edusupportapp.com/api/create_assignment.php", body: {
      "assignment_title":  Assignmenttitle.text.toString(),
      "no_of_questions": noofque.text.toString(),
      "teacher_instruction":instruction.text.toString(),
      "class_id": Assignmentclass.text.toString(),
      "techer_id": teacher.text.toString(),
      "publish_date":publishdate.text.toString(),
      "closing_date":closingdate.text.toString(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Set Class Assignment",
            style: TextStyle(fontSize: 18),
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
            onPressed: () {Navigator.of(context)
                .pushNamed(
                'Previewassignment');},
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
      drawer:
      drawerquiz(),
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
                            'Theme of Assignment',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(controller: Assignmenttitle,),





                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'How many Questions in all?',
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(Inputnumber: true,controller: noofque,),




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
                                setalldetails();
                                Navigator.of(context)
                                    .pushNamed(
                                    'selectassignmentclass');
                              },
                              ),
                            ),
                          ),
                        ),
                      ),



                      /* teacher instruction */
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Teacher's Instruction",
                            style: TextStyle(
                              color: GlobalData.lightblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomTextField(controller: instruction,maxline: 4,),


                      /* Select starting date and time */


                      Padding(
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
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 40),
                            child: SizedBox(width: 100,
                              child: GradientButtonText(
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
                                SaveQuiz();
                              },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
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
                      ),
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
        "assignment_title : "+ GlobalData.AssignmentTitle +
            "\ntecher_id : "+ GlobalData.uid +

            "\nno_of_questions :"+ GlobalData.NosofQuesassignment +

            "\nteacher_instruction : "+ GlobalData.teacherinstruction +
            "\nclass_id : "+
            "\npublish_date : 2019-06-23 00:00:01"+
            "\nclosing_date : 2019-06-26 00:00:01"

    );


    if (GlobalData.AssignmentTitle == null ||
        GlobalData.NosofQuesassignment == null ||

        GlobalData.teacherinstruction == null||
        GlobalData.Selected_class== null||
        Starting_date==null||
        Closing_date==null) {

      _showDialog();
    }
    else{
      http.post("http://edusupportapp.com/api/create_assignment.php", body: {
        "assignment_title":  GlobalData.AssignmentTitle,
        "no_of_questions": GlobalData.NosofQuesassignment,
        "teacher_instruction":GlobalData.teacherinstruction,
        "class_id": GlobalData.Selected_class_IDS,
        "techer_id": GlobalData.uid,
        "publish_date":Starting_date.toString(),
        "closing_date":Closing_date.toString(),
      }).then((response) {
        print(response.body.toString());
        var statuss = jsonDecode(response.body);

        if(statuss['status']==1){


          GlobalData.AssignmentID=statuss['Assignmentdata']['ID'];
          print(GlobalData.AssignmentID);
          print("set assignment");
          //  ClearRegisterData();
          Navigator.of(context).pushNamed('SetAssignmentQuestion');


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
