import 'package:flutter/material.dart';

import 'global.dart';

class SpellingLevelLists extends StatefulWidget {
  @override
  _SpellingLevelListsState createState() => _SpellingLevelListsState();
}

class _SpellingLevelListsState extends State<SpellingLevelLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),
        backgroundColor: GlobalData.darkpurple,
      automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
              onTap: (){


                if(GlobalData.userType=="student" && GlobalData.isGlobal==true)
                  {
                    Navigator.of(context).pushReplacementNamed('GlobalResults');

                }
                else if(GlobalData.userType=="student" && GlobalData.isGlobal==false)
                  {
                 // Navigator.of(context).pushReplacementNamed('spellingresult');

                    Navigator.pop(context);
                  }
                else{
                  Navigator.of(context).pushReplacementNamed('spellinglevel');

                }


              },child: Icon(Icons.exit_to_app))


        ],),
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
                        'ManageAccount':'spellinganswerlog');
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
