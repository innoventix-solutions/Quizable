import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'package:newpro/utilities.dart';
class screen14 extends StatefulWidget {
  @override
  _screen14State createState() => _screen14State();
}

class _screen14State extends State<screen14> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Center(
            child: Text(
              "Create New Classroom",
              style: TextStyle(fontSize: 21),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [darkblue, darkpurple],
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
                size: 10,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(height: 95,width: 95,margin: EdgeInsets.only(top: 70,bottom: 14),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage('assets/images/user.jpg'),
                        )
                    )
                ),
                Text('Upload Classroom Icon',style: TextStyle(fontSize: 15),),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: <Widget>[
                      Container(width: 250,
                          child: Text('Name of Classroom',style: TextStyle(color: lightblue,
                          fontSize: 18,fontWeight: FontWeight.bold),)),
                      Card(elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5,left: 50,right:50),
                          child: TextField(decoration: InputDecoration(
                            border: InputBorder.none),

                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                    ],
                  )
                ),
                GradientButtonText(
                  linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,text: Text("Create a Class",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),textAlign: TextAlign.center,),
                ) ],
            ),
          ),
        ),
      ),

    );
  }
}
