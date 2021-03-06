import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:newpro/global.dart';
import 'package:http/http.dart' as http;


class ManageAccount extends StatefulWidget {
  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {


  var publicKey = 'pk_live_8907cc11a42252d0f7bf8bf1e6a3fe1191dcaddb';
  String price;

  @override
  void initState() {

    print("se " + GlobalData.uid);
    // TODO: implement initState
    PaystackPlugin.initialize(publicKey: publicKey);
    super.initState();
    if(GlobalData.userType=="student")
      {price="50000";
      }else{
      price="500000";
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: false,
      backgroundColor: Color(0Xff1F0BE6),


      title: Center(
        child: Text(
          "Subscription",
          style: TextStyle(fontSize: 22),
        ),
      ),
      flexibleSpace: Container(
        decoration: bg12,
      ),
      actions: <Widget>[
        IconButton(onPressed: (){
          if(GlobalData.userType=="student"){

            Navigator.of(context).pushReplacementNamed('GlobalDashboard');
          }
          else{
            Navigator.of(context).pushReplacementNamed('dashboard');

          }
        },
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white,
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
           GlobalData.MyMembership.isActive?
           Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(


                  child: Column(children: <Widget>[
                    Text(
                      'Already Subscribed',
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
                                  child: Text("Membership Ends on ${GlobalData.MyMembership.enddate.add(Duration(days: 365)).toString()}",textAlign: TextAlign.center,style:
                                  TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                             ]
                            )

                        ),



                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ):
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


                    GlobalData.userType=="student"?
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
                            Text("Rate : N"+(int.parse(price)/100).toString() +" /Annum.",style: TextStyle(color: Colors.white,
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
                              onPressed: () async {


                                  print(GlobalData.email);
                                  String AccessCode;
                                  String ref = DateTime.now().year.toString() +
                                      DateTime.now().month.toString() +
                                      DateTime.now().day.toString() +
                                      DateTime.now().hour.toString() +
                                      DateTime.now().minute.toString() +
                                      DateTime.now().second.toString();
                                  print(ref);

                                  await http.post("https://api.paystack.co/transaction/initialize",
                                      headers: {
                                        HttpHeaders.authorizationHeader:
                                        "Bearer sk_live_584ccdb42801858da3582a730f9d07ab276ed854"
                                      },
                                      body: {
                                        "amount": price,
                                        "email": GlobalData.email,
                                        "reference": ref
                                      }).then((res) {
                                    print(res.body);
                                    var ParsedJson = jsonDecode(res.body);
                                    AccessCode = ParsedJson['data']['access_code'];
                                    print(AccessCode);
                                  });
                                  Charge charge = Charge()
                                    ..amount = int.parse(price)
                                  // ..reference = "ajsdfnjasdfas"
                                    ..accessCode = AccessCode
                                    ..email = GlobalData.email;
                                  CheckoutResponse response = await PaystackPlugin.checkout(
                                    context,
                                    charge: charge,
                                  );
                                  print("Status: "+ response.status.toString());
                                  print("Verify: "+ response.verify.toString());
                                  print("Refrence: "+ response.reference);
                                  print("Refrence: "+ response.reference);

                                  if(response.status==true) {
                                    http.post(
                                        GlobalData.applink+"membership.php",
                                        body: {
                                          "uid": GlobalData.uid,
                                          "months": 12.toString(),
                                          "refrence":response.reference
                                        }).then((response) async {
                                      var ParsedJson = jsonDecode(response.body);
                                      print(""+ response.body.toString());

                                      if(ParsedJson['membershipdata']==false)
                                      {


                                        GlobalData.MyMembership = Membership(
                                            id: 0.toString(),
                                            enddate: DateTime.now(),
                                            isActive: false);
                                        setState(() {

                                        });

                                      }else {

                                        GlobalData.MyMembership = Membership(
                                            id: ParsedJson['membershipdata']['ID'],
                                            enddate: DateTime.parse(ParsedJson['membershipdata']['date']),
                                            isActive: ParsedJson['membershipdata']['is_active']);
                                        setState(() {

                                        });
                                      }

                                    });
                                  }


                              },
                              child: Text(
                                'Pay',
                                textAlign: TextAlign.center,
                                style: TextStyle(color:Colors.white,fontSize: 18,fontFamily:"yu"),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                        :

                    GlobalData.userType=="admin_teacher"?
                    Column(
                      children: <Widget>[
                        Container(

                            child:Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Please Subscribe to access more features.",textAlign: TextAlign.center,style:
                                  TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                                Text("Rate : N"+(int.parse(price)/100).toString() +" /Annum.",style: TextStyle(color: Colors.white,
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
                              onPressed: () async {


                                print(GlobalData.email.trim()+"email");
                                String AccessCode;
                                String ref = DateTime.now().year.toString() +
                                    DateTime.now().month.toString() +
                                    DateTime.now().day.toString() +
                                    DateTime.now().hour.toString() +
                                    DateTime.now().minute.toString() +
                                    DateTime.now().second.toString();
                                print(ref);

                                await http.post("https://api.paystack.co/transaction/initialize",
                                    headers: {
                                      HttpHeaders.authorizationHeader:
                                      "Bearer sk_live_584ccdb42801858da3582a730f9d07ab276ed854"
                                    },
                                    body: {
                                      "amount": price,
                                      "email": GlobalData.email,
                                      "reference": ref
                                    }).then((res) {
                                  print(res.body);
                                  var ParsedJson = jsonDecode(res.body);
                                  AccessCode = ParsedJson['data']['access_code'];
                                  print("Accesscode: " + AccessCode);
                                });
                                Charge charge = Charge()
                                  ..amount = int.parse(price)
                                // ..reference = "ajsdfnjasdfas"
                                  ..accessCode = AccessCode
                                  ..email = GlobalData.email;
                                CheckoutResponse response = await PaystackPlugin.checkout(
                                  context,
                                  charge: charge,
                                );
                                print("Status: "+ response.status.toString());
                                print("Verify: "+ response.verify.toString());
                                print("Refrence: "+ response.reference);
                                print("Refrence: "+ response.reference);

                                if(response.status==true) {
                                  http.post(
                                      GlobalData.applink+"membership.php",
                                      body: {
                                        "uid": GlobalData.uid,
                                        "months": 12.toString(),
                                        "refrence":response.reference
                                      }).then((response) async {
                                    var ParsedJson = jsonDecode(response.body);
                                    print(response.body.toString());

                                    if(ParsedJson['membershipdata']==false)
                                    {


                                      GlobalData.MyMembership = Membership(
                                          id: 0.toString(),
                                          enddate: DateTime.now(),
                                          isActive: false);
                                      setState(() {

                                      });

                                    }else {

                                      GlobalData.MyMembership = Membership(
                                          id: ParsedJson['membershipdata']['ID'],
                                          enddate: DateTime.parse(ParsedJson['membershipdata']['date']),
                                          isActive: ParsedJson['membershipdata']['is_active']);
                                      setState(() {

                                      });
                                    }

                                  });
                                }


                              },
                              child: Text(
                                'Pay',
                                textAlign: TextAlign.center,
                                style: TextStyle(color:Colors.white,fontSize: 18,fontFamily:"yu"),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                      :
                    Column(
                      children: <Widget>[
                        Container(

                            child:Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("You cannot set more than 10 questions. Please contact your Admin to Subscribe for the institution's account.",textAlign: TextAlign.center,style:
                                  TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                                Text("Rate : N"+(int.parse(price)/100).toString() +" /Annum.",style: TextStyle(color: Colors.white,
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



                      ],
                    )
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
