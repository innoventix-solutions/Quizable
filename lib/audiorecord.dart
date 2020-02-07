import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';
import 'dart:io';

import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class audio extends StatefulWidget {
  audio({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _audioState createState() => _audioState();
}

class _audioState extends State<audio> {
  FlutterAudioRecorder _recorder;
  Recording _recording;
  Timer _t;
  Widget _buttonIcon = Icon(Icons.do_not_disturb_on);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _prepare();
    });
  }

  String image64 = "";
  File _image;
  Future getImage() async {
    var file = await _recording?.path;

    setState(() {});
  }

  void _opt() async {
    switch (_recording.status) {
      case RecordingStatus.Initialized:
        {
          await _startRecording();
          break;
        }
      case RecordingStatus.Recording:
        {
          await _stopRecording();
          break;
        }
      case RecordingStatus.Stopped:
        {
          await _prepare();
          break;
        }

      default:
        break;
    }

    // 刷新按钮
    setState(() {
      _buttonIcon = _playerIcon(_recording.status);
    });
  }

  Future _init() async {
    var hasPermission = await FlutterAudioRecorder.hasPermissions;
    if (hasPermission) {
      String customPath = '/flutter_audio_recorder_';
      io.Directory appDocDirectory;
      if (io.Platform.isIOS) {
        appDocDirectory = await getApplicationDocumentsDirectory();
      } else {
        appDocDirectory = await getExternalStorageDirectory();
      }

      // can add extension like ".mp4" ".wav" ".m4a" ".aac"
      customPath = appDocDirectory.path +
          customPath +
          DateTime.now().millisecondsSinceEpoch.toString();

      // .wav <---> AudioFormat.WAV
      // .mp4 .m4a .aac <---> AudioFormat.AAC
      // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.

      _recorder = FlutterAudioRecorder(customPath,
          audioFormat: AudioFormat.WAV, sampleRate: 22050);
      await _recorder.initialized;
    }
  }

  Future _prepare() async {
    await _init();
    var result = await _recorder.current();
    setState(() {
      _recording = result;
      _buttonIcon = _playerIcon(_recording.status);
    });
  }

  Future _startRecording() async {
    await _recorder.start();
    var current = await _recorder.current();
    setState(() {
      _recording = current;
    });

    _t = Timer.periodic(Duration(milliseconds: 10), (Timer t) async {
      var current = await _recorder.current();
      setState(() {
        _recording = current;
        _t = t;
      });
    });
  }

  Future _stopRecording() async {
    var result = await _recorder.stop();
    _t.cancel();

    setState(() {
      _recording = result;
    });
  }

  /*void _play() {
    AudioPlayer player = AudioPlayer();
    player.play(_recording.path, isLocal: true);
  }*/

  Widget _playerIcon(RecordingStatus status) {
    switch (status) {
      case RecordingStatus.Initialized:
        {
          return Icon(Icons.fiber_manual_record);
        }
      case RecordingStatus.Recording:
        {
          return Icon(Icons.stop);
        }
      case RecordingStatus.Stopped:
        {
          return Icon(Icons.replay);
        }
      default:
        return Icon(Icons.do_not_disturb_on);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("efs"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'File',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${_recording?.path}',
                style: Theme.of(context).textTheme.body1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Duration',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${_recording?.duration}',
                style: Theme.of(context).textTheme.body1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Metering Level - Average Power',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${_recording?.metering?.averagePower}',
                style: Theme.of(context).textTheme.body1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Status',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${_recording?.status}',
                style: Theme.of(context).textTheme.body1,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Play'),
                disabledTextColor: Colors.white,
                disabledColor: Colors.grey.withOpacity(0.5),
               /* onPressed: _recording?.status == RecordingStatus.Stopped
                    ? _play
                    : null,*/
              ),

              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('upload'),

                onPressed:(){_recording?.path;
                print(_recording?.path);}
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _opt,
        child: _buttonIcon,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

