import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_answer.dart';
//import 'Pojo/pojo_matchs.dart';
import 'global.dart';
//import 'package:newpro/Pojo/pojo_questions.dart';
import 'Pojo/pojo_spellingquestions.dart';
import 'package:newpro/Pojo/pojo_questions.dart';
import 'package:newpro/Pojo/pojo_quizzes.dart';
import 'package:newpro/Pojo/pojo_anslog.dart';
import 'package:countdown/countdown.dart';
import 'Pojo/pojo_getspelling.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';



class spelling_ans extends StatefulWidget {
  @override
  _spelling_ansState createState() => _spelling_ansState();
}

class _spelling_ansState extends State<spelling_ans> {


 

  AudioPlayer audioPlayer = new AudioPlayer();

  bool isPlaying = false;
  bool isStarted = false;

  startPlaying()async{
    //await audioPlayer.play(Questions[i].audio_file);
    if(Questions[i].audio_file==""){


      _speak(Questions[i].anwer_options);
      //Show_toast("No Audio FIle", Colors.red);
    }
    else{
     await audioPlayer.play(Questions[i].audio_file);
    }
    print(Questions[i].audio_file);
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb	:1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  TextEditingController answer = new TextEditingController();
  bool isCompleted=false;
  bool isattempted =false;
  bool originalCopied =false;
  int Changed=0;
  CountDown cd ;
  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_Spellingquestions> OriginalList = new List();
  List<Pojo_Spellingquestions> Questions = new List();
  List<Pojo_spelling> timer = new List();
  int i=0;
  //List<Pojo_Matchs> matchs = new List();
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  //List<Pojo_Answers> Options = List();
  //List<MatchClass> Matchs = List();
  //List<Pojo_Matchs> Matches = List();
  //List<Pojo_Matchs> Matches2 = List();
  //List<Pojo_Matchs> ActualAnswer = List();
  int Selected =0;
  List<int> Selecteditem=new List();
//  String TrueorFalse = "";
  List<String> _Originallist = new List();
  List<String> MatchingAnswers = new List();
  List<String> fillupsData = new List();
  List<String> _TestingList = new List();
  String TimerText ="-:--:--";
  int timermins = int.parse(GlobalData.spellDurationofEachLevel);
  List<TextEditingController> Textcontroller = List();



  List<pojo_anslog> anslist = new List();

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
      //stop();
      getExamResult();
      cd.isPaused=true;


    });

  }




  void changenow(){
    _list.shuffle();
    print("My List : "+_list.toString() );

    if(_TestingList.toString()==_list.toString())
    {
      print(_TestingList.toString());
      print(_list.toString());
      changenow();
    }else {

      bool isSame=false;

      for(int i=0;i<_list.length;i++)
      {
        if(_TestingList[i]==_list[i])
        {
          isSame=true;
          continue;
        }
      }

      if(isSame){
        changenow();
      }






      if (originalCopied == false) {
        originalCopied = true;
        // _Originallist = _list;
        print("My Original List Copied  : " + _Originallist.toString());
      }
    }
  }

  @override
  dispose()
  {

    cd.isPaused=true;
    super.dispose();
  }

  void  initState(){

    temp();
    print(GlobalData.userType);
    Timmer();
    GetQuestions();

  }


  FlutterTts Tts = new FlutterTts();

  Future temp() async {

    List<dynamic> languages = await Tts.getLanguages;

    await Tts.setLanguage("en-IN");

    await Tts.setSpeechRate(1.0);

    await Tts.setVolume(50.0);

    await Tts.setPitch(0.5);

    await Tts.isLanguageAvailable("en-IN");
  }

  Future _speak(String Value) async{
    var result = await Tts.speak(Value);

  }

  Future _stop() async{
    var result = await Tts.stop();

  }

  //List<Pojo_Spellingquestions> Questions = new List();
  //List<Pojo_Spellingquestions> OriginalList = new List();
  List<String> _list = new List();
  bool isloading = true;


  GetQuestions() async{
    isloading = true;

    setState(() {

    });
    print(GlobalData.spellingid);
    await http.post(GlobalData.applink+"get_spelling_questions.php",body: {
      "spelling_id":GlobalData.spellingid
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      OriginalList = (ParsedJson['spellingquestionsdata'] as List).map((data)=>Pojo_Spellingquestions.fromJson(data)).toList();



      for(var item in OriginalList){

        if(item.level_no==GlobalData.CurrentLevel.toString()) {
          Questions.add(item);
        }

      }
      setState(() {
      });
    });
    isloading=false;
    setState(() {

    });
  }





  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Spelling Challenge"),
          backgroundColor: GlobalData.darkpurple,automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body:isloading==true?Center(child: Text("Saving...")):isCompleted?
        Container():

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child:
          SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Spelling Name: "+ GlobalData.ExamQuiz,style: TextStyle(fontSize: 18,
                              color: GlobalData.navyblue,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text("Timer : ",style: TextStyle(color: Colors.blue),),
                        Text(TimerText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        Spacer(),
                        RaisedButton(
                          color: Colors.red,
                          onPressed: (){

                            print(getLevelTime());
                            Navigator.of(context).pushReplacementNamed('studentspellingLevelList');

                          },
                          child: Text("Exit",style: TextStyle(color: Colors.white),),
                        )

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                               "Level ${Questions[i].level_no.toString()}",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.brown,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Word Spell ${i+1} of ${Questions.length}",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  child: Text(Questions[i].question,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            )),
                      ],
                    ),
                  ),
                  // AnswerNow(Quetions[i].answer_type,Quetions[i].anwer_options,Quetions[i].Options,Quetions[i].question),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text("Word point - " +Questions[i].point_awarded,textAlign: TextAlign.center,style:
                                            TextStyle(fontWeight: FontWeight.bold),),
                                          ),
