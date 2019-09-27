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

  GlobalData globalData = new GlobalData();

  //List<pojostydentlist> globlist = new List();

  var gets = "A";

  getstudent
      ()
  async {
GlobalData.Studentlist.clear();
    await http.post("http://edusupportapp.com/api/get_user_list_by_class.php"
        ,body: {
          "Class_id": GlobalData.classid,
          "user_type": "student",
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      GlobalData.Studentlist = (pass['user_data'] as List)
          .map((data) => pojostydentlist.fromJson(data))
          .toList();

      print(GlobalData.Studentlist.length);

      setState(() {

      });
    });
  }


  /* 28-8 delete student*/

  int i=0;

  Delete(String id) async{

    await http.post("http://edusupportapp.com/api/delete_user_from_class.php",
        body: {
          "class_id":GlobalData.classid,
          "user_id":id,
        }).then((res){
      print(res.body);
      //var ParsedJson = jsonDecode(res.body);
      //Stu_List = (ParsedJson['userdata'] as List).map((data)=>pojostydentlist.fromJson(data)).toList();
        setState(() {

        });

    });
  }

/* 30-8 delete student*/
  void showDialog1(BuildContext context,String id) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are you sure want to delete the selected Student?"),
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
                          Navigator.of(context).pushNamed('dashboard');
                        },child: new Text("Cancel")),

                  ),

                  GestureDetector(
                      onTap: (){
                        Delete(id);
                        Show_toast("Delete Successfully", Colors.green);
                        Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),

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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.transparent,
                size: 20,
              ),
            ),
          ],

        ),
        body:
        Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Students",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),


            Expanded(
              child:  GlobalData.Studentlist.isEmpty ?
              Center
                (child:Text("No Student's joined yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              /*ListView.builder( itemCount: 1,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  GestureDetector(
                      onTap: (){
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image:AssetImage('assets/images/man.png'),
                                          )
                                      ),),



                                    ],
                                ),





                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        //Text(GlobalData.Class_list[index].classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                        Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Text('Name of Student Here',style: TextStyle(fontSize: 12),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                              ], ),
                          ),
                          new Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    );
                  })*/
              ) :


              new ListView.builder
                (
                  itemCount: GlobalData.Studentlist.length,
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
                                      decoration: new BoxDecoration(
                                        color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.cover,
//                                              image:GlobalData.Studentlist[index].userphoto!=""? NetworkImage("https://images.pexels.com/photos/1313267/pexels-photo-1313267.jpeg"):
//                                              AssetImage('assets/images/man.png')
                                            image:GlobalData.Studentlist[index].userphoto!=""?
                                            NetworkImage(GlobalData.Studentlist[index].userphoto):
                                            globalData.getUserGender(GlobalData.Studentlist[index].gender),
                                          ),
                                        
                                      ),),


                                    Positioned(
                                      right: 8,bottom: 8,
                                      child: Column(
                                        children: <Widget>[
                                          GlobalData.Studentlist[index].parentemail!="" || GlobalData.Studentlist[index].parentphone!="" ?
                                          Card(color: Colors.green,elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(




                                                  child: Text('P',style: TextStyle(color: Colors.white,fontSize: 7),)),
                                            ),
                                          ):Text(""),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),




                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(GlobalData.Studentlist[index].username),


                                      ],
                                    ),
                                  ),
                                ),


                               //GlobalData.userType.toLowerCase()=="admin_teacher" ?    // 15-9-19 a
                               Padding(
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
                                            showDialog1(context,GlobalData.Studentlist[index].id.toString());
                                          }
                                        },
                                   ),
                                    ],
                                  ),
                                ),//:SizedBox(),     // 15-9-19 a

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
