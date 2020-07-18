import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'global.dart';

class PreviewLevelsLists extends StatefulWidget {
  @override
  _PreviewLevelsListsState createState() => _PreviewLevelsListsState();
}

class _PreviewLevelsListsState extends State<PreviewLevelsLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),
          backgroundColor:GlobalData.darkpurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacementNamed('previewQuiz');


              },child: Icon(Icons.exit_to_app))


        ],),
      body: ListView.builder(
          itemCount: int.parse(GlobalData.QuizLevels),
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

                    Navigator.of(context).pushNamed('previewQuizquestionlist');
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
