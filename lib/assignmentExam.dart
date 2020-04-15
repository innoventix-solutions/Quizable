import 'dart:convert';
import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'Utils/CustomWidgets.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_questions.dart';
import 'package:newpro/Pojo/pojo_getassignment.dart';
//import 'package:newpro/Pojo/pojo_quizzes.dart';
import 'package:newpro/Pojo/pojo_anslog.dart';

class AssignmentExam extends StatefulWidget {
  @override
  _AssignmentExamState createState() => _AssignmentExamState();
}

class _AssignmentExamState extends State<AssignmentExam> {


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


  bool isCompleted=false;
  bool isattempted =false;
  bool originalCopied =false;
  TextEditingController shortessayanswer = new TextEditingController();
  int Changed=0;
  CountDown cd ;
  List<Pojo_getassignment> timer = new List();
  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_questions> Quetions = new List();
  List<Pojo_questions> OriginalQuetionsList = new List();
  List<Pojo_getassignment> assignment_list = new List();
  int i=0;
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  List<Pojo_Answers> Options = List();
  int Selected =0;
  List<int> Selecteditem=new List();
  List<String> _list = new List();
  List<String> fillupsData = new List();
  bool isloading = true;
  String TimerText ="-:--:--";
  int timermins = 10;

  List<TextEditingController> Textcontroller = List();
  List<pojo_anslog> anslist = new List();


  bool _isVisible = true;


  bool _canShowButton = true;

  bool stoptimer =false;

  Timmer(){


    cd = CountDown(Duration(minutes: timermins));
    var sub = cd.stream.listen(null);
    // start your countdown by registering a listener
    sub.onData((Duration d) {
      //   print(d);
      if(stoptimer==false){
        TimerText=d.toString().substring(0,7);

        setState(() {

        });
      }


      /*TimerText=d.toString().substring(0,7);

      setState(() {

      });*/
    });
    // when it finish the onDone cb is called
    sub.onDone(() {
      getExamResult();
      cd.isPaused=true;


    });

  }

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  TextEditingController ans1 = new TextEditingController();
  TextEditingController ans2 = new TextEditingController();

  @override
  dispose()
  {
    cd.isPaused=true;
    super.dispose();

  }

  GetQuestions() async{
    isloading = true;
    setState(() {

    });
    print(GlobalData.QuizID);
    await http.post("http://edusupportapp.com/api/get_assignment_questions.php",body: {
      "assignment_id":GlobalData.AssignmentID
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Quetions = (ParsedJson['assignmentquestionsdata'] as List).map((data)=>Pojo_questions.fromJson(data)).toList();
      setState(() {
      });
    });
    isloading=false;
    setState(() {

    });
  }

  Widget AnswerNow(String type,List<Pojo_Matchs> Data,List<Pojo_Answers> Answers,String que)
  {

    //   Show_toast_Now("Current Type :"+type, Colors.red);
    print("Current Type :"+type);

    Options = Answers;
    print(GlobalData.LoadData.toString());



    switch (type)
    {

      case "Fill-in the gaps":
        int no = ('_'
            .allMatches(que.toString())
            .length);



        return Container(
          height: (no*50.0)+100,
          child: Card(
            child: Column(
              children: <Widget>[

                Expanded(child: ListView.builder(
                    itemCount: no,itemBuilder: (c,i){





                  if(fillupsData.length<no ) {
                    fillupsData.add("");
                    Textcontroller.add((TextEditingController()));
                    Textcontroller[i].text="";
                  }


                  return Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: TextField(
                      controller: Textcontroller[i],
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,



                      decoration: InputDecoration(hintText: "Answer ${i+1}"),

                      onChanged: (val){
                        print(val);
                        fillupsData[i]=val; print("Data : "+fillupsData[i].toString());},
                    ),
                  );
                }),)
              ],
            ),),
        );

      case "Short Essay":
        return CustomTextField(controller: shortessayanswer,Texth: "Write Short Essay",maxline: 10,);

      default:

        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: Options.isEmpty?50.0:Options.length*50.0,

                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                                itemCount: Options.length,itemBuilder: (context,index){
                              return Container(child: Row(
                                children: <Widget>[
                                  Checkbox(value: Options[index].trueanswer, onChanged: (value){


                                    Options[index].trueanswer=value;setState(() {

                                    });},),
                                  Text(Options[index].value,maxLines: 4,)



                                ],),);}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(GlobalData.userType);
    Timmer();
    GetQuestions();

  }


