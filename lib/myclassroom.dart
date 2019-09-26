import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import'package:newpro/Pojo/pojo_getclasses.dart';


class myclassroom extends StatefulWidget {
  @override
  _myclassroomState createState() => _myclassroomState();
}

class _myclassroomState extends State<myclassroom> {
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

                       // GlobalData.parentsphone=GlobalData.Studentlist[index].parentphone;
                       // GlobalData.parentsemail=GlobalData.Studentlist[index].parentemail;
                        //GlobalData.uid= GlobalData.Studentlist[index].id;

                        print(GlobalData.Class_list[index].classname);
                        print(GlobalData.activeclass.classname);
                        Navigator.of(context)
                            .pushNamed('StudentList');

                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: GlobalData.Class_list[index].selected==true?Colors.blue[50]:Colors.white,
                            child: Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[



                                    Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/classicon.png',
                                        image: GlobalData.Class_list[index].classicon,fit: BoxFit.cover,
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
                                          child: Text(GlobalData.Class_list[index].total_join==null?"0 Student":GlobalData.Class_list[index].total_join,style: TextStyle(fontSize: 12),),
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
                  }
              ),
            ),


          ],
        ),


      ),

    );
  }
}
