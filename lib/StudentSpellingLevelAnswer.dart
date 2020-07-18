import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'global.dart';

class StudentsspellLevelsAnswer extends StatefulWidget {
  @override
  _StudentsspellLevelsAnswerState createState() => _StudentsspellLevelsAnswerState();
}

class _StudentsspellLevelsAnswerState extends State<StudentsspellLevelsAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),
      backgroundColor: GlobalData.darkpurple,),
      body: ListView.builder(
          itemCount: int.parse(GlobalData.spellLevels),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: (){


                  GlobalData.CurrentLevel=(index+1);

                  Navigator.of(context).pushNamed('spellinganswerlog');


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
