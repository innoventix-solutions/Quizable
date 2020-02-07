import 'dart:convert';
import 'package:newpro/Pojo/pojo_answer.dart';
import 'package:newpro/Pojo/pojo_matchs.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class EditSpellingQuestions extends StatefulWidget {
  @override
  _EditSpellingQuestionsState createState() => _EditSpellingQuestionsState();
}

class _EditSpellingQuestionsState extends State<EditSpellingQuestions> {

 // List<Pojo_Answers> Options = GlobalData.Current_Que_To_Edit.Options;
  //List<Pojo_Matchs> Matches = GlobalData.Current_Que_To_Edit.anwer_options;

    //String TrueorFalse=GlobalData.Current_Que_To_Edit.Options[0].trueanswer.toString();


  TextEditingController QuestionName = new TextEditingController(text: GlobalData.Edit_spelling_Questions.question);
  TextEditingController Points = new TextEditingController(text: GlobalData.Edit_spelling_Questions.point_awarded);
  TextEditingController trueanswer = new TextEditingController(text: GlobalData.Edit_spelling_Questions.anwer_options);

  FlutterAudioRecorder _recorder;
  bool isRecording=false;

  //bool _hasSpeech = false;
  //String lastWords = GlobalData.Edit_spelling_Questions.anwer_options;
  //String lastError = "";
  //String lastStatus = "";
  //final SpeechToText speech = SpeechToText();

  /*Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(onError: errorListener, onStatus: statusListener );

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initSpeechRecognizer();
    //initSpeechState();
  }




  void SpellingCompleted(BuildContext context)  {

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
                                    padding: const EdgeInsets.only(top:15),

                                    child: Text('Spelling Submitted',textAlign: TextAlign.center,
                                      style: TextStyle(color: GlobalData.lightblue,fontSize: 25,fontWeight: FontWeight.bold),),
                                  )),


                                  new Divider(
                                    color: GlobalData.gray,
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        Container(padding: EdgeInsets.all(5),
                                          child: SizedBox(width: 100,
                                            child: GradientButtonText(
                                              ButtonClick: (){

                                                Navigator.of(context).pushReplacementNamed('Recentque');
                                                ClearRegisterData();
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




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            "Set Spelling Questions",
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
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(padding: EdgeInsets.all(5),color:GlobalData.green,
                              child: Text(
                                "Word Spell " +GlobalData.Edit_spelling_Questions.ques_no,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),color:GlobalData.green,
                            child:  Text("Level "+GlobalData.Edit_spelling_Questions.level_no,
                                style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold))
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Word Spell",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 12.0,
                                ),
                                child:  TextField(controller:trueanswer,decoration: InputDecoration(
                                    border: InputBorder.none,hintText: "Insert correct spelling"
                                ),style: TextStyle(fontSize: 24.0,),
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: TextField(
                                  controller: trueanswer,
                                  maxLines: 2,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(border: InputBorder.none,hintText: ""),
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                ),
                              ),*/

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Hint",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: TextField(
                                  controller: QuestionName,
                                  maxLines: 3,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(border: InputBorder.none,hintText: ""),
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Points Awarded",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    TextField(controller: Points,decoration: InputDecoration(border: InputBorder.none),keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[

