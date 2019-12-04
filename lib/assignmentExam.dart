import 'dart:convert';
//import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  TextEditingController shortessayanswer = new TextEditingController();
  int Changed=0;
  //CountDown cd ;
  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_questions> Quetions = new List();
 // List<Pojo_quizzes> timer = new List();
  List<Pojo_getassignment> assignment_list = new List();
  int i=0;
  //List<Pojo_Matchs> matchs = new List();
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  List<Pojo_Answers> Options = List();
 // List<MatchClass> Matchs = List();
  //List<Pojo_Matchs> Matches = List();
  int Selected =0;
  List<int> Selecteditem=new List();
 // String TrueorFalse = "";
  List<String> _list = new List();
  bool isloading = true;
  //String TimerText ="-:--:--";
 // int timermins = int.parse(GlobalData.DurationofEachLevel=="0"||GlobalData.DurationofEachLevel==null?"15".toString():GlobalData.DurationofEachLevel)*int.parse(GlobalData.QuizLevels);


  List<pojo_anslog> anslist = new List();


  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  /*Timmer(){
    cd = CountDown(Duration(minutes: timermins));
    var sub = cd.stream.listen(null);
    // start your countdown by registering a listener
    sub.onData((Duration d) {
      print(d);
      TimerText=d.toString().substring(0,7);
      setState(() {

      });
    });
    // when it finish the onDone cb is called
    sub.onDone(() {
      print("done");
    });
  }*/

  void changenow(){
    _list.shuffle();
  }


  @override
  dispose()
  {

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

  Widget AnswerNow(String type,List<Pojo_Matchs> Data,List<Pojo_Answers> Answers)
  {

    //   Show_toast_Now("Current Type :"+type, Colors.red);
    print("Current Type :"+type);
  //  Matches=Data;
    Options = Answers;
    print(GlobalData.LoadData.toString());

    /*if(_list.length==0) {
      for (var item in Matches) {
        _list.add(item.val2);
      }
      print(_list.length);
      if(Changed==0)
      {
        changenow();
      }
    }*/


    switch (type)
    {



      case "Multiple Answers":
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

      case "Short Essay":
        return CustomTextField(controller: shortessayanswer,Texth: "Write Short Essay",maxline: 4,);

      default:

        return Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(type=="Fill-in the gaps"?"Note : For multiple blanks question please consider answer which has proper sequence of the words separated by underscore '_' .":"",style: TextStyle(color: Colors.red),),
              ),
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


                                    if(type!="Multiple Answer") {
                                      for (int i = 0; i <
                                          Options.length; i++) {
                                        Options[i].trueanswer = false;
                                      }
                                    }


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

    GetQuestions();

  }


  Widget MYQue(){



    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[



        Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              child: Text('Show/Hide'),
              onPressed: showToast,
            ),

            Visibility (
              visible: _isVisible,
              child: Card(
                child: new ListTile(
                  title: Center(
                    child: new Text(GlobalData.teacherinstruction),
                  ),
                ),
              ),
            ),

          ],
        ),
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
                    AnswerNow(Quetions[i].answer_type,Quetions[i].anwer_options,Quetions[i].Options),
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
                        if(CurrentPage-2<Quetions.length)
                          pageController.jumpToPage(CurrentPage++);
                      },
                      linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                      text: Text("Skip",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: GradientButtonText(
                      ButtonClick: (){


                        String answ="";

                        if(Quetions[i].answer_type=="Short Essay")
                          {
                            answ=shortessayanswer.text.toString();
                          }


                          for (int i = 0; i < Options.length; i++) {
                            if (Options[i].trueanswer == true) {
                              answ += Options[i].value;
                            }
                          }


                        GiveAnswer(answ);
                       // TrueorFalse="";
                        Changed=0;
                        i++;
                        if(i==Quetions.length)
                        {
                          getExamResult();

                          i--;

                        }else {
                          setState(() {

                          });
                        }
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

    return Scaffold(
        appBar: AppBar(title: Text("My Class Assignment"),centerTitle: true,),
        body: isloading==true?Center(child: Text("Loading...")):MYQue()






    );
  }





  GiveAnswer(String answer)async{

    http.post("http://edusupportapp.com/api/assignment_answer.php",body: {
      "user_id":GlobalData.uid,
      "question_id":Quetions[i].id,
      "assignment_id":Quetions[i].assignment_id,
      "answer":answer
    }).then((res){
      print(res.body);
    });

    print("Your Answer : "+answer);

  }


  void ExamCompleted(BuildContext context, String Score)  {
    bool Selected = false;
    TextEditingController optioncontroller = new TextEditingController();
    showDialog(
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





                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){



                                                Navigator.of(context).pop();

                                                Navigator.of(context).pop();
                                                Navigator.of(context).pushNamed('studentdashboard');
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




}
