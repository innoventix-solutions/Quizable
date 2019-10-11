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


  var publicKey = 'pk_test_f6536a3fc6b3326aaa00afc70898e075b4fd1c00';
  String price;

  @override
  void initState() {
    // TODO: implement initState
    PaystackPlugin.initialize(publicKey: publicKey);
    super.initState();
    if(GlobalData.userType=="admin_teacher")
      {price="500000";
      }else{
      price="50000";
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: true,
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
           GlobalData.MyMembership.isActive?Center(
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
                                  child: Text("Membership Ends on ${GlobalData.MyMembership.enddate}",textAlign: TextAlign.center,style:
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
          ):Center(
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
                                        "Bearer sk_test_ed1fa4cef818023148a44bf20c91e085787301e7"
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
                                  print(response.reference);

                                  if(response!=null) {
                                    http.post(
                                        "http://edusupportapp.com/api/membership.php",
                                        body: {
                                          "uid": GlobalData.uid,
                                          "months": 12.toString(),
                                          "refrence":response.reference
                                        }).then((response) async {
                                      var statuss = jsonDecode(response.body);
                                      print(response.body.toString());
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
