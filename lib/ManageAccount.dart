import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpro/global.dart';


class ManageAccount extends StatefulWidget {
  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: true,
      backgroundColor: Color(0Xff1F0BE6),


      title: Center(
        child: Text(
          "SubScription",
          style: TextStyle(fontSize: 22),
        ),
      ),
      flexibleSpace: Container(
        decoration: bg12,
      ),
      actions: <Widget>[
        IconButton(onPressed: (){},
          icon: Icon(
            Icons.account_circle,
            color: Colors.transparent,
            size: 20,
          ),
        ),
      ],
    ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(


                  child: Column(children: <Widget>[
                    Text(
                      'Subscription Required',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize:26,fontFamily: "yu", decoration: TextDecoration.underline),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10,bottom: 20)),
                    Column(
                      children: <Widget>[
                        Container(

                          child:Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Please Subscribe To Attempt Next Level.",textAlign: TextAlign.center,style:
                                  TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            Text("Rate : N500 /Annum.",style: TextStyle(color: Colors.white,
                            fontSize: 18),)],
                          ) /*RaisedButton(padding:EdgeInsets.only(top:15,bottom: 15),
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {

                            },
                            child: Text(
                              'Annual subscription  -\n  @N500 /Annum.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color:Colors.white,fontSize: 18,fontFamily:"yu"),
                            ),
                          ),*/
                        ),
                      /*  Padding(padding: EdgeInsets.all(9)),
                        Container(

                          child: RaisedButton(padding:EdgeInsets.only(left:90,right: 90,top:15,bottom: 15),
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {

                            },
                            child: Text(
                              '6 Months - @149',
                              textAlign: TextAlign.center,
                              style: TextStyle(color:Colors.white,fontSize: 18,fontFamily:"yu"),
                            ),
                          ),*/
                        /*),*/

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(

                            child: RaisedButton(padding:EdgeInsets.only(left:90,right: 90,top:15,bottom: 15),
                              color: Colors.blue,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () {

                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'OK',
                                textAlign: TextAlign.center,
                                style: TextStyle(color:Colors.white,fontSize: 18,fontFamily:"yu"),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
