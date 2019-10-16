import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pojo/pojo_levels.dart';
import 'global.dart';
import 'package:http/http.dart' as http;

class StudentLevelList extends StatefulWidget {
  @override
  _StudentLevelListState createState() => _StudentLevelListState();
}

class _StudentLevelListState extends State<StudentLevelList> {

  List<pojo_levels> Levels_List = new List();

  bool nextopen=true;
  bool locked=false;
  List<bool> isLocked =List();


  GetLevels() async{
    await http.post("http://edusupportapp.com/api/get_user_quiz_result_by_level.php",
        body: {
          "user_id":GlobalData.uid,
          "quiz_id":GlobalData.QuizID
        }).then((res){
      print(res.body);
      var ParsedJson = jsonDecode(res.body);
      Levels_List = (ParsedJson['data'] as List).map((data)=>pojo_levels.fromJson(data)).toList();
      print("Levels : "+Levels_List.length.toString());

      for(int i=0;i<Levels_List.length;i++)
        {
          isLocked.add(true);
        }

      print(jsonEncode(Levels_List).toString());
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetLevels();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading:

          IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('Quiz_List_student');
          },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 20,
      ),
    ),


      title: Text("Levels"),),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text("Tap on Next Unlocked Level to Open Exercise"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemCount: Levels_List.length,
                          itemBuilder: (c,i){
                        print("Length ${Levels_List.length}");

                          int Stars=null;

                          if(Levels_List[i].userpointAwarded==-1 &&
                          i==0
                          ){
                            print("Lock Open");
                            isLocked[i]=false;
                          }else if(i>0 && Levels_List[i-1].userpointAwarded>-1 &&Levels_List[i].userpointAwarded==-1){
                            isLocked[i]=false;
                          } else if(Levels_List[i].userpointAwarded==-1)
                        {
                          print("stars null");
                              Stars = null;
                        }else if(Levels_List[i].percentage>70)
                          {
                            print("stars 3");
                            Stars=3;
                          }else if(Levels_List[i].percentage>40)
                        {
                          print("stars 2");
                          Stars=2;
                        }else if(Levels_List[i].percentage>-1)
                        {
                          print("stars 1");

                          Stars=1;
                        }

                            return LevelCards(lable:Levels_List[i].level.toString(),stars: Stars,lock: isLocked[i],
                            onPressed: (){
                              print(locked.toString());
                              if(Levels_List[i].userpointAwarded==-1 && !isLocked[i]) {
                                print("asdfasdf : "+GlobalData.isGlobal.toString());
                                GlobalData.CurrentLevel = (i + 1);
                                Navigator.of(context).pushNamed(
                                    GlobalData.isGlobal==true && i>0 && GlobalData.MyMembership.isActive==false?
                                    'ManageAccount':'exam');
                                GlobalData.isGlobal=false;
                              }else
                              {
                                Show_toast_Now(isLocked[i]?"Quiz Locked":"Level already attempted", Colors.red);
                              }
                            },);
                          })),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



class LevelCards extends StatelessWidget {

  String lable;
  bool lock;
  int stars;
  VoidCallback onPressed;
  LevelCards({@required this.lable, this.lock, this.stars,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(10)),
         color: stars!=null?Colors.green:lock?Colors.red:Colors.amber,
         boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(0,0),blurRadius: 3)]
       ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            splashColor: Colors.black26,
            onTap: (){
              onPressed();
              },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(lable,style: TextStyle(color: Colors.white,fontSize: 40),),
                stars==null?  Icon(lock?Icons.lock:Icons.lock_open,color: Colors.white,size: 30,):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      stars>=1? Icon(Icons.star,color: Colors.white,size: 30,):SizedBox(),
                      stars>=2? Icon(Icons.star,color: Colors.white,size: 30,):SizedBox(),
                      stars>=3? Icon(Icons.star,color: Colors.white,size: 30,):SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
