import 'package:flutter/material.dart';


class GradientButton extends StatelessWidget {

  final String title;
  final LinearGradient linearGradient;
  final VoidCallback ButtonClick;

  GradientButton(this.ButtonClick,this.title,this.linearGradient);
  GradientButton.simple(this.ButtonClick,this.title, {this.linearGradient=const LinearGradient(colors: <Color>[Colors.orange,Colors.pink])});


  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(left: 80,right: 80,top: 5,bottom: 5),
      decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          splashColor: Colors.blue,
          onTap: (){
           ButtonClick();
          },

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title,style:TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
