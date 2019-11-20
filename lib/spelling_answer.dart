import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_answer.dart';
import 'Pojo/pojo_matchs.dart';
import 'global.dart';
//import 'package:newpro/Pojo/pojo_questions.dart';
import 'Pojo/pojo_spellingquestions.dart';


import 'global.dart';

class spelling_ans extends StatefulWidget {
  @override
  _spelling_ansState createState() => _spelling_ansState();
}

class _spelling_ansState extends State<spelling_ans> {


  void  initState(){

    temp();

  }


  FlutterTts Tts = new FlutterTts();

  Future temp() async {

    List<dynamic> languages = await Tts.getLanguages;

    await Tts.setLanguage("en-US");

    await Tts.setSpeechRate(1.0);

    await Tts.setVolume(1.0);

    await Tts.setPitch(1.0);

    await Tts.isLanguageAvailable("en-US");
  }

  Future _speak(String Value) async{
    var result = await Tts.speak(Value);

  }

  Future _stop() async{
    var result = await Tts.stop();

  }

  List<Pojo_Spellingquestions> Questions = new List();
  List<Pojo_Spellingquestions> OriginalList = new List();
  List<String> _list = new List();
  bool isloading = true;


  GetQuestions() async{

    setState(() {

    });
    print(GlobalData.spellingid);
    await http.post("http://edusupportapp.com/api/get_spelling_questions.php",body: {
      "spelling_id":GlobalData.spellingid
    }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      OriginalList = (ParsedJson['spellingquestionsdata'] as List).map((data)=>Pojo_Spellingquestions.fromJson(data)).toList();

      for(var item in OriginalList){
        if(item.level_no==GlobalData.CurrentLevel.toString())
        {
          Questions.add(item);
          print("Match Found");
        }else{
          print("Not Found");
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Spelling Challenge"),
        centerTitle: true,
      ),
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child:
        SingleChildScrollView(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Level " /*${Quetions[i].level_no.toString()}*/,
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
                              "Word Spell " /*${i+1} of ${Quetions.length}*/,
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
                                child: Text(
                                  /*Quetions[i].question*/
                                  "Hint",
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
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Word point",textAlign: TextAlign.center,style:
                                    TextStyle(fontWeight: FontWeight.bold),),
                                  ),

                                )),
                          )),
                    ],
                  ),
                ),

                Card(
                  child:TextField(textCapitalization: TextCapitalization.characters,

                    style: TextStyle(color: Colors.blue, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5),

                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                FlatButton.icon(shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),

                ),
                  color: Colors.blue,
                  icon: Icon(Icons.hearing,color: Colors.white,), //`Icon` to display
                  label: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
                    child: GestureDetector(onTap: (){

                      _speak(Questions[0].anwer_options);

                    },
                        child: Text('Listen',style: TextStyle(fontSize: 20,color: Colors.white),)),
                  ), //`Text` to display
                  onPressed: () {
                    //Code to execute when Floating Action Button is clicked
                    //...
                  },
                ),  ],
            ),
          ),
        ),
      ),


    );
  }
}
