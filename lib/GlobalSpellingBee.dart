import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newpro/global.dart' as prefix0;
import 'Pojo/pojo_quizzes.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'Pojo/pojo_getspelling.dart';



class GlobalSpellinglist extends StatefulWidget {
  @override
  _GlobalSpellinglistState createState() => _GlobalSpellinglistState();
}

class _GlobalSpellinglistState extends State<GlobalSpellinglist> {

  List<Pojo_spelling> spellinglist = new List();

  GetTest() async{

    await http.post("http://edusupportapp.com/api/get_global_spellings.php",
        body: {
          "UserId":GlobalData.uid,
          "subject":GlobalData.Selected_subject
        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      spellinglist = (ParsedJson['spellingdata'] as List).map((data)=>Pojo_spelling.fromJson(data)).toList();

      print(spellinglist.length);
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
          automaticallyImplyLeading: false,

          title: Center(
            child: Text(
              "Global Spelling",
              style: TextStyle(fontSize: 20),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [GlobalData.green, GlobalData.green],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed('GlobalDashboard');
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
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
                            child: Text(spellinglist.isNotEmpty?spellinglist[0].publish_date:"",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 16,
                                  fontWeight: FontWeight.bold),),
                          ),

                        ),



                        Expanded(
                          child: SizedBox(width: 100,
                            child: GestureDetector(onTap: (){

                              if(spellinglist.isEmpty){
                                CustomShowDialog(context,title: "Unavailable",msg:
                                "No Spelling Exercise published yet");
                              }
                              else{
                                GlobalData.isGlobal=false;
                                GlobalData.spellingid=spellinglist[0].id;
                                GlobalData.spellLevels=spellinglist[0].no_of_levels;
                                GlobalData.ExamQuiz=spellinglist[0].spelling_title;
                                GlobalData.spellDurationofEachLevel=spellinglist[0].dur_each_level;//studentLevelList
                                // Navigator.of(context).pushNamed(Quizz_List[i].is_taken==true?'AnswerLog':'exam');
                                Navigator.of(context).pushNamed('studentspellingLevelList');
                              }

                            },
                              child: Card(color:Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("New Spelling",textAlign: TextAlign.center,
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
                        Text(spellinglist.isNotEmpty?spellinglist[0].spelling_title:"No Spelling Available",style: TextStyle(
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
                          child: Text(spellinglist.isNotEmpty?spellinglist[0].no_of_levels + " Levels":"",style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold,color:GlobalData.white
                          ),),
                        ),

                        Expanded(
                          child: Text(spellinglist.isNotEmpty?spellinglist[0].dur_each_level + " Minutes":"",style: TextStyle(
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
                          child: Text(spellinglist.isNotEmpty?spellinglist[0].closing_date.substring(0,19):"",style:TextStyle(
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
                  itemCount: spellinglist.length,
                  itemBuilder: (c,i){
                    GlobalData.isGlobal=true;
                    return  GestureDetector(
                      onTap: (){

                        GlobalData.EditQuiz=false;
                        GlobalData.spellingid=spellinglist[i].id;
                        GlobalData.ExamQuiz=spellinglist[i].spelling_title;
                        GlobalData.spellDurationofEachLevel=spellinglist[i].dur_each_level;
                        GlobalData.spellLevels=spellinglist[i].no_of_levels;
                        Navigator.of(context).pushNamed(GlobalData.userType=="student"?'studentspellingLevelList':'spellingquestionlist');

                      },
                      child: GlobalSpellingActivity(
                        spelling:spellinglist[i] ,

                        color: GlobalData.green,
                        heading: spellinglist[i].spelling_title,
                        paragraph: spellinglist[i].spelling_subject,
                        id:spellinglist[i].id ,
                        title: spellinglist[i].spelling_title,
                        duration: spellinglist[i].dur_each_level,
                        levels: spellinglist[i].no_of_levels,
                        closingdate: spellinglist[i].closing_date,
                      ),
                    );
                  }),
            ),
          ],
        )


    );
  }
}
