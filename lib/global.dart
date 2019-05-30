import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color gradientblue = Color(0Xff1F0BE5); //a
Color gradientviolet = Color(0Xff730676); //a
Color bluecard = Color(0Xff1560A1); //a
Color pinkcard = Color(0XffEF5F7D); //a
Color blue = Color(0Xff575DFF);
Color white = Color(0XffFFFFFF);
Color purple = Color(0Xff7629FB);
Color pink = Color(0xffDA29E6);
Color black = Color(0Xff878787);
Color darkpink = Color(0XffFF4779);
Color darkblue = Color(0Xff1F0BE5);
Color darkpurple = Color(0Xff730676);
Color lightblue = Color(0Xff6B70FC);
Color gray = Color(0Xff000000);
Color green = Color(0Xff19CB60);
Color navy = Color(0Xff29D7FB);
Color navyblue = Color(0xff5D63C2);
Color orange = Color(0xffFF8658);
Color greencard = Color(0xff6DCE8A);
Color pinkred =  Color(0xffFF1665);
Color bgblue = Color(0xff4268B3);
Color bgdarkblue = Color(0xff4267B8);

Color gradientStart = Colors.blue; //Change start gradient color here
Color gradientEnd = Colors.purple;


class GlobalData{
  static String userType;
  static String accounttype;
  static String uid;
  static String class_name;
  static String class_icon;
  static String student_code;
  static String teacher_code;
}

Show_toast_Now(String msg,Color color){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

var bg = new BoxDecoration(
  gradient: new LinearGradient(
      colors: [gradientStart, gradientEnd],
      begin: const FractionalOffset(0.5, 0.0),
      end: const FractionalOffset(0.0, 0.5),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

var bg12 = BoxDecoration(
  gradient: LinearGradient(
    colors: <Color>[gradientblue, gradientviolet],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  ),
);

/*Custom Card*/
class CustomCard extends StatelessWidget {
  final Color cardcolor;
  final String text;

  //final Icon icon;
  final Image image;

  CustomCard({this.cardcolor, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 25),
              child: SizedBox(
                child: Card(
                  color: cardcolor,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        image,
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            text,
                            style: TextStyle(
                                fontSize: 13,
                                color: white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
/*Custom dropdown*/

class Mydropdown extends StatelessWidget {
  final List<String> dropdownValues;

  final String hint;
  final VoidCallback onChanged;

  Mydropdown({this.dropdownValues, this.hint,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: dropdownValues
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
      onChanged:(value){ onChanged;},
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
      padding: EdgeInsets.only(left: 30, right: 30, top: 15),
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

class appbar extends StatefulWidget {
  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: (){},
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Center(
        child: Text(
          "Add Student",
          style: TextStyle(fontSize: 22),
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
          onPressed: (){},
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class GradientButtonText extends StatelessWidget {
  final Text text;
  final LinearGradient linearGradient;
  final VoidCallback ButtonClick;

  GradientButtonText({this.ButtonClick, this.text, this.linearGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 5),
      decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          splashColor: Colors.blue,
          onTap: () {
            ButtonClick();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: text,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Color hintColor;
  final String Texth;
  final TextEditingController controller;
  final TextStyle hintStyle;

  CustomTextField(
      {this.controller,
        this.hintColor,

        this.Texth,
        this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.bottomLeft,

          ),
        ),
        Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 5, bottom: 5, left: 50, right: 50),
            child: TextField(

              decoration:
              InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

