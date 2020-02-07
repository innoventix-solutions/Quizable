import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: audiorecords(title: 'Flutter Demo Home Page'),
    );
  }
}

class audiorecords extends StatefulWidget {
  audiorecords({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _audiorecordsState createState() => _audiorecordsState();
}

class _audiorecordsState extends State<audiorecords> {
  FlutterAudioRecorder _recorder;
  bool isRecording=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  var result = await _recorder.stop();
                  print(result.path);


                  var uri =  Uri.parse('http://innoventixsolutions.com/test/upload.php');
                  var request = http.MultipartRequest('POST', uri)
                    ..fields['user'] = 'nweiz@google.com'
                    ..files.add(await http.MultipartFile.fromPath(
                      'fileToUpload', result.path,
                    ));

                  var response = await request.send();
                  if (response.statusCode == 200) print('Uploaded!');
                },
                child: Icon(isRecording?Icons.mic:Icons.mic_off,color: isRecording? Colors.green:Colors.grey,size: 100,)

            )
            ,

          ],
        ),
      ),
    );
  }
}
