import 'package:flutter/material.dart';
import 'global.dart';

class StudentLevelList extends StatefulWidget {
  @override
  _StudentLevelListState createState() => _StudentLevelListState();
}

class _StudentLevelListState extends State<StudentLevelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Levels"),),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text("Tap on Next Unlocked Level to Open Exercise"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemCount: int.parse(GlobalData.QuizLevels),
                          itemBuilder: (c,i){
                            return Card(
                              child: LevelCards(lable: (i+1).toString(),stars: 2,
                              onPressed: (){
                                GlobalData.CurrentLevel=(i+1);
                                Navigator.of(context).pushNamed('exam');
                              },),
                            );
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
    return Container(
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
          onTap: (){onPressed();},
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
    );
  }
}
