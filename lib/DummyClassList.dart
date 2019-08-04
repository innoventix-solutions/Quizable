class shareclasscode extends StatelessWidget {

final String classname;
final String studentcode;
final String teachercode;
final Image image;

shareclasscode({this.classname, this.studentcode, this.teachercode,this.image});

@override
Widget build(BuildContext context) {
  return
    Column(
      children: <Widget>[
        Expanded(
          child: new

          ListView.builder(
              itemCount: classname.length,

              itemBuilder: (BuildContext ctxt, int index) {
                return  GestureDetector(

                  child: Column(
                    children: <Widget>[
                      Container(

                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(height: 70,width: 70,margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image:AssetImage('assets/images/bg.png'),
                                      )
                                  ),),
                              ],
                            ),


                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:30),
                                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(classname,style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                                    Text(studentcode,
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                          fontSize: 14),),
                                    Text(teachercode,
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                          fontSize: 14),),

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
    );
}
}