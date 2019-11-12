import 'package:flutter/material.dart';

import 'global.dart';

class spelling_ans extends StatefulWidget {
  @override
  _spelling_ansState createState() => _spelling_ansState();
}

class _spelling_ansState extends State<spelling_ans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spelling Challenge"),
        centerTitle: true,
      ),
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child:
        SingleChildScrollView(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Level " /*${Quetions[i].level_no.toString()}*/,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  color: Colors.brown,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Word Spell " /*${i+1} of ${Quetions.length}*/,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                child: Text(
                                  /*Quetions[i].question*/
                                  "Hint",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          )),
                    ],
                  ),
                ),
                // AnswerNow(Quetions[i].answer_type,Quetions[i].anwer_options,Quetions[i].Options,Quetions[i].question),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Word point",textAlign: TextAlign.center,style:
                                    TextStyle(fontWeight: FontWeight.bold),),
                                  ),

                                )),
                          )),
                    ],
                  ),
                ),

                Card(
                  child:TextField(textCapitalization: TextCapitalization.characters,

                    style: TextStyle(color: Colors.blue, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5),

                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                FlatButton.icon(shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),

                ),
                  color: Colors.blue,
                  icon: Icon(Icons.hearing,color: Colors.white,), //`Icon` to display
                  label: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
                    child: Text('Listen',style: TextStyle(fontSize: 20,color: Colors.white),),
                  ), //`Text` to display
                  onPressed: () {
                    //Code to execute when Floating Action Button is clicked
                    //...
                  },
                ),  ],
            ),
          ),
        ),
      ),


    );
  }
}
