//import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class TestingArun extends StatefulWidget {
  @override
  _TestingArunState createState() => _TestingArunState();
}

class _TestingArunState extends State<TestingArun> {

  FlutterAudioRecorder _recorder;
  bool isRecording=false;
  //AudioPlayer audioPlayer ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  setRecorder() async {
    bool hasPermission = await FlutterAudioRecorder.hasPermissions;
    var path =await getApplicationSupportDirectory();

    Fluttertoast.showToast(msg:path.path.toString());
    print(path.path.toString());

    _recorder = FlutterAudioRecorder("${path.path.toString()}/${DateTime.now().toIso8601String().toString()}.mp4"); // .wav .aac .m4a
    await _recorder.initialized;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onLongPressStart: (start) async {

                  await setRecorder();

                  isRecording=true;
                  setState(() {

                  });

                  await _recorder.start();
                },
                onLongPressEnd: (end) async {
                  isRecording=false;
                  setState(() {

                  });
                  var result = await _recorder.stop();
                  print(result.path);
                  Fluttertoast.showToast(msg:result.path.toString());

                  var uri = Uri.parse('http://innoventixsolutions.com/test/upload.php');
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