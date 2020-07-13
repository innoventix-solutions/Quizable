import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:newpro/utilities.dart';
class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  GlobalData globalData = new GlobalData();

  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Log Out"),
          content: new Text("Are You Sure Want To Log Out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50
                    ),
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('welcome');
                        },child: new Text("Cancel")),


                  ),
                  GestureDetector(
                      onTap: () async {
                        LogoutFunction(context);
                        // Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),
                ],
              ),
              onPressed: () async{
                LogoutFunction(context);
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
child: Scaffold(
  appBar: AppBar(
automaticallyImplyLeading: false,
    title: Center(
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 22),
      ),
    ),
    flexibleSpace: Container(
      decoration: bg12,
    ),


    actions: <Widget>[
      IconButton(onPressed: (){
        showDialog1(context);
      },
        icon: GestureDetector(onTap: (){
          showDialog1(context);
        },
          child: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    ],backgroundColor: Color(0Xff1F0BE6),
  ),
  body: SingleChildScrollView(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Container(
                  child: CircleAvatar(backgroundImage:GlobalData.Userphoto!=""?
                  NetworkImage(GlobalData.Userphoto):globalData.getgender(),
                    radius: 35.0,
                  ),
                ),
              ),

              Positioned(
                right: 0,bottom: 0,
                child: GestureDetector(onTap: (){

                  Navigator.of(context)
                      .pushNamed('EditProfile');

                },
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
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: Text('Welcome '+GlobalData.Username,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45,right: 45,left: 45),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Get Started',style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold),),
                    //SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GradientButtonText(
                          linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,text: Text("Create a Class",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.center,),
                          ButtonClick: (){
                            Navigator.of(context)
                                .pushNamed('createnewclass');
                          },)),
                    ],
                  ),
                ),//SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 20,right: 20,bottom: 30),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: GradientButtonText(
                                linearGradient:LinearGradient(
                                    colors: <Color>[GlobalData.navy,GlobalData.navyblue]) ,
                                text: Text("Join a Class",
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize:14,),
                                  textAlign: TextAlign.center,),
                              ButtonClick: (){
                                  Navigator.of(context)
                                  .pushNamed('adminteacherjoinclass');},)
                          ),
                        ],
                      ),
                    ),],
                ),
              ),

            ),
          ),
        ],
      ),
    ),
  ),
),

    );
  }
}
