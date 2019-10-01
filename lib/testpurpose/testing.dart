import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  bool isSuccessful=false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, snapshot) {
                  return Draggable(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("asdz"),
                      ),
                    ),
                    feedback: Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("asdewv"),
                      ),
                    ),
                    childWhenDragging: Container(),
                    data: "arun",
                  );
                }
              ),
            ),

            Expanded(
              child:ListView.builder(
              itemCount: 5,itemBuilder: (c,i){
                return DragTarget(
                  builder: (context, List<String> candidateData, rejectedData) {
                    return Center(
                      child: isSuccessful
                          ? Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: Container(
                          color: Colors.yellow,
                          height: 50.0,
                          width: 200.0,
                          child: Center(child:Text(candidateData.toString()))
                        ),
                      )
                          : Container(
                        height: 50.0,
                        width: 200.0,
                        color: Colors.yellow,
                      ),
                    );
                  },
                  onWillAccept: (data) {
                    print(data+"$i");
                    return true;
                  },
                  onAccept: (data) {

                    if(data=="arun")
                    {
                      print("accepted");
                    }else
                    {
                      print("not Accepting");
                    }

                    setState(() {
                      isSuccessful = true;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
