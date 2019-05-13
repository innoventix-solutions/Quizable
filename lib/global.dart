import 'package:flutter/material.dart';

Color blue = Color(0Xff575DFF);
Color white = Color(0XffFFFFFF);
Color purple = Color(0Xff7629FB);
Color pink = Color(0xffDA29E6);
Color black = Color(0Xff878787);

Color gradientStart = Colors.blue; //Change start gradient color here
Color gradientEnd = Colors.purple;

var bg = new BoxDecoration(
  gradient: new LinearGradient(
      colors: [gradientStart, gradientEnd],
      begin: const FractionalOffset(0.5, 0.0),
      end: const FractionalOffset(0.0, 0.5),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

class Mydropdown extends StatelessWidget {
  final List<String> dropdownValues;

  final String hint;

  Mydropdown({this.dropdownValues, this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: dropdownValues
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
      onChanged: (String value) {},
      isExpanded: false,
      hint: Text(hint),
    );
  }
}

class MyText extends StatelessWidget {
  final String hint;
  final Icon icon2;
  final VoidCallback onPressed;
  final TextEditingController controller;

  MyText({this.hint, this.icon2, this.onPressed, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      padding: EdgeInsets.only(bottom: 10),
      child: new Theme(
        data: new ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: TextField(
          controller: controller,
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.only(left: 5),
              border: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: new BorderRadius.circular(50.0),
              ),
              prefixIcon: icon2,
              hintText: (hint),
              hintStyle: TextStyle(color: black)),
        ),
      ),
    );
  }
}

class CusstomText extends StatefulWidget {
  @override
  _CusstomTextState createState() => _CusstomTextState();
}

class _CusstomTextState extends State<CusstomText> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(hintColor: white),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
            prefixIcon: Icon(
              Icons.account_circle,
              color: blue,
            ),
            hintText: 'User Name',
            hintStyle: TextStyle(color: black)),
      ),
    );
  }
}

class CustomTextFieldBorder extends StatelessWidget {
  final Color hintColor;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextStyle hintStyle;

  CustomTextFieldBorder(
      {this.controller,
      this.hintColor,
      this.icon,
      this.hintText,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),

      child: Theme(
        data: ThemeData(hintColor: hintColor),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 5),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.white)),
              prefixIcon: icon,
              hintText: hintText,
              hintStyle: hintStyle),
        ),
      ),
    );
  }
}
