import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
class screen9 extends StatefulWidget {
  @override
  _screen9State createState() => _screen9State();
}

class _screen9State extends State<screen9> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
        decoration: bg,
    child:Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Container(height: 300,width: 320,
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

                        child: Text('Teacher Option',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15),),
                      )),


                      new Divider(
                        color: Colors.blue,
                      ),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('As a Teacher, you can join existing classes ',textAlign: TextAlign.center,),
                        ),
                          Text('by Teacher Admin invitation, then you can '),
                          Text('add students to the class and set tasks for '),
                          Text('your classroom members.  '),
                      ],
                    ),
                      Padding(
                        padding: const EdgeInsets.only(top:30),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('But if you want to create a new class, you'),
                            Text('will need to sign up for an Admin account.'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30,bottom: 10),
                        child: Text('Do you want to set up Admin Account?'),
                      ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(color: Colors.blue,shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                          onPressed: (){},child: Text('Admin',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: RaisedButton(color: Colors.redAccent,shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                            onPressed: (){},child: Text('Teacher',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),),
                        ),
                      ],
                    )],

                  ),

                ),



              ],


          ),
    ),
                ),
    ),
   ], ),
        ),  );
  }
}
