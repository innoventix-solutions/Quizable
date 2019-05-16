import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Center(
          child: Text(
            "My Classrooms",
            style: TextStyle(fontSize: 22),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [darkblue, darkpurple],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
        body:new
        ListView.builder(
            //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),

            itemBuilder: (BuildContext ctxt, int index) {
              return  Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                          decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                        image:AssetImage('assets/images/bg.png'),
                      )
                  )
                      ),





                    Padding(
                     padding: const EdgeInsets.only(left:30),
                     child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Messih Class',style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                            Padding(
                              padding: const EdgeInsets.only(top:5),
                              child: Text('12 Students',style: TextStyle(fontSize: 10),),
                            ),
                        ],
                      ),
                    )
                    ], ),
                  new Divider(
                    color: Colors.black,
                  ), ],
              );
            }
        )
      ),
    );
  }
}
