import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'global.dart';

class SpellingLevelLists extends StatefulWidget {
  @override
  _SpellingLevelListsState createState() => _SpellingLevelListsState();
}

class _SpellingLevelListsState extends State<SpellingLevelLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),),
      body: ListView.builder(
          itemCount: int.parse(GlobalData.spellLevels),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: (){

                  if(GlobalData.userType=="student"){
                    GlobalData.CurrentLevel=(index+1);
                    Navigator.of(context).pushNamed(
                        GlobalData.isGlobal==true && index>0 && GlobalData.MyMembership.isActive==false?
                        'ManageAccount':'AnswerLog');
                    // Navigator.of(context).pushNamed('AnswerLog');
                  }
                  else{
                    GlobalData.CurrentLevel=(index+1);

                    Navigator.of(context).pushNamed('spellingquestionlist');
                  }

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
