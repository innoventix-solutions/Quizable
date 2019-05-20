import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'global.dart';
import 'package:http/http.dart' as http;






class third extends StatefulWidget {
  @override


  _thirdState createState() => _thirdState();
}

class _thirdState extends State<third> {

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController usertype = new TextEditingController();

  Show_toast(String msg,Color color){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  login() async {
    http.post("http://edusupportapp.com/api/login.php",body: {
      "username_email":email.text.toString(),
      "password":pass.text.toString(),
      "user_type":usertype.text.toString()
    }).then((response){
      print(response.body.toString());
      if(response.body.toString()=="1"){
        Show_toast("Logged in Successfully",Colors.green);
      }else
      {
        Show_toast("Invalid Username or Password",Colors.red);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/bg2.png')
      ,fit: BoxFit.cover)



      ),


        child:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo.png',width: 80,),
          Container(width: 300,padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Theme(data: ThemeData(hintColor: white),
                  child: TextField(controller: email,
                    decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 5),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(50.0),borderSide: BorderSide(color: Colors.white)
                        ),
                        prefixIcon: Icon(Icons.email,color: Colors.white,),
                        hintText: 'Email:',hintStyle: TextStyle(color: Colors.white,fontSize: 18)


                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(width: 300,
                    child: Theme(data: ThemeData(hintColor: white),
                      child: TextField(controller: pass,
                        decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 5),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                            hintText: 'Password:',hintStyle: TextStyle(color: Colors.white,fontSize: 18)


                        ),
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(width:270,
                      child: Text('Forget Password?',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: RaisedButton(padding: EdgeInsets.only(left: 80,right: 80,top: 13,bottom: 13),color: blue,
                      child: new Text("Log in",style: TextStyle(color: Colors.white,fontSize: 18),),
                      onPressed:(){
//                        print(email.text.toString());
//                        print(pass.text.toString());
                      login();
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),
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

