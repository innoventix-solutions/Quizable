import 'package:flutter/material.dart';

import 'global.dart';

class StudentLevelList extends StatefulWidget {
  @override
  _StudentLevelListState createState() => _StudentLevelListState();
}

class _StudentLevelListState extends State<StudentLevelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),),
      body: Column(
        children: <Widget>[
          Text("Tap on Next Unlocked Level to Open Exercise"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                          itemCount: int.parse(GlobalData.QuizLevels),
                          itemBuilder: (c,i){
                            return Card(
                              child: LevelCards(),
                            );
                          })),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



class LevelCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
