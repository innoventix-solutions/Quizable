import 'package:flutter/material.dart';

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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
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
                        "Question " /*${i+1} of ${Quetions.length}*/,
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
                        "Que",
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
                          child: Text(
                        /*Quetions[i].answer_type*/
                        "Question",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                            child: Text(
                              /*Quetions[i].point_awarded+*/ " Pts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