SizedBox(width: 20,),

                                          Expanded(

                                            child: FlatButton.icon(shape: RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(20.0),

                                            ),
                                              color: Colors.blue,
                                              icon: GestureDetector(onTap:(){

                                                startPlaying();
                                                setState(() {

                                                });

                                              },child: Icon(Icons.hearing,color: Colors.white,)), //`Icon` to display
                                              label: Padding(
                                                padding: const EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
                                                child: GestureDetector(onTap: (){

                                                  startPlaying();
                                                  setState(() {

                                                  });

                                                },
                                                    child: Text('Listen',style: TextStyle(fontSize: 20,color: Colors.white),)),
                                              ), //`Text` to display
                                              onPressed: () {

                                                startPlaying();
                                                setState(() {

                                                });
                                                //Code to execute when Floating Action Button is clicked
                                                //...
                                              },
                                            ),
                                          ),


                                         ],
                                      ),
                                    ),

                                  )),
                            )),
                      ],
                    ),
                  ),

                  Card(
                    child:TextField(textCapitalization: TextCapitalization.characters,
                      controller: answer,
autocorrect: false,keyboardType: TextInputType.visiblePassword,

                      style: TextStyle(color: Colors.blue, fontSize: 18),
                      decoration: InputDecoration(hintText: "Type Answer here",
                        contentPadding: EdgeInsets.only(left: 5),


                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
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
                              GiveAnswer("skip", (i + 1).toString());
                              i++;
                              if (i == Questions.length) {
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
                            ButtonClick: () async {
                              isloading=true;


                              bool remaning = false;

                              String answ ="";

                              answ +=answer.text.toString();


                              if(remaning==false) {
                                //answ=answer.text.toString();

                                if (answer.text == "") {
                                  //_showDialog();
                                  CustomShowDialog(
                                      context, msg: "Please enter your answer or you can skip if not sure",
                                      title:
                                      "Answer Missing");
                                } else {
                                  await GiveAnswer(answ, (i + 1).toString());
                                  //Show_toast_Now("Data removing",Colors.red);


                                  Changed = 0;
                                  i++;
                                  if (i == Questions.length) {
                                   // savingquestion(context);
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
                            text: Text((i+1)==Questions.length?"Submit":"Next",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(width: 15,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),


      ),
    );
  }

  submittime()async{
    await http.post(GlobalData.applink+"insert_spelling_attend_time.php",body: {
      "user_id":GlobalData.uid,
      "spelling_id":Questions[i].spellingid,
      "level":Questions[i].level_no.toString(),
      "taken_time":getLevelTime(),
      "type":"s",
    }).then((res){
      print(res.body);
    });

  }



  getExamResult()async{

    //  submittime();


    http.post(GlobalData.applink+"get_user_spelling_result.php",body:{
      "spelling_id":GlobalData.spellingid,
      "user_id":GlobalData.uid,
      "level":GlobalData.CurrentLevel.toString()
    }).then((res){
      print(res.body);
      var parsedJson = jsonDecode(res.body);
      print(parsedJson['useranswedata']['point_awarded']);

      ExamCompleted(context,parsedJson['useranswedata']['point_awarded'].toString());
    });
  }

  GiveAnswer(String answers,String qno)async{
    //  Fluttertoast.showToast(msg: "Giving Answer");
    print("Your Answer : "+answers);
    if(cd!=null) {
      cd.isPaused = true;
    }



    await  http.post(GlobalData.applink+"spelling_answer.php",body: {
      "user_id":GlobalData.uid,
      "question_id":Questions[i].id,
      "spelling_id":Questions[i].spellingid,
      "level":Questions[i].level_no.toString(),
      "q_no":qno,
      "answer":answers,
    }).then((res){
      // Fluttertoast.showToast(msg: "ResultSubmitted");
      print(res.body);
    });


   answer.text="";



    if(i<Questions.length-1) {
      print("Clearing all Data");
      Changed = 0;
      answer.clear();
      fillupsData.clear();
      _TestingList.clear();
      _list.clear();
      _Originallist.clear();
      MatchingAnswers.clear();
      originalCopied = false;

    }

    //Show_toast_Now(fillupsData.length.toString(), Colors.green);

    // Show_toast_Now(Textcontroller.length.toString(), Colors.red);



  }


  void ExamCompleted(BuildContext context,String Score)  {
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
                                    padding: const EdgeInsets.only(top:15),

                                    child: Text('Spelling Completed',textAlign: TextAlign.center,
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

                                    child: Text('Score : '+Score,textAlign: TextAlign.center,
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

                                                Navigator.of(context).pop();
                                                submittime();
                                                Navigator.of(context).pushReplacementNamed('studentspellingLevelList');
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
    int ConsumedTime = (int.parse(GlobalData.spellDurationofEachLevel)*60)-((min*60)+second);
    int usedSecond= ConsumedTime%60;
    int usedMin = (ConsumedTime/60).floor();
    int hour = usedMin==0?0:(usedMin/60).floor();

    String ActualTime = RoundTime(hour.toString())+":"+RoundTime(usedMin.toString())+":"+RoundTime(usedSecond.toString());

    //  Show_toast_Now(RoundTime(hour.toString())+":"+RoundTime(usedMin.toString())+":"+RoundTime(usedSecond.toString()),Colors.green);



    stoptimer=true;
    return ActualTime;


  }


  stop(){

    showDialog<void>(
      barrierDismissible: false,

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('FINISH TIME'),
          content: const Text('You have exhausted your time for this level. Tap OK to go to next level'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pushNamed('studentspellingLevelList');
              },
            ),
          ],
        );
      },
    );
  }


  String RoundTime(String time){

    if(time.length==1)
    {
      time ="0"+time;
    }

    return time;

  }


}
