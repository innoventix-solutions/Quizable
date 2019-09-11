import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class trialsubscription extends StatefulWidget {
  @override
  _trialsubscriptionState createState() => _trialsubscriptionState();
}

class _trialsubscriptionState extends State<trialsubscription> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
          backgroundColor: Color(0Xff1F0BE6)),
      body:
      Container(
        decoration: BoxDecoration(color: GlobalData.bgblue),
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: new Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Center(child: Padding(
                                padding: const EdgeInsets.only(top:15),

                                child: Text('Trial Subscription',textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                              )),


                              new Divider(
                                color: Colors.blue,
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: <Widget>[
                                    Text('You have completed your Admin Account setup on Edusupport and your one month free trial subscription has started running.'
                                        '\n\nYou can add up to 6 Classrooms per institution for this Admin Account.'
                                        'Use the Manage my Account button in your Profile slider to renew your Account Subscription',
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          fontSize: 15,color: GlobalData.black),textAlign: TextAlign.center,),

                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton(color: Colors.blue,shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                                      onPressed: (){
                                        GlobalData.userType="admin_teacher";
                                        Navigator.of(context)
                                            .pushNamed('accouttypeselect');
                                      },child: Text('Login',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),),

                                  ],
                                ),
                              )],

                          ),

                        ),



                      ],


                    ),
                  ),
                ),
              ),
            ),
          ], ),
      ),  );
  }
}
