import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'global.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io' as io;
import 'package:flutter_tts/flutter_tts.dart';


class setspellque extends StatefulWidget {
  @override
  _setspellqueState createState() => _setspellqueState();
}

class _setspellqueState extends State<setspellque> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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


  FlutterTts Tts = new FlutterTts();

  Future temp() async {

    List<dynamic> languages = await Tts.getLanguages;

    await Tts.setLanguage("en-IN");

    await Tts.setSpeechRate(1.0);

    await Tts.setVolume(1.0);

    await Tts.setPitch(0.8);

    await Tts.isLanguageAvailable("en-IN");
  }

  Future _speak(String Value) async{
    var result = await Tts.speak(Value);

  }

  Future _stop() async{
    var result = await Tts.stop();

  }

  bool _isVisible = true;


  bool _canShowButton = true;

  bool buttonclick = false;

  onclick(){
    if(buttonclick=true){

      SaveSpellingQuestion();

    }
    else{
      Show_toast("Not allowed", Colors.red);
    }

  }

  TextEditingController QuestionName = new TextEditingController();
  TextEditingController Points = new TextEditingController();
  TextEditingController trueanswer = new TextEditingController();


  String base64Image = "";
  var file;
  String audiopath;
  bool _hasSpeech = false;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  final SpeechToText speech = SpeechToText();
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

  FlutterAudioRecorder _recorder;
  bool isRecording=false;

  AudioPlayer audioPlayer = new AudioPlayer();
  AudioCache audioCache = new AudioCache();
  bool isPlaying = false;
  bool isStarted = false;



  playrecord()async{
    //await audioPlayer.play(Questions[i].audio_file);
    if(audiopath==""){
      Show_toast("No Audio File", Colors.red);
    }
    else{



      await audioPlayer.play(audiopath.toString());
      setState(() {

      });
    }
    print(audiopath);
  }

  startPlaying()async{
    await audioCache.play("audio/beep-06.mp3");

    setState(() {

    });

  }

  endplaying()async{
    await
    audioCache.play("audio/beep-07.mp3");

    setState(() {

    });
  }



  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSpeechRecognizer();
    initSpeechState();
  }



  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(onError: errorListener, onStatus: statusListener );

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }
  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
            (bool result) => setState(() => _isAvailable = result));

    _speechRecognition.setRecognitionStartedHandler(() =>
        setState(() => _isListening = true));

    _speechRecognition.setRecognitionResultHandler((String speech) =>
        setState(() => resultText = speech));

    _speechRecognition.setRecognitionStartedHandler(() =>
        setState(() => _isListening = false));

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
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
    return Scaffold( key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Set Spelling Bee Exercise",
            style: TextStyle(fontSize: 16),
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


      //drawer:
      //drawerquiz(),


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
                                "Word Spell " + ((GlobalData.QuestionNumber%int.parse(GlobalData.spellNosofQuesPerLevel))+1).toString()+" of "+GlobalData.spellNosofQuesPerLevel,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),color:GlobalData.green,
                            child:  Text("Level "+((GlobalData.QuestionNumber/int.parse(GlobalData.spellNosofQuesPerLevel)).floor()+1).toString()//+" of "+GlobalData.QuizLevels,
                                ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold))
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
                                child: TextField(keyboardType: TextInputType.visiblePassword,controller:trueanswer,decoration: InputDecoration(
                                    border: InputBorder.none,hintText: "Insert correct spelling"
                                ),style: TextStyle(fontSize: 24.0,),
                                ),


                              ),


                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.play_arrow,size: 30,
                                      color: Colors.green,),
                                    onPressed: (){
                                      if(trueanswer.text.toString()==""){
                                        Show_toast("No audio", Colors.red);
                                      }
                                      else{
                                        _speak(trueanswer.text.toString());

                                      }
                                    },
                                    color: Colors.red,),

                                  IconButton(
                                    icon: Icon(Icons.cancel,size: 30,
                                      color: Colors.red,),
                                    onPressed: (){
                                      trueanswer.clear();
                                      Show_toast("Audio deleted", Colors.red);
                                    },
                                    color: Colors.red,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Note: The word displayed in the speech to text tab is a guide, student’s answer will be matched with the spelling you provided in the box.",
                                  style: TextStyle(color: Colors.red),),
                              )
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


              Container(child:


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
                                            Expanded(child: Text("Audio/Voice recorder",
                                              style: TextStyle(color: Colors.black,
                                                  fontWeight: FontWeight.bold),)),


                                            Icon(audiopath==null||audiopath==""?Icons.clear:Icons.check,color: audiopath==null||audiopath==""?Colors.grey:Colors.amber,size: 30,)

                                          ],
                                        ),


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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[

                        Expanded(child: Text("Long Press to record audio")),



                        GestureDetector(
                            onLongPressStart: (start) async {

                              if(lastWords==""){
                                //SystemSound.play(SystemSoundType.click);
                                //HapticFeedback.vibrate();
                                startPlaying();
                                isRecording=true;
                                Show_toast("Recording Start", Colors.green);

                                // audioCache.play("assets/audio/beep-06.mp3");
                                setState(() {

                                });

                                if(await FlutterAudioRecorder.hasPermissions){
                                  String customPath = '/flutter_audio_recorder_';
                                  io.Directory path;

                                  if(io.Platform.isIOS)
                                  {
                                    path =  await getApplicationDocumentsDirectory();
                                  }
                                  else{
                                    path =await getApplicationSupportDirectory();

                                  }
                                  customPath = path.path +
                                      customPath +
                                      DateTime.now().millisecondsSinceEpoch.toString();

                                  print("path audio: " + path.path.toString());

                                  _recorder = FlutterAudioRecorder("${customPath}.mp3"); // .wav .aac .m4a
                                  await _recorder.initialized;
                                  await _recorder.start();
                                }

                                else{
                                  Show_toast("Please allow audio permission", Colors.green);
                                }
                              }
                              else{
                                Show_toast("Please clear speech to text", Colors.red);
                              }
                            },
                            onLongPressEnd: (end) async {

                              if(lastWords=="")
                              {
                                isRecording=false;
                                Show_toast("Recording Ends", Colors.green);
                                endplaying();
                                setState(() {

                                });
                                var result = await _recorder.stop();
                                print("resultaudio: " + result.path);
                                audiopath= result.path;
                                file = File(result.path);
                                List<int> audiobytes = file.readAsBytesSync();
                                base64Image = base64Encode(audiobytes);
                                print("base64: " + base64Image);
                                /*FlutterClipboard.copy('base64Image').then((value) =>
                                print('base64Image'));
                                FlutterClipboard.paste().then((value) {
                                  // Do what ever you want with the value.
                                  setState(() {
                                    QuestionName.text = value;

                                  });
                                });*/
                              }
                              else{
                                Show_toast("Please clear speech to text", Colors.red);

                              }

                              /*var uri =  Uri.parse('http://edusupportapp.com/api/create_update_spelling_questions.php');
                                                    var request = http.MultipartRequest('POST', uri)
                                                      ..fields['user'] = 'nweiz@google.com'
                                                      ..files.add(await http.MultipartFile.fromPath(
                                                        'fileToUpload', result.path,
                                                      ));

                                                    var response = await request.send();
                                                    if (response.statusCode == 200) print('Uploaded!');*/
                            },
                            child: Icon(isRecording?Icons.mic:Icons.mic_off,
                              color: isRecording? Colors.green:Colors.grey,size: 30,)


                        ),
                        GestureDetector(onTap: (){
                          print(audiopath);
                          print(file);
                          audiopath="";
                          file="";
                          setState(() {

                          });
                          Show_toast("Audio deleted", Colors.red);
                        },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Icon(Icons.cancel,color:Colors.red,size: 30,),
                          ),
                        ),


                        GestureDetector(onTap:(){
                          playrecord();
                          setState(() {

                          });
                        },child: Icon(Icons.play_arrow,color:Colors.green,size: 30,))
                      ],),
                    )
                  ],
                ),)



              ),

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
                        Navigator.of(context).pushNamed('previewspelling');
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
                        ButtonClick: ()async{

                          if (QuestionName.text.toString() == "" || Points.text.toString() == "" ||
                              //lastWords.toString() == "" &&
                              trueanswer.text.toString()=="" ) {
                            //_showDialog();
                            CustomShowDialog(context,msg: "Some Values are Missing",title:
                            "Value Missing");
                          }
                          else{
                          savingquestion(context);
                          //buttonclick=true;
                         // setState(() {

                          //});
                         //await onclick();
                          //print("buttonclick save: " + buttonclick.toString());


                          SaveSpellingQuestion();}
                        },
                        linearGradient:LinearGradient(colors: <Color>[GlobalData.greya,GlobalData.pink]) ,
                        text: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
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

  SaveSpellingQuestion()async {

    if (QuestionName.text.toString() == "" || Points.text.toString() == "" ||
        //lastWords.toString() == "" &&
        trueanswer.text.toString()=="" ) {
      //_showDialog();
      CustomShowDialog(context,msg: "Some Values are Missing",title:
      "Value Missing");
    }
    else{

      print( "question "+ QuestionName.text.toString()+
          "point_awarded "+ Points.text.toString()+
          "spelling_id "+ GlobalData.spellingid+
          // "answer_options " + lastWords.toString()+
          "answer_options " + trueanswer.text.toString());




     await http.post(
         GlobalData.applink+"create_update_spelling_questions.php", body: {
        "question": QuestionName.text.toString(),
        "point_awarded": Points.text.toString(),
        "spelling_id": GlobalData.spellingid,
        "answer_options": trueanswer.text.toString().trim(),
        "audio":base64Image,
        //"answer_options": lastWords.isEmpty?trueanswer.text.toString():lastWords,
        "level_no": ((GlobalData.QuestionNumber/int.parse(GlobalData.spellNosofQuesPerLevel)).floor()+1).toString(),
        "ques_no": ((GlobalData.QuestionNumber%int.parse(GlobalData.spellNosofQuesPerLevel))+1).toString(),
      }).then((response) async{
        var statuss = jsonDecode(response.body);


        print(response.body.toString());
        //    print(response.body.toString());
        if (statuss['status'] == 1) {
          //lastWords="";
          trueanswer.clear();
          QuestionName.clear();
          Points.clear();
          GlobalData.QuestionNumber++;
          audiopath="";
          setState(() {

          });
        } else{

        }
        if(GlobalData.QuestionNumber%(int.parse(GlobalData.spellNosofQuesPerLevel))==0&&(GlobalData.QuestionNumber!=0))
        {
          Navigator.of(context).pushNamed('spellinglevel');
        }else {

          Navigator.of(context).pushReplacementNamed('spellque');
        }
        buttonclick=false;

        setState(() {

        });
        print("buttonclick: "+buttonclick.toString());
      });

    }





  }



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
    lastWords="";
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
  }
}

