import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';


class publishspellingbee extends StatefulWidget {
  @override
  _publishspellingbeeState createState() => _publishspellingbeeState();
}

class _publishspellingbeeState extends State<publishspellingbee> {

  TextEditingController publishdate= new TextEditingController();
  TextEditingController closingdate= new TextEditingController();

  var now = DateTime.now();

  @override
  void initState() {
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


  final formats = {
    InputType.both: DateFormat("yyyy-MM-dd h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime Starting_date;
  DateTime Closing_date;

  Publishquiz() async {
    http.post("http://edusupportapp.com/api/publish_spelling.php", body: {
      "spelling_id":GlobalData.spellingid,
      "publish_date":publishdate.text.toString(),
      "closing_date":closingdate.text.toString(),


    }).then((response) {
      print(response.body);

      setState(() {

      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Publish Spelling Bee",
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
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 25, right: 15),
                    child:
                    Card(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[

                            Text("Your Spelling exercise, "+ GlobalData.spelltitle + " will be set for students " +
                                 GlobalData.Selected_class + " Classes.",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text("Use the Scheduler to publish your post",style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: SizedBox()),

                      Expanded(flex:2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            child: Card(elevation: 5.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: DateTimePickerFormField(
                                  initialDate: Starting_date,
                                  lastDate: Closing_date,
                                  firstDate: Starting_date==null?DateTime.now():Starting_date,
                                  initialTime: TimeOfDay.now(),
                                  inputType:  inputType,
                                  format: formats[inputType],
                                  editable: false,
                                  decoration: InputDecoration(
                                      labelText: 'Select Closing Date',labelStyle:
                                  TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold), hasFloatingPlaceholder: false,border:InputBorder.none),
                                  onChanged: (dt) => setState(() => Closing_date = dt),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 40),
                  child: Container(width: 150,
                    child: GradientButtonText(
                      ButtonClick: () {
                        PublishSpelling();

                      },
                      linearGradient: LinearGradient(
                          colors: <Color>[
                            GlobalData.purple,
                            GlobalData.pink
                          ]),
                      text: Text(
                        "Publish Now",
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
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[

                        Row(
                          children: <Widget>[
                            Text("Schedule Post",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 18,color: Colors.red),textAlign: TextAlign.justify,),
                          ],
                        ),

                        Column(
                          children: <Widget>[

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Card(elevation: 5.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DateTimePickerFormField(
                                    firstDate: DateTime.now(),
                                    inputType:  inputType,
                                    format: formats[inputType],
                                    editable: false,
                                    decoration: InputDecoration(
                                        labelText: 'Choose Date and Time',labelStyle:
                                    TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold), hasFloatingPlaceholder: false,border:InputBorder.none),
                                    onChanged: (dt) => setState(() => Starting_date = dt),
                                  ),
                                ),
                              ),
                            ),



                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),


              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 40),
                  child: Container(width: 150,
                    child: GradientButtonText(
                      ButtonClick: () {
                        ScheduleSpelling();

                      },
                      linearGradient: LinearGradient(
                          colors: <Color>[
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
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  PublishSpelling()async {


    print(
        "publish_date :"+ DateTime.now().toString()+
            "\nclosing_date : 2019-06-26 00:00:01"
    );

    if (Closing_date==null  ) {
      CustomShowDialog(context,title:

      "Date is Missing",msg:
      "Please Select Closing Date");
    }else{

      http.post(
          "http://edusupportapp.com/api/publish_spelling.php", body: {
        "spelling_id":GlobalData.spellingid,
        "publish_date":DateTime.now().subtract(Duration(hours: 4,minutes: 30)).toString(),
        "closing_date":Closing_date.toString(),

      }).then((response) {
        var status = jsonDecode(response.body);
        if(status['status']==1){
          Navigator.of(context).pushReplacementNamed('Recentque');
          ClearRegisterData();
          setState(() {});
        }
        else{

        }


      });
    }
  }


  ScheduleSpelling()async {


    print(
        "publish_date :"+ Starting_date.toString()+
            "\nclossing_date :"+Closing_date.toString()
    );

    if (Starting_date==null||Closing_date==null) {
      CustomShowDialog(context,title:

      "Date is Missing",msg:
      "Please Select Starting and Closing Date");
    }else{

      http.post(
          "http://edusupportapp.com/api/publish_spelling.php", body: {
        "spelling_id":GlobalData.spellingid,
        "publish_date":Starting_date.subtract(Duration(hours: 4,minutes: 30)).toString(),
        "closing_date":Closing_date.toString(),

      }).then((response) {
        var status = jsonDecode(response.body);
        if(status['status']==1){
          Navigator.of(context).pushReplacementNamed('Recentque');
          ClearRegisterData();
          setState(() {});
        }
        else{

        }


      });
    }
  }


}
