import 'package:flutter/material.dart';
import 'global.dart';
class screen11 extends StatefulWidget {
  @override
  _screen11State createState() => _screen11State();
}

class _screen11State extends State<screen11> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Container(width: 400,
        decoration: bg,
          child:new Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Center(
                child: new Card(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
        ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Center(child: Padding(
          padding: const EdgeInsets.only(top:15),

      child: Mydropdown(dropdownValues: <String>["i1","i2","i3","i4"] ,hint: "Types Of institute",)



),
          ), ],
      ),),
   ], ),
          ),),],),),
    );
  }
}
