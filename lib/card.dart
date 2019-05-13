import 'package:flutter/material.dart';

class card extends StatefulWidget {
  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:




      Container(decoration: BoxDecoration(
        image: DecorationImage(
            image:NetworkImage('https://images.pexels.com/photos/2131801/pexels-photo-2131801.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            fit: BoxFit.cover
        ) ,
      ),

        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(padding: EdgeInsets.only(top:5,left: 30,right: 30,bottom: 5),decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white,width: 3),borderRadius: BorderRadius.all(
                Radius.circular(25),

             //                 <--- border radius here
            ),
            ),

                child: Text('Select GameType',style: TextStyle(color: Colors.white,),)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children:
                    <Widget>[


                  Container(height: 100,width: 110,



                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage('assets/images/bg.png'),
                            fit: BoxFit.cover
                        ) ,
                      ),
                        child:Center(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.stars,size: 50,color: Colors.white,),
                              Text("Stars1",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(height: 100,width: 110,


                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(decoration: BoxDecoration(
                          image: DecorationImage(
                              image:AssetImage('assets/images/bg.png'),
                              fit: BoxFit.cover
                          ) ,
                        ),
                          child:Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.stars,size: 50,color: Colors.white,),
                                Text("Stars2",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 100,width: 110,


                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage('assets/images/bg.png'),
                            fit: BoxFit.cover
                        ) ,
                      ),
                        child:Center(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.stars,size: 50,color: Colors.white,),
                              Text("Stars3",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(height: 100,width: 110,


                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(decoration: BoxDecoration(
                          image: DecorationImage(
                              image:AssetImage('assets/images/bg.png'),
                              fit: BoxFit.cover
                          ) ,
                          ),
                       child:Center(
                         child: Column(mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Icon(Icons.stars,size: 50,color: Colors.white,),
                             Text("Stars4",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                           ],
                         ),
                       ),
                        ),
                        ),


                    ),
                  ),
                ],
              ),
            ),

          ],
        ),

      ),


    );
  }
}
