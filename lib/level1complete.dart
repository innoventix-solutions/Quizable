import 'package:flutter/material.dart';
import 'global.dart';



class level1 extends StatefulWidget {
  @override
  _level1State createState() => _level1State();
}

class _level1State extends State<level1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "Set Quiz Questions",
            style: TextStyle(fontSize: 20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [GlobalData.darkblue, GlobalData.darkpurple],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[

              Container(
                child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child:
                          levelcomplete(color: GlobalData.blue,heading: "Level " +((GlobalData.QuestionNumber/int.parse(GlobalData.NosofQuesPerLevel)).floor()).toString()+ " Completed",
                            paragraph: "Congratulations! You have completed the questions for Level " +((GlobalData.QuestionNumber/int.parse(GlobalData.NosofQuesPerLevel)).floor()).toString()+ " Quiz. Use the Next button to continue to set questions for Level " + ((GlobalData.QuestionNumber/int.parse(GlobalData.NosofQuesPerLevel)).floor()+1).toString()+ " Quiz.",)

                        ),


                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[GlobalData.QuestionNumber>=(int.parse(GlobalData.NosofQuesPerLevel)*int.parse(GlobalData.QuizLevels))?


                            Expanded(

                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25,bottom: 40),
                                    child: GradientButtonText(ButtonClick: (){
                                      Navigator.of(context).pushReplacementNamed('Recentque');
                                      ClearRegisterData();
                                      setState(() {

                                      });

                                    },
                                      linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                                      text: Text("Publish",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                                        textAlign: TextAlign.center,),
                                    ),
                                  ),
                                ),

                            ):
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25,bottom: 40),
                                  child: GradientButtonText(ButtonClick: (){
                                    Navigator.of(context).pushReplacementNamed('questions');
                                  },
                                    linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                                    text: Text("Next Level",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
                                      textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            )


                          ],

                          ),
                        ),
                      ],
                    )),
              ),



            ],),
        ),
      ),


    );
  }
}
