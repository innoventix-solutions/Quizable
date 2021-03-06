import 'package:flutter/material.dart';

import 'global.dart';

class PreviewSpellingLevelListss extends StatefulWidget {
  @override
  _PreviewSpellingLevelListssState createState() => _PreviewSpellingLevelListssState();
}

class _PreviewSpellingLevelListssState extends State<PreviewSpellingLevelListss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),
        backgroundColor: GlobalData.darkpurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacementNamed('previewspelling');

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

                    Navigator.of(context).pushNamed('previewspellingquestionslist');
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
