import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newpro/global.dart' as prefix0;
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;



class questionmenuGlobal extends StatefulWidget {
  @override
  _questionmenuGlobalState createState() => _questionmenuGlobalState();
}

class _questionmenuGlobalState extends State<questionmenuGlobal> {

  List<Pojo_quizzes> Quizz_List = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_global_quizzes.php",
        body: {
          "UserId":GlobalData.uid
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      Quizz_List = (ParsedJson['quizdata'] as List).map((data)=>Pojo_quizzes.fromJson(data)).toList();

      print(Quizz_List.length);
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Global Quiz",
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
              onPressed: (){},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],
        ),



        body:
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(color: Colors.green),

              child: Column(

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 20,right:20,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(Quizz_List.isNotEmpty?Quizz_List[0].publish_date:"",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 16,
                                  fontWeight: FontWeight.bold),),
                          ),

                        ),



                        Expanded(
                          child: SizedBox(width: 100,
                            child: GestureDetector(onTap: (){

                              if(Quizz_List.isEmpty){
                                CustomShowDialog(context,title: "Unavailable",msg:
                                "No Quiz Exercise published yet");
                              }
                              else{
                                GlobalData.isGlobal=false;
                                GlobalData.QuizID=Quizz_List[0].id;
                                GlobalData.QuizLevels=Quizz_List[0].no_of_levels;
                                GlobalData.ExamQuiz=Quizz_List[0].quiz_title;
                                GlobalData.DurationofEachLevel=Quizz_List[0].dur_each_level;//studentLevelList
                                // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                                Navigator.of(context).pushNamed('studentLevelList');
                              }

                            },
                              child: Card(color:Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("New Quiz",textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 16,
                                        fontWeight: FontWeight.bold),),
                                ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20),
                    child: Row(
                      children: <Widget>[
                        Text(Quizz_List.isNotEmpty?Quizz_List[0].quiz_title:"No Quiz Available",style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold,color:GlobalData.white
                        ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(Quizz_List.isNotEmpty?Quizz_List[0].no_of_levels + " Levels":"",style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                          ),),
                        ),

                        Expanded(
                          child: Text(Quizz_List.isNotEmpty?Quizz_List[0].dur_each_level + " Minutes":"",style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                          ),),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 20,right: 20,bottom: 15),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: GradientButtonText(
                            linearGradient:LinearGradient(begin:Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.orange,Colors.deepOrange]) ,
                            text: Text("Closing",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 16,),
                              textAlign: TextAlign.center,),
                            ButtonClick: (){
                            },),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(Quizz_List.isNotEmpty?Quizz_List[0].closing_date.substring(0,19):"",style:TextStyle(
                              fontSize: 15,color: GlobalData.white
                          ) ,),
                        )
                      ],
                    ),
                  ),


                ],
              ),

            ),

            Expanded(
              child: ListView.builder(
                  itemCount: Quizz_List.length,
                  itemBuilder: (c,i){
                    GlobalData.isGlobal=true;
                    return  GestureDetector(
                      onTap: (){


                        GlobalData.EditQuiz=false;
                        GlobalData.QuizID=Quizz_List[i].id;
                        GlobalData.ExamQuiz=Quizz_List[i].quiz_title;
                        GlobalData.DurationofEachLevel=Quizz_List[i].dur_each_level;
                        GlobalData.QuizLevels=Quizz_List[i].no_of_levels;
                        Navigator.of(context).pushNamed(GlobalData.userType=="student"?'studentLevelList':'Question_List');
                      },
                      child: GlobalQuizActivity(
                        color: GlobalData.green,
                        heading: Quizz_List[i].quiz_title,
                        paragraph: Quizz_List[i].quiz_subject,
                        id:Quizz_List[i].id ,
                        title: Quizz_List[i].quiz_title,
                        duration: Quizz_List[i].dur_each_level,
                        levels: Quizz_List[i].no_of_levels,
                        closingdate: Quizz_List[i].closing_date,
                      ),
                    );
                  }),
            ),
          ],
        )


    );
  }
}
