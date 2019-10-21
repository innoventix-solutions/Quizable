import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'global.dart';

class StudentsLevelsAnswer extends StatefulWidget {
  @override
  _StudentsLevelsAnswerState createState() => _StudentsLevelsAnswerState();
}

class _StudentsLevelsAnswerState extends State<StudentsLevelsAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),),
      body: ListView.builder(
          itemCount: int.parse(GlobalData.QuizLevels),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: (){


                    GlobalData.CurrentLevel=(index+1);

                    Navigator.of(context).pushNamed('AnswerLog');


                },
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Level ${index+1}"),
                ),),
              ),
            );
          }),
    );
  }
}
