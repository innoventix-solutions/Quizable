import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'global.dart';
import 'package:intl/intl.dart';

class publishquiz extends StatefulWidget {
  @override
  _publishquizState createState() => _publishquizState();
}

class _publishquizState extends State<publishquiz> {


  final formats = {
    InputType.both: DateFormat("yyyy-MM-dd h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime Starting_date;
  DateTime Closing_date;

  RangeValues _values = RangeValues(0.3,0.7);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Publish Quiz",
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

                            Text("Your Quiz,"+GlobalData.QuizTitle + " will be set for students " +
                                GlobalData.age + " years in " +GlobalData.Selected_class + " Classes.",
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
                                  firstDate: DateTime.now(),
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
}
