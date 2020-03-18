import 'dart:convert';
import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'Utils/CustomWidgets.dart';
import 'global.dart';
import 'package:newpro/Pojo/pojo_questions.dart';
import 'package:newpro/Pojo/pojo_quizzes.dart';
import 'package:newpro/Pojo/pojo_anslog.dart';

class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {

  bool isCompleted=false;
  bool isattempted =false;
  bool originalCopied =false;
  int Changed=0;
  CountDown cd ;
  int CurrentPage =0;
  PageController pageController = new PageController();
  List<Pojo_questions> OriginalQuetionsList = new List();
  List<Pojo_questions> Quetions = new List();
  List<Pojo_quizzes> timer = new List();
  int i=0;
  List<Pojo_Matchs> matchs = new List();
  String ExamAnswer ="";
  ScrollController controller = new ScrollController();
  List<Pojo_Answers> Options = List();
  List<MatchClass> Matchs = List();
  List<Pojo_Matchs> Matches = List();
  List<Pojo_Matchs> Matches2 = List();
  List<Pojo_Matchs> ActualAnswer = List();
  int Selected =0;
  List<int> Selecteditem=new List();
  String TrueorFalse = "";
  List<String> _list = new List();
  List<String> _Originallist = new List();
  List<String> MatchingAnswers = new List();
  List<String> fillupsData = new List();
  List<String> _TestingList = new List();
  bool isloading = true;
  String TimerText ="-:--:--";
  int timermins = int.parse(GlobalData.DurationofEachLevel);
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
    await http.post("http://edusupportapp.com/api/get_quiz_questions.php",body: {
      "QuizId":GlobalData.QuizID
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      OriginalQuetionsList = (ParsedJson['quizquestionsdata'] as List).map((data)=>Pojo_questions.fromJson(data)).toList();

      for(var item in OriginalQuetionsList){

        if(item.level_no==GlobalData.CurrentLevel.toString()) {
          Quetions.add(item);
        }

      }

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
    Matches=Data;
    Options = Answers;
    print(GlobalData.LoadData.toString());


    switch (type)
    {
      case "Match Type":
      return Container(
          height: Matches.isEmpty?50.0:Matches.length*60.0,
          child: Row(
            children: <Widget>[
              Expanded(child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: Matches.length,
                        itemBuilder: (c,i){
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              color: Colors.green[300],
                              child: ListTile(
                                title: Text( Matches[i].val1),
                          //      leading: Icon(Icons.add,color: Colors.transparent,),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),),
              Expanded(child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: MatchingAnswers.length,
                        itemBuilder: (c,i){
                          return MatchingAnswers[i]==" - " ?
                          DragTarget(
                            builder: (context, List<String> candidateData, rejectedData){
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  color: Colors.grey[300],
                                  child: ListTile(
                                    title: Text( MatchingAnswers[i]),
                                    leading: Icon(Icons.add,color: Colors.transparent,),
                                  ),
                                ),
                              );
                            },

                           onAccept: (data){
                             print("Before Original : "+_Originallist.toString());
                              print(data);

                              MatchingAnswers[i]=_list[int.parse(data)];
                              _list[int.parse(data)]=" - ";
                             _Originallist[int.parse(data)]=MatchingAnswers[i];

                              print(_list[int.parse(data)]);
                              print(MatchingAnswers[i]);


                              print("Before Original : "+_Originallist.toString());
                              print("Before Macting : "+MatchingAnswers.toString());
                              print("Before list : "+_list.toString());

                              print("After Original: "+_Originallist.toString());
                              print("After Matching: "+MatchingAnswers.toString());
                              print("After list: "+_list.toString());

                              setState(() {

                              });
                           },

                          ):
                          Padding(
                              padding: const EdgeInsets.all(2.0),
                              child:Container(
                            color: Colors.amber,
                            child: ListTile(
                              title: Row(

                                children: <Widget>[
                                  GestureDetector(
                                  onTap: (){

                                    print("Before Original : "+_Originallist.toString());
                                    print("Before Macting : "+MatchingAnswers.toString());
                                    print("Before list : "+_list.toString());

                                    int no = _Originallist.indexOf(MatchingAnswers[i]);
                                    print("My Index is $no");
                                    _list[no]=MatchingAnswers[i];
                                    MatchingAnswers[i]=" - ";


                                    print("After Original: "+_Originallist.toString());
                                    print("After Matching: "+MatchingAnswers.toString());
                                    print("After list: "+_list.toString());

                             //  _list[_Originallist.indexOf(MatchingAnswers[i])]=MatchingAnswers[i];
                             //  MatchingAnswers[i]="-";
                               setState(() {
                               });
                                  }
                                  ,child: Icon(Icons.cancel,size: 15,)),
                                  SizedBox(width: 5,),
                                  Expanded(child: Text( MatchingAnswers[i])),
                                ],
                              ),
                            ),
                          ));
                        }),
                  ),
                ],
              ),),
              Expanded(child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: _list.length,
                        itemBuilder: (c,i){
                          return _list[i]==" - "?Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              color: Colors.grey,
                              child: ListTile(
                                title: Text( _list[i]),
                                leading: Icon(Icons.add,color: Colors.transparent,),
                              ),
                            ),
                          ): Draggable(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              color: Colors.amber,
                              child: ListTile(
                                title: Text( _list[i]),
                              //  leading: Icon(Icons.add,color: Colors.transparent,),
                              ),
                            ),
                          ), feedback: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 100,
                              color: Colors.amber,
                              child:Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(color: Colors.transparent,child: Text("")),
                                ),

                              ),
                            ),
                          ),childWhenDragging: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              color: Colors.amber,
                              child: ListTile(
                                title: Text( ""),
                                leading: Icon(Icons.add,color: Colors.transparent,),
                              ),
                            ),
                          ),
                          data: i.toString(),);
                        }),
                  ),
                ],
              ),),
            /*  Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ReorderableListView(

                        children: _list.map((item) =>Padding(key: Key("${item}+padding"),
                          padding: const EdgeInsets.all(2.0),
                          child: Container( key: Key("${item}con"),
                              color:Colors.amber,child: ListTile( key: Key("${item}"), title: Text("${item}"), trailing: Icon(Icons.menu),)),)).toList(),
                        onReorder: (int start, int current) {
                          // dragging from top to bottom
                          if (start < current) {
                            int end = current - 1;
                            String startItem = _list[start];
                            int i = 0;
                            int local = start;
                            do {
                              _list[local] = _list[++local];
                              i++;
                            } while (i < end - start);
                            _list[end] = startItem;
                          }
                          // dragging from bottom to top
                          else if (start > current) {
                            String startItem = _list[start];
                            for (int i = start; i > current; i--) {
                              _list[i] = _list[i - 1];
                            }
                            _list[current] = startItem;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        );
      case "True False":
        return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(padding: EdgeInsets.all(5),child: Text("Select Answer",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 110.0,
                      child: Column(
                        children: <Widget>[
                          Container(child: Row(
                            children: <Widget>[
                              Radio(value: "false", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;setState(() {

                              });}),
                              Text("True")



                            ],),),
                          Container(child: Row(
                            children: <Widget>[
                              Radio(value: "true", groupValue: TrueorFalse, onChanged: (v){TrueorFalse=v;
                              setState(() {

                              });}),

                              Text("False")



                            ],),)

                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),);

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
    Timmer();
    GetQuestions();


  }


  Widget MYQue(){

    print(Quetions[i].answer_type);
    print("SHUFFLE");
    print(_Originallist.toString());
    print(_list.toString());
    print("ARUN");
    print(_list.length);
    if(Quetions[i].answer_type=="Match Type" && Matches2.isEmpty)
      {
        print("Yes we are in Mactch Type");

       Matches2= Quetions[i].anwer_options;
     //  Matches2.shuffle();
        if(_list.length==0) {
          for (var item in Matches2) {
            _TestingList.add(item.val2);
            _list.add(item.val2);
            _Originallist.add(item.val2);
            MatchingAnswers.add(" - ");
          }
          print("SHUFFLE");
          print(_Originallist.toString());
          print(_list.toString());
          print("ARUN");
          print(_list.length);
          if(Changed==0)
          {
            print("calling Changed");
            changenow();
            Changed=1;
          }
        }
      }





    return SafeArea(
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Quiz Name: "+ GlobalData.ExamQuiz,style: TextStyle(fontSize: 18,
                  color: GlobalData.navyblue,fontWeight: FontWeight.bold),),
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
                        Navigator.of(context).pushReplacementNamed('studentLevelList');

                      },
                      child: Text("Exit",style: TextStyle(color: Colors.white),),
                    )

                  ],
                ),
              ),





              Container(

                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Level ${Quetions[i].level_no.toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            )),
                          ],
                        ),
                      ),
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
                          GiveAnswer("skip", (i + 1).toString());
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
                        ButtonClick: () async {
                          bool remaning = false;

                          String answ="";

                          if(Quetions[i].answer_type=="Match Type")
                          {
                            for(int i=0;i<MatchingAnswers.length;i++)
                            {
                             if(MatchingAnswers[i]==" - ")
                               {
                                 remaning = true;
                               }
                            }

                            if(remaning==true){
                              Show_toast_Now("Please Complete the Matching.", Colors.red);
                            }else
                              {
                                /*for(int i=0;i<MatchingAnswers.length;i++)
                                {
                                  Matches[i].val2=MatchingAnswers[i];
                                }*/



                                print("Option Array : "+jsonEncode(Quetions[i].anwer_options));
                                ActualAnswer.clear();
                                print("Options : "+Quetions[i].anwer_options.length.toString());

                                ActualAnswer=Quetions[i].anwer_options;

                                for(int i=0;i<ActualAnswer.length;i++)
                                {

                                  print(ActualAnswer[i].val1);
                                  ActualAnswer[i].val2=MatchingAnswers[i];

                                 // ActualAnswer.add(Pojo_Matchs(val1: Quetions[i].anwer_options[i].val1,val2: "0"));
                                 // Matches[i].val2=MatchingAnswers[i];
                                }

                                answ=jsonEncode(ActualAnswer);
                                print(answ);
                              }

                          }else if(Quetions[i].answer_type=="True False")
                          {

                            answ=TrueorFalse;

                            if(TrueorFalse=="true")
                            {
                              answ="False";
                            }else
                            {
                              answ="True";
                            }

                          }else if(Quetions[i].answer_type=="Fill-in the gaps")
                          {

                         //   answ=fillupsData.toString();


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

                          }else{
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
                            int selectedAnswers = 0;
                            if (Quetions[i].answer_type == "Multiple Answers" || Quetions[i].answer_type == "Single Answer") {
                              for (int i = 0; i < Options.length; i++) {
                                if (Options[i].trueanswer == true) {
                                  selectedAnswers++;
                                }
                              }

                            }


                            else if(Quetions[i].answer_type=="True False")
                            {

                              if(TrueorFalse!="")
                              {
                                selectedAnswers=1;

                              }else
                                {
                                  answ="s_k_i_p";
                                }

                            }


                            if (Quetions[i].answer_type == "Single Answer" &&
                                selectedAnswers <1 ) {

                              Show_toast_Now(
                                  "Please complete the single answer or can skip the questions.",
                                  Colors.red);
                            }

                            else if (Quetions[i].answer_type == "Multiple Answers" && selectedAnswers < 2)
                            {
                              Show_toast_Now(
                                  "Please complete the multiple answer or can skip the questions.",
                                  Colors.red);
                            }
                            else if(Quetions[i].answer_type == "True False" && selectedAnswers != 1)
                              {
                                Show_toast_Now(
                                    "Please complete the true or false or can skip the questions.",
                                    Colors.red);
                              }


                            else {
                              await GiveAnswer(answ, (i + 1).toString());
                              //Show_toast_Now("Data removing",Colors.red);

                              TrueorFalse = "";
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
      ),
    );
  }


  submittime()async{
    await http.post("http://edusupportapp.com/api/insert_quiz_attend_time.php",body: {
      "user_id":GlobalData.uid,
      "quiz_id":Quetions[i].quiz_id,
      "level":Quetions[i].level_no.toString(),
      "taken_time":getLevelTime(),
      "type":"s",
    }).then((res){
      print(res.body);
    });

  }



  getExamResult()async{

  //  submittime();


    http.post("http://edusupportapp.com/api/get_user_quiz_result.php",body:{
      "quiz_id":GlobalData.QuizID,
      "user_id":GlobalData.uid,
      "level":GlobalData.CurrentLevel.toString()
    }).then((res){
      print(res.body);
      var parsedJson = jsonDecode(res.body);
      print(parsedJson['useranswedata']['point_awarded']);

      ExamCompleted(context,parsedJson['useranswedata']['point_awarded'].toString());
    });
  }


  @override
  Widget build(BuildContext context) {

/*
    List<String> Value1 = List();
    List<String> Value2 = List();



    for(var item in Quetions[0].anwer_options){
      Value1.add(item.val1);
      Value2.add(item.val2);
    }


    print(Value2.length);
    print(Value1.length);*/


    /*print(Quetions[i].anwer_options.length.toString()+"  asdznaisdfmmb k");
Matches =Quetions[i].anwer_options;*/
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(title: Text("My Quiz Exercises"),centerTitle: true,automaticallyImplyLeading: false,),
          body: isloading==true?Center(child: Text("Loading...")):isCompleted?Container():MYQue()




        /*SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          controller:controller ,itemCount: Value1.length,itemBuilder: (c,i){
                        return ListTile(title: Text(Value1[i]),leading: Icon(Icons.menu),);
                      }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReorderableListView(


                        children:  Value2.map((item) => ListTile(key: Key("${item}"), title: Text("${item}"), trailing: Icon(Icons.menu),)).toList(), onReorder: (int start, int current) {
                        // dragging from top to bottom
                        if (start < current) {
                          int end = current - 1;
                          String startItem = Value2[start];
                          int i = 0;
                          int local = start;
                          do {
                            Value2[local] = Value2[++local];
                            i++;
                          } while (i < end - start);
                          Value2[end] = startItem;
                        }
                        // dragging from bottom to top
                        else if (start > current) {
                          String startItem = Value2[start];
                          for (int i = start; i > current; i--) {
                            Value2[i] = Value2[i - 1];
                          }
                          Value2[current] = startItem;
                        }
                        setState(() {});
                      },),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )*/

      ),
    );
  }







  GiveAnswer(String answer,String qno)async{
  //  Fluttertoast.showToast(msg: "Giving Answer");
    print("Your Answer : "+answer);
    if(cd!=null) {
      cd.isPaused = true;
    }



  await  http.post("http://edusupportapp.com/api/quiz_answer.php",body: {
      "user_id":GlobalData.uid,
      "question_id":Quetions[i].id,
      "quiz_id":Quetions[i].quiz_id,
      "level":Quetions[i].level_no.toString(),
      "q_no":qno,
      "answer":answer
    }).then((res){
     // Fluttertoast.showToast(msg: "ResultSubmitted");
      print(res.body);
    });


    for(int i=0;i<fillupsData.length;i++) {
      fillupsData[i]="";
      Textcontroller[i].text="";
    }




    if(i<Quetions.length-1) {
      print("Clearing all Data");
      Changed = 0;
      fillupsData.clear();
      _TestingList.clear();
      _list.clear();
      _Originallist.clear();
      MatchingAnswers.clear();
      originalCopied = false;
      Matches2.clear();
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

                                    child: Text('Quiz Completed',textAlign: TextAlign.center,
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
                                                Navigator.of(context).pushReplacementNamed('studentLevelList');
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
    int ConsumedTime = (int.parse(GlobalData.DurationofEachLevel)*60)-((min*60)+second);
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
                Navigator.of(context).pushNamed('studentLevelList');
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
