import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'global.dart';

class LevelsLists extends StatefulWidget {
  @override
  _LevelsListsState createState() => _LevelsListsState();
}

class _LevelsListsState extends State<LevelsLists> {
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

             if(GlobalData.userType=="student"){
               GlobalData.CurrentLevel=(index+1);
               Navigator.of(context).pushNamed(
                   GlobalData.isGlobal==true && index>0 && GlobalData.MyMembership.isActive==false?
                   'ManageAccount':'AnswerLog');
              // Navigator.of(context).pushNamed('AnswerLog');
             }
             else{
               GlobalData.CurrentLevel=(index+1);

               Navigator.of(context).pushNamed('Question_List');
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