  Widget MYQue(){



    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Assignment Name: "+ GlobalData.ExamQuiz,style: TextStyle(fontSize: 18,
                        color: GlobalData.navyblue,fontWeight: FontWeight.bold),maxLines: 4,),
                  ),
                ],
              ),
            ),


        Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RaisedButton(
                child: Text(_canShowButton?'Hide Instuctions':'Show Instructions',maxLines: 2,),
                onPressed: (){
                  setState(() {

                    _canShowButton = !_canShowButton;
                  });
                }
              ),
            ),
            SizedBox(width: 50,),

            Expanded(
              child: RaisedButton(
                color: Colors.red,
                onPressed: (){

                  print(getLevelTime());
                  Navigator.of(context).pushReplacementNamed('AssignmentListStudents');

                },
                child: Text("Exit",style: TextStyle(color: Colors.white),),
              ),
            ),



          ],
        ),
      ) ,

            Container(child:
                _canShowButton?
           Card(elevation: 10.0,
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: new Text("Instructions: " +GlobalData.teacherinstruction,
                                style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold) ,),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0,bottom: 10,left: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: new Text("Objective: " +GlobalData.teacherobjective,
                              style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ):SizedBox()
            ),




            Container(

              child: Card(
                child: Column(
                  children: <Widget>[

                    Container(
                      color: Colors.brown,
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Question ${i+1} of ${Quetions.length}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          )),
                        ],
                      ),
                    ),
                    Container(

                      child: Row(
                        children: <Widget>[
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(child: Text(Quetions[i].question,style: TextStyle(fontWeight: FontWeight.bold),)),
                          )),
                        ],
                      ),
                    ),
                    AnswerNow(Quetions[i].answer_type,Quetions[i].anwer_options,Quetions[i].Options,Quetions[i].question),
                    Container(

                      child: Row(
                        children: <Widget>[
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(child: Text(Quetions[i].answer_type,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(color: Colors.blue,child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,4, 10, 4),
                              child: Text(Quetions[i].point_awarded+" Pts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            )),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 15,),
                  Expanded(
                    child: GradientButtonText(
                      ButtonClick: (){
                        //if(CurrentPage-2<Quetions.length)
                          //pageController.jumpToPage(CurrentPage++);
                        GiveAnswer("skip");
                        i++;
                        if (i == Quetions.length) {
                          isCompleted=true;
                          setState(() {

                          });
                          getExamResult();

                          i--;
                        } else {
                          setState(() {

                          });
                        }
                      },
                      linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                      text: Text("Skip",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: GradientButtonText(
                      ButtonClick: ()async{


                        isloading=true;
                        bool remaning = false;

                        String answ="";

                        if(Quetions[i].answer_type=="Short Essay")
                          {
                            answ=shortessayanswer.text.toString();
                          }

                        else if(Quetions[i].answer_type=="Fill-in the gaps")
                        {

                          for (int i = 0; i < fillupsData.length; i++) {



                            if(fillupsData[i]==""){
                              remaning=true;
                            }



                          }

                           if(remaning==true){
                            Show_toast_Now("Please complete the fill in the blanks or can skip the questions", Colors.red);
                          }
                          else{

                             for (int i = 0; i < fillupsData.length; i++) {
                               answ += fillupsData[i];
                               if (i < fillupsData.length - 1 &&
                                   fillupsData.length > 1) {
                                 answ += ",";
                               }
                             }

                           }
                        }

                        else{
                          int Correct = 0;

                          for (int i = 0; i < Options.length; i++) {
                            if (Options[i].trueanswer == true) {
                              Correct++;
                            }
                          }


                          for (int i = 0; i < Options.length; i++) {
                            if (Options[i].trueanswer == true) {

                              answ += Options[i].value;

                              if(i<Options.length-1 && Correct>1)
                              {
                                answ +=",";
                              }
                            }
                          }
                        }


                        if(remaning==false) {
                          int selectedAnswers=0;
                          if(Quetions[i].answer_type=="Multiple Answers" ) {
                            for (int i = 0; i < Options.length; i++) {
                              if (Options[i].trueanswer == true) {
                                selectedAnswers++;
                              }
                            }
                          }

                          if (Quetions[i].answer_type=="Short Essay" && shortessayanswer.text == "") {
                            //_showDialog();
                            Show_toast_Now("Please complete the essay answer or can skip the questions.", Colors.red);
                          }

                          else if(Quetions[i].answer_type=="Multiple Answers" && selectedAnswers<2)
                            {

                              Show_toast_Now("Please complete the multiple answer or can skip the questions.", Colors.red);
                            }

                          else {
                            await GiveAnswer(answ);
                            //Show_toast_Now("Data removing",Colors.red);

                            //TrueorFalse = "";
                            Changed = 0;
                            i++;
                            if (i == Quetions.length) {
                              getExamResult();

                              i--;
                            } else {
                              print("submittingcode");

                              setState(() {

                              });
                            }
                          }
                          }

                        isloading=false;
                      },
                      linearGradient:LinearGradient(colors: <Color>[GlobalData.navyblue,GlobalData.pink]) ,
                      text: Text((i+1)==Quetions.length?"Submit":"Next",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }



  submittime()async{
    await http.post("http://edusupportapp.com/api/insert_assignment_attend_time.php",body: {
      "user_id":GlobalData.uid,
      "assignment_id":Quetions[i].assignment_id,
      //"level":Quetions[i].level_no.toString(),
      "taken_time":getLevelTime(),
      //"type":"s",
    }).then((res){
      print(res.body);
    });

  }


  getExamResult()async{
    http.post("http://edusupportapp.com/api/get_user_assignment_result.php",body:{
      "assignment_id":GlobalData.AssignmentID,
      "user_id":GlobalData.uid
    }).then((res){
      print(res.body);
      var parsedJson = jsonDecode(res.body);
      print(parsedJson['point_awarded']);

      ExamCompleted(context,parsedJson['point_awarded'].toString());
    });
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(title: Text("My Class Assignment"),centerTitle: true,automaticallyImplyLeading: false,),
          body: isloading==true?Center(child: Text("Saving...")):isloading?Container():MYQue()






      ),
    );
  }





  GiveAnswer(String answer)async{

    print("Your Answer : "+answer);
    if(cd!=null) {
      cd.isPaused = true;
    }

    await http.post("http://edusupportapp.com/api/assignment_answer.php",body: {
      "user_id":GlobalData.uid,
      "question_id":Quetions[i].id,
      "assignment_id":Quetions[i].assignment_id,
      "answer":answer
    }).then((res){
      print(res.body);
    });

    print("Your Answer : "+answer);

    for(int i=0;i<fillupsData.length;i++) {
      fillupsData[i]="";
      Textcontroller[i].text="";
    }




    if(i<Quetions.length-1) {
      print("Clearing all Data");
      Changed = 0;
      fillupsData.clear();
      _list.clear();
      originalCopied = false;
      shortessayanswer.text="";
    }
  }


  void ExamCompleted(BuildContext context, String Score)  {
    bool Selected = false;
    TextEditingController optioncontroller = new TextEditingController();
    showDialog(
        barrierDismissible: false,

        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Colors.transparent,
            elevation: 0,
            content: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(

                              child: Column(
                                children: <Widget>[
                                  Center(child: Padding(
                                    padding: const EdgeInsets.all(10),

                                    child: Text("Assignment is in preview",textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),
                                  new Divider(
                                    color: GlobalData.gray,
                                  ),
                                  Center(child: Padding(
                                    padding: const EdgeInsets.all(15),

                                    child:
                                    Image.asset("assets/images/trophy.png",height: 150,),
                                  )),
                                  Center(child: Padding(
                                    padding: const EdgeInsets.only(top:15),

                                    child: Text('Score:'+Score,textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 20,fontWeight: FontWeight.bold),),
                                  )),

                                  Center(child: Padding(
                                    padding: const EdgeInsets.only(top:15),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.timer),
                                        SizedBox(width: 10,),
                                        Text(getLevelTime(),textAlign: TextAlign.center,
                                          style: TextStyle(color: GlobalData.lightblue,fontSize: 20,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )),





                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){



                                                Navigator.of(context).pop();
                                                submittime();
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pushReplacementNamed('AssignmentListStudents');
                                                setState(() {

                                                });

                                              }
                                              ,linearGradient:
                                            LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]),
                                              text: Text('Ok',style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,fontSize: 12,),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                        ),




                                      ],
                                    ),
                                  )],

                              ),

                            ),



                          ],


                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),


          );
        });
  }

  String getLevelTime(){

    // Show_toast_Now(TimerText.substring(2,4),Colors.green);
    int second = int.parse(TimerText.substring(5,7));
    int min = int.parse(TimerText.substring(2,4));
    int ConsumedTime = (int.parse(timermins.toString())*60)-((min*60)+second);
    int usedSecond= ConsumedTime%60;
    int usedMin = (ConsumedTime/60).floor();
    int hour = usedMin==0?0:(usedMin/60).floor();

    String ActualTime = RoundTime(hour.toString())+":"+RoundTime(usedMin.toString())+":"+RoundTime(usedSecond.toString());

    //  Show_toast_Now(RoundTime(hour.toString())+":"+RoundTime(usedMin.toString())+":"+RoundTime(usedSecond.toString()),Colors.green);



    stoptimer=true;
    return ActualTime;


  }


  String RoundTime(String time){

    if(time.length==1)
    {
      time ="0"+time;
    }

    return time;

  }


}
