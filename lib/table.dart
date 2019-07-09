import 'package:flutter/material.dart';
import 'global.dart';

class aritmethicquiz extends StatefulWidget {
  @override
  aritmethicquizState createState() {
    return new aritmethicquizState();
  }
}

class aritmethicquizState extends State<aritmethicquiz> {
  TextEditingController val1 = TextEditingController();

  String i="0";
  String sum="0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 25,right: 25),
              child: Card(color: Colors.grey,elevation: 5.0,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(controller:val1,keyboardType:TextInputType.number,
                      decoration:InputDecoration(border: InputBorder.none) ,
                      style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
              child: Card(color: Colors.grey,elevation: 5.0,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(i.toString(),
                      style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
              child: Card(color: Colors.grey,elevation: 5.0,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(sum.toString(),
                      style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),


            Divider(color: black,),


           Row(children: <Widget>[
             RaisedButton(child: Text("1"),onPressed: (){i=1.toString();setState(() {

             });},),

             RaisedButton(child: Text("2"),onPressed: (){i=2.toString();setState(() {

             });},),

             RaisedButton(child: Text("3"),onPressed: (){i=3.toString();setState(() {

             });},),


           ],),


            Row(children: <Widget>[
              RaisedButton(child: Text("+"),onPressed: (){i="+".toString();setState(() {

              });},),

              RaisedButton(child: Text("="),onPressed: (){sum=(int.parse(i.toString())+
                  int.parse(i.toString())).toString();setState(() {

              });},),
            ],),


            Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Row(children: <Widget>[

                Expanded(
                  child: GestureDetector(
                    child: Container(

                      child: calc(number: "+"),
                    ),
                  onTap: (){},),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "-",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "*",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "/",),
                  ),
                ),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Row(children: <Widget>[



                Expanded(
                  child: GestureDetector(onTap: (){
                    i=1.toString();setState(() {

                    });},
                    child: Container(

                      child: calc(number: "1",),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "2",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "3",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "4",),
                  ),
                ),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Row(children: <Widget>[

                Expanded(
                  child: Container(

                    child: calc(number: "5",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "6",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "7",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "8",),
                  ),
                ),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Row(children: <Widget>[

                Expanded(
                  child: Container(

                    child: calc(number: "C",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "9",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "0",),
                  ),
                ),

                Expanded(
                  child: Container(

                    child: calc(number: "=",),
                  ),
                ),
              ],),
            ),








          ],
        ),
      ),
    );
  }
}