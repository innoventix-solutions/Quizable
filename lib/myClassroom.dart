import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import'package:newpro/Pojo/pojo_getclasses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class myclassroom extends StatefulWidget {
  @override
  _myclassroomState createState() => _myclassroomState();
}

class _myclassroomState extends State<myclassroom> {


  bool isSwitched = true;

  ActiveDeactiveClass(String action) async{
    print("class id : "+GlobalData.activeclass.id);


    await http.post("http://edusupportapp.com/api/active_deactive_class.php",
        body: {
          "Class_id":GlobalData.activeclass.id,
          "action":action,
        }).then((res){
      print(res.body);
      //var ParsedJson = jsonDecode(res.body);
      //Stu_List = (ParsedJson['userdata'] as List).map((data)=>pojostydentlist.fromJson(data)).toList();

      GlobalData.activeclass.status=action;
      Navigator.of(context).pop();
      setState(() {

      });


    });
  }
  getstudentcount()
  async {

    await http.post("http://edusupportapp.com/api/get_teacher_classes.php"
        ,body: {
          "UserId": GlobalData.uid,
        }).
    then((response){

      print(response.body);

      var pass = jsonDecode(response.body);

      GlobalData.Class_list = (pass['join_classdata'] as List).map((data) => Classes.fromJson(data)).toList();

      print(GlobalData.Class_list.length);

      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
        automaticallyImplyLeading: true,

        title: Center(
          child: Text(
            "My Classrooms",
            style: TextStyle(fontSize: 22),
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
            onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
        body:Column(
          children: <Widget>[
            Expanded(
              child: new

              
              ListView.builder(
                  itemCount: GlobalData.Class_list.length,

                  itemBuilder: (BuildContext ctxt, int index) {
                    return  GestureDetector(
                      onTap: (){
                        GlobalData.classid = GlobalData.Class_list[index].id;

                        GlobalData.activeclass = GlobalData.Class_list[index];
                        GlobalData.class_name = GlobalData.Class_list[index].classname;

                       // GlobalData.parentsphone=GlobalData.Studentlist[index].parentphone;
                       // GlobalData.parentsemail=GlobalData.Studentlist[index].parentemail;
                        //GlobalData.uid= GlobalData.Studentlist[index].id;

                        print(GlobalData.Class_list[index].classname);


                        print(GlobalData.activeclass.classname);
                        Navigator.of(context)
                            .pushNamed('StudentList');

                      },
                      child: GlobalData.classadminid==GlobalData.Class_list[index].userid?Column(
                        children: <Widget>[
                          Container(
                            color: GlobalData.Class_list[index].selected==true?Colors.blue[50]:Colors.white,
                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[



                                    Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                      child: ClipOval(
                                        child: FadeInImage.assetNetwork(
                                          placeholder: 'assets/images/classicon.png',
                                          image: GlobalData.Class_list[index].classicon,fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),





                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(GlobalData.Class_list[index].classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                        Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Text(GlobalData.Class_list[index].total_join==null?"0 Student":GlobalData.Class_list[index].total_join.toString()
                                            +" Students",style: TextStyle(fontSize: 14),),
                                        ),

                                        GlobalData.Class_list[index].status=="active"?
                                        SizedBox():Padding(
                                          padding: const EdgeInsets.only(top:5),
                                          child: Text("Deactivated",style: TextStyle(fontSize: 14,color: Colors.red),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),


                               /* GlobalData.userType.toLowerCase()=="teacher" ?
                                SizedBox():
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
                                                  padding: const EdgeInsets.only(right:0,top: 1),
                                                  child: GlobalData.Class_list[index].status=="active"?
                                                  Text("Deactivate Class"):Text("Activate Class"),
                                                ),
                                                Switch(
                                                  value: (GlobalData.activeclass.status=="active"),
                                                  onChanged: (value) {
                                                    if(value == true ){

                                                      ActiveDeactiveClass("active");
                                                    }
                                                    else
                                                    {
                                                      ActiveDeactiveClass("deactive");
                                                    }
                                                    setState(() {

                                                      isSwitched = value;
                                                    });
                                                  },
                                                  activeTrackColor: Colors.lightGreenAccent,
                                                  activeColor: Colors.green,
                                                ),
                                              ],
                                            ), ),

                                        ],
                                        onSelected: ( value){

                                        },
                                      ),
                                    ],
                                  ),
                                ),*/

                              ], ),
                          ),
                          new Divider(
                            color: Colors.black,
                          ),
                        ],
                      ):Text("")
                    );
                  }
              ),
            ),


          ],
        ),


      ),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstudentcount();
  }
}