                                        Row(crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.end,

                                          children: <Widget>[
                                            Expanded(child: Text("Audio/Voice recorder",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),


                                            GestureDetector(
                                                onLongPressStart: (start) async {

                                                  isRecording=true;
                                                  setState(() {

                                                  });
                                                  var path =await getApplicationSupportDirectory();

                                                  print(path.path.toString());

                                                  _recorder = FlutterAudioRecorder("${path.path.toString()}/${DateTime.now().toIso8601String().toString()}.mp3"); // .wav .aac .m4a
                                                  await _recorder.initialized;
                                                  await _recorder.start();
                                                },
                                                onLongPressEnd: (end) async {
                                                  isRecording=false;
                                                  setState(() {

                                                  });



                                                  /*var uri =  Uri.parse('http://edusupportapp.com/api/create_update_spelling_questions.php');
                                                  var request = http.MultipartRequest('POST', uri)
                                                    ..fields['user'] = 'nweiz@google.com'
                                                    ..files.add(await http.MultipartFile.fromPath(
                                                      'fileToUpload', result.path,
                                                    ));

                                                  var response = await request.send();
                                                  if (response.statusCode == 200) print('Uploaded!');*/
                                                },
                                                child: Icon(isRecording?Icons.mic:Icons.mic_off,color: isRecording? Colors.green:Colors.grey,size: 50,)

                                            )
                                            /*IconButton(
                                              icon: Icon(Icons.mic),
                                              onPressed: startListening,
                                              color: Colors.blue,),
                                            /*Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.microphone]);
                                                if (_isAvailable && !_isListening)
                                                  _speechRecognition
                                                      .listen(locale: "en_US")
                                                      .then((result) => print('$result'));*/

                                            IconButton(
                                              icon: Icon(Icons.cancel),
                                              onPressed: stopListening,
                                              color: Colors.red,),*/


                                          ],
                                        ),

                                        /*Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.8,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(6.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.0,
                                            horizontal: 12.0,
                                          ),
                                          child: Text(
                                            lastWords,
                                            style: TextStyle(fontSize: 24.0),
                                          ),
                                        ),*/

                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),),
              /*Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Text("Use Text to Speech",style: TextStyle(fontWeight: FontWeight.bold),),
                      /*Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        child: Text(
                          lastWords,
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),*/
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25,bottom: 40),
                    child: SizedBox(width: 100,
                      child: GradientButtonText(ButtonClick: (){
                        Navigator.of(context).pop();
                      },
                        linearGradient:LinearGradient(colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                        text: Text("Quit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:20,top: 25,bottom: 40),
                    child: SizedBox(width: 100,
                      child: GradientButtonText(
                        ButtonClick: (){
                          SaveSpellingQuestion();
                        },
                        linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                        text: Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                  ),




                ],

              ),
              /* Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 5),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Add Questions ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: GlobalData.lightblue),
                      ),
                      Icon(
                        Icons.add_circle,
                        color: GlobalData.lightblue,
                        size: 22,
                      )
                    ],
                  ),
                  onTap: () {
                    //setalldetails();SaveQuiz();
//                          Navigator.of(context)
//                              .pushNamed(
//                              'questions');
                  },
                ),
              ),*/
            ],),
          ),
        ),
      ),//Text("Speech recognition unavailable"),
    );
  }

// user defined function
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
  SaveSpellingQuestion()async {
    if (QuestionName.text.toString() == "" || Points.text.toString() == "" ||
        //lastWords.toString() == ""&&
            trueanswer.text.toString()==""  ) {
      //_showDialog();
      CustomShowDialog(context,msg: "Some Values are Missing",title:
      "Value Missing");
    }else{

      print( "question "+ QuestionName.text.toString()+
          "point_awarded "+ Points.text.toString()+
          "spelling_id "+ GlobalData.spellingid+
         // "answer_options " + lastWords.toString()+
          "answer_options " + trueanswer.text.toString());



      var result = await _recorder.stop();
      print(result.path);
      var file = File(result.path);
      List<int> audiobytes = file.readAsBytesSync();
      String base64Image = base64Encode(audiobytes);

      http.post(
          "http://edusupportapp.com/api/create_update_spelling_questions.php", body: {
        "question": QuestionName.text.toString(),
        "point_awarded": Points.text.toString(),
        "question_id":GlobalData.Edit_spelling_Questions.id.toString(),
        "spelling_id": GlobalData.spellingid,
        "answer_options": trueanswer.text.toString(),
        "audio":base64Image,
        //"answer_options": lastWords.isEmpty?trueanswer.text.toString():lastWords,
        "level_no": ((GlobalData.QuestionNumber/int.parse(GlobalData.spellNosofQuesPerLevel)).floor()+1).toString(),
        "ques_no": ((GlobalData.QuestionNumber%int.parse(GlobalData.spellNosofQuesPerLevel))+1).toString(),
      }).then((response) {
        var statuss = jsonDecode(response.body);

        //Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('spellingquestionlist');
      });
    }
  }


/*
  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(onResult: resultListener );
    setState(() {

    });
  }

  void stopListening() {
    speech.stop();
    setState(() {

    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {

    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}";
      //lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void errorListener(SpeechRecognitionError error ) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }
  void statusListener(String status ) {
    setState(() {
      lastStatus = "$status";
    });
  }*/

}