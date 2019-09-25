import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'Pojo/pojostydentlist.dart';

class TeacherList extends StatefulWidget {
  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {


  GlobalData globalData = new GlobalData();

  //List<pojostydentlist> globlist = new List();

  var gets = "A";

  getstudent()
  async {

    await http.post("http://edusupportapp.com/api/get_user_list_by_class.php"
        ,body: {
          "Class_id": GlobalData.classid,
          "user_type": "teacher"
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
  void showDialog1(BuildContext context,String id ) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are You Sure Want To Delete the selected Teacher?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30
                    ),
                    child:   GestureDetector(
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
              style: TextStyle(fontSize: 22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
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


            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image:GlobalData.Userphoto!=""?
                          NetworkImage(GlobalData.Userphoto):
                          globalData.getgender(),
                        )
                    )
                ),




                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:10,bottom: 3),
                      child: Text("Class Admin",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 3),
                      child: Text(GlobalData.Username,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,color: GlobalData.lightblue ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Created: "+GlobalData.createdclassdate,style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),

                Expanded(
                  child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GlobalData.userType=="teacher"?Text(""):PopupMenuButton(
                        child: Icon(Icons.more_vert),
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.edit,
                                      color: GlobalData.lightblue,size: 12,
                                    ),
                                  ),
                                  new Text('Edit Profile',style: TextStyle(fontSize: 15),),
                                ],
                              ), value: 'edit'),


                          new PopupMenuItem<String>(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4,top: 1),
                                    child: Icon(
                                      Icons.cancel,
                                      color: GlobalData.darkpink,size: 12,
                                    ),
                                  ),
                                  new Text('Close Class',style: TextStyle(fontSize: 15),),
                                ],
                              ), value: 'delete'),

                        ],
                        onSelected: ( value){
                          if(value=="edit")
                          {
                            Navigator.of(context).pushNamed('EditProfile');
                          }
                          if(value=="delete")     //28-8-19 a
                              {
                                  //delete function
                          }
                        },
                      ),
                    ],
                  ),
                ),




            ], ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Teachers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),


        Expanded( child:  GlobalData.Studentlist.isEmpty ?
        Center(child:
        ListView.builder( itemCount: 2,

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
                                    child: Text('Name of Teacher Here',style: TextStyle(fontSize: 12),),
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
            })
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
                                GestureDetector(onTap: (){

                                  GlobalData.uid = GlobalData.Studentlist[index].id;
                                  GlobalData.Username=GlobalData.Studentlist[index].username;
                                  GlobalData.disc=GlobalData.Studentlist[index].specification;
                                  GlobalData.email=GlobalData.Studentlist[index].email;
                                  GlobalData.user = GlobalData.Studentlist[index];

                                  Navigator.of(context)
                                      .pushNamed('userdetail');
                                },
                                  child: Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image:GlobalData.Userphoto!=""?
                                          NetworkImage(GlobalData.Studentlist[index].userphoto):
                                          globalData.getgender(),
                                        )
                                    ),),
                                ),
                              ],
                            ),




                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:30),
                                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(GlobalData.Studentlist[index].username,style: TextStyle(color: GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text("Specialization: "+GlobalData.Studentlist[index].specification),
                                    ),


                                  ],
                                ),
                              ),
                            ),




                           GlobalData.userType.toLowerCase()=="admin_teacher"?
                           Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[

                GlobalData.Studentlist[index].id != GlobalData.uid ?
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
                                        ),value: 'delete' ),




                                    ],
                                    onSelected: ( value){

                                      if(value=="delete")
                                      {
                                        showDialog1(context,GlobalData.Studentlist[index].id.toString());
                                      }
                                    },
                                  ) :Text(""),
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


            GlobalData.userType=="teacher" ? Text("") :

          Padding(
              padding: const EdgeInsets.only(top:20,bottom: 25, right: 20),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Add Teacher ',
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
                              'TeacherInviteCode');
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
