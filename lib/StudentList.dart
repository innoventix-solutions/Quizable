import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pojo/pojostydentlist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  List<pojostydentlist> globlist = new List();

  var gets = "A";

  getstudent()
  async {

    await http.post("http://edusupportapp.com/api/get_user_list_by_class.php"
        ,body: {
          "Class_id": GlobalData.classid,
          "user_type": "student",
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      globlist = (pass['user_data'] as List)
          .map((data) => pojostydentlist.fromJson(data))
          .toList();

      print(globlist.length);

      setState(() {

      });
    });
  }


  /* 28-8 delete student*/

  int i=0;
  Delete() async{

    await http.post("http://edusupportapp.com/api/delete_user_from_class.php",
        body: {
          "class_id":GlobalData.classid,
          "user_id":globlist[i].id,
        }).then((res){
      print(res.body);
      //var ParsedJson = jsonDecode(res.body);
      //Stu_List = (ParsedJson['userdata'] as List).map((data)=>pojostydentlist.fromJson(data)).toList();
        setState(() {

        });

    });
  }

/* 30-8 delete student*/
  void showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert!!!"),
          content: new Text("Are You Sure Want To Delete Quiz?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Delete();
                          Show_toast("Delete Successfully", Colors.green);
                          Navigator.of(context).pushNamed('dashboard');
                        },child: new Text("YES")),

                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("No")),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Show_toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
/* 30-8 delete student*/


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
             GlobalData.class_name,
              style: TextStyle(fontSize: 22),textAlign: TextAlign.center,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [GlobalData.darkblue, GlobalData.darkpurple],
              ),
            ),
          ),

        ),
        body:
        Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Students",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),


            Expanded(
              child: new ListView.builder
                (
                  itemCount: globlist.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return
                      Container(

                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                      decoration:GlobalData.Userphoto!=null?
                                      BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(GlobalData.Userphoto),fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(Radius.circular(100)),

                                      )

                                          :BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          color: Colors.black,
                                          image: DecorationImage(image: AssetImage('assets/images/user.jpg'),fit: BoxFit.cover)


                                      )),
                                  ],
                                ),




                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(globlist[index].username),


                                      ],
                                    ),
                                  ),
                                ),


                               GlobalData.userType.toLowerCase()=="admin_teacher" ?Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      PopupMenuButton(
                                        child: Icon(Icons.more_vert),
                                        itemBuilder: (_) => <PopupMenuItem<String>>[
                                          new PopupMenuItem<String>(
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 4),
                                                  child: Icon(
                                                    Icons.cancel,
                                                    color: GlobalData.pinkred,size: 14,
                                                  ),
                                                ),
                                                new Text('Remove',style: TextStyle(fontSize: 15),),
                                              ],
                                            ),  value: 'delete'),
                                        ],
                                        onSelected: ( value){

                                          if(value=="delete")
                                          {
                                            showDialog1(context);
                                          }
                                        },
                                   ),
                                    ],
                                  ),
                                ):SizedBox(),

                              ], ),

                          ],
                        ),
                      );


                  }
              ),
            ),






            Padding(
              padding: const EdgeInsets.only(top:20,bottom: 25, right: 20),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Add Student ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: GlobalData.lightblue),
                    ),
                    Icon(
                      Icons.add_circle,
                      color: GlobalData.lightblue,
                      size: 25,
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(
                      'StudentInviteCode');
                },
              ),
            ),
          ],
        ),


      ),

    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstudent();
  }
}
