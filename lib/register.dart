import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'utilities.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class sec extends StatefulWidget {


  @override
  _secState createState() => _secState();
}

class _secState extends State<sec> {

  String image64 = "";
  File _image;

  Future getImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight:  200 , maxWidth: 200);
    _image = file;
    List<int> imagebytes = await file.readAsBytesSync();
    image64 = await base64.encode(imagebytes);
    setState(() {});
  }


  void savingquestion(BuildContext context)  {

    bool Selected = false;

    showDialog(barrierDismissible: false,
        context: context,
        builder: (_) => new Dialog(
          child: new Container(
            alignment: FractionalOffset.center,
            height: 80.0,
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                  child: new Text("Creating..."),
                ),
              ],
            ),
          ),
        ));
  }




  TextEditingController acc = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cpass = new TextEditingController();
  TextEditingController disc = new TextEditingController();
  TextEditingController gender = new TextEditingController();





  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb	: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Signup() async {





    http.post(GlobalData.applink+"register.php",
        body: {

          "account_name": acc.text.toString(),
          "Username": username.text.toString(),
          "UserEmail": email.text.toString().trim(),
          "password": password.text.toString(),
          "phone_no": phone.text.toString(),
          "specification": disc.text.toString(),
          "birthdate": "11-11-12".toString(),
          "gender": gendersel.toString(),
          "user_type": GlobalData.userType,
          "parents_email": "asdf".toString(),
          "parents_phone_no": "sadf".toString(),
          //  "user_type":"student".toString(),
          "accout_type":GlobalData.accounttype==null?"basic school":GlobalData.accounttype,
          "image":image64,




        }).
    then((response) {

      print(response.body.toString());


      var statuss = jsonDecode(response.body);


      print("result from Server : "+statuss['status'].toString());

      if (statuss['status'].toString() == "1")
      {
        savingquestion(context);

        Show_toast("Registered Successfully", Colors.green);

        GlobalData.userType=="teacher" ? Navigator.of(context)
            .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false) :
        Navigator.of(context)
            .pushNamedAndRemoveUntil('trialsub', (Route<dynamic> route) => false);




      } else {
        Show_toast(statuss['msg'], Colors.red);
      }
    });



  }




  check() {
    bool emailValid = RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text.toString());
    if(emailValid == false){
      _showDialog1();
    }else if(phone.text.length>11 || phone.text.length<=9)
      {
        _showDialog(Msg: "Phone Number must contain 10 Or 11 digit");
      }

    else if(password.text.length<6){
      _showDialog(Msg: "Password must contain atleast 6 digit");
    }
      else if (password.text.toString() == cpass.text.toString()) {
        //savingquestion(context);
      Signup();
    } else {
      _showDialog();
    }


  }

  void _showDialog({String Msg}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(Msg==null?"Password not matched":Msg),
        );
      },
    );
  }

  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Email is incorrect"),
        );
      },
    );
  }



 String gendersel = "Male";


  GlobalData globalData = new GlobalData();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 25),
              child: Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: GlobalData.gray),
                      ),
                      GestureDetector(
                        onTap: (){getImage();},
                        child: Stack(
                          children: <Widget>[
                            Container(
                                height: 95,
                                width: 95,
                                margin: EdgeInsets.only(top: 10, bottom: 14),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image:_image!=null?  FileImage(_image): AssetImage('assets/images/quizable.png'),
                                    ))),
                            Positioned(
                              right: 5,bottom: 15,
                              child: Card(color: Colors.black,elevation: 5.0,
                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(




                                    child:Icon(
                                      Icons.file_upload,
                                      color: Colors.white,
                                      size: 12.0,

                                    ),),
                                ),
                              ),
                            ),],
                        ),
                      ),

            GlobalData.userType=="teacher" ? Text("") :


            CustomTextFieldBorder(
              controller: acc,
              hintColor: GlobalData.lightblue,
              hintStyle: TextStyle(
                color:GlobalData.black,
              ),
              hintText: "Account Name",
              icon: Icon(
                Icons.account_circle,
                color: GlobalData.lightblue,
              ),
            ),



                      CustomTextFieldBorder(
                        controller: username,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color:GlobalData.black,
                        ),
                        hintText: "User Name",
                        icon: Icon(
                          Icons.account_circle,
                          color: GlobalData.lightblue,
                        ),
                      ),
                      CustomTextFieldBorder(
                        controller: email,
                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Email Address",
                        icon: Icon(
                          Icons.mail,
                          color: GlobalData.lightblue,
                        ),
                      ),

                      CustomTextFieldBorder(
                        keyboardtype: TextInputType.phone,
                        controller: phone,

                        hintColor: GlobalData.lightblue,
                        hintStyle: TextStyle(
                          color: GlobalData.black,
                        ),
                        hintText: "Phone Number",
                        icon: Icon(
                          Icons.phone_android,
                          color: GlobalData.lightblue,
                        ),
                      ),


                      CustomTextFieldBorder(password:true,
                        controller:
                      password,hintColor: GlobalData.lightblue,hintStyle: TextStyle(color: GlobalData.black,),hintText: "Password",icon: Icon(Icons.lock,color: GlobalData.lightblue,),),

                      CustomTextFieldBorder(password:true,
                        controller:
                        cpass,hintColor: GlobalData.lightblue,hintStyle: TextStyle(color: GlobalData.black,),hintText: "Confirm Password",icon: Icon(Icons.lock,color: GlobalData.lightblue,),),

                      CustomTextFieldBorder(controller:
                      disc,hintColor: GlobalData.lightblue,hintStyle: TextStyle(color: GlobalData.black,),hintText: "Discipline",icon: Icon(Icons.speaker_notes,color: GlobalData.lightblue,),),

                      SizedBox(height: 15.0,),

                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Container(height: 48,decoration: BoxDecoration(border:Border.all(color: GlobalData.lightblue),borderRadius: BorderRadius.circular(30) ),
                          child: Row(
                            children: <Widget>[
                              new Radio(
                                value: "Male",
                                groupValue: gendersel,
                                onChanged:( value ){gendersel = value;
                                setState(() {

                                });

                                },
                                activeColor: GlobalData.blue,
                              ),
                              new Text(
                                'Male',
                                style: new TextStyle(fontSize: 16.0,color: GlobalData.black),
                              ),
                              new Radio(
                                value: "Female",
                                groupValue: gendersel,
                                onChanged: (value ){gendersel= value;
                                setState(() {

                                });},
                                activeColor: GlobalData.blue,
                              ),
                              new Text(
                                'Female',
                                style: new TextStyle(
                                  fontSize: 16.0,color: GlobalData.black
                                ),
                              ),
                              /*new Radio(
                                value: "Other",
                                groupValue: gendersel,
                                onChanged: (value){gendersel = value;
                                setState(() {

                                });},
                                activeColor: blue,
                              ),
                              new Text(
                                'Other',
                                style: new TextStyle(
                                  fontSize: 16.0,color: black
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ),


























                      new Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Center(
                          child: GradientButton(
                            () {


                              print(username.text.toString());
                              print(email.text.toString());
                              print(phone.text.toString());
                              print(password.text.toString());
                              print(disc.text.toString());

                             // print(selectedDate.toString().substring(0,10));
                              print(gendersel.toString());

                              check();
                              //savingquestion(context);
                              print("1");
                              globalData.getgender();
                              print("2");


                            },
                            "Get Started",
                            LinearGradient(colors: <Color>[GlobalData.greya, GlobalData.pink]),

                           ),
                        ),
                      ),


                      new Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'By creating an account , you agree to our',
                            style: TextStyle(color: GlobalData.gray, fontSize: 15),
                          )),
                      new Container(
                          child: Text(
                        'Terms & Conditions and Privacy Policy.',
                        style: TextStyle(color: GlobalData.gray, fontSize: 15),
                      )),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have account?',
                            style: TextStyle(color: GlobalData.gray, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Text(" "),
                          GestureDetector(onTap: (){
                              Navigator.of(context)
                                  .pushNamed('login');
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: GlobalData.blue, fontSize: 20),
                            ),
                          )
                        ],
                      )),

                      /* add child content here */
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


