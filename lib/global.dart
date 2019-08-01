import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pojo/pojo_getclasses.dart';



class GlobalData{




  static Color gradientblue = Color(0Xff1F0BE5); //a
  static Color gradientviolet = Color(0Xff730676); //a
  static Color bluecard = Color(0Xff1560A1); //a
  static Color pinkcard = Color(0XffEF5F7D); //a
  static Color blue = Color(0Xff575DFF);
  static Color white = Color(0XffFFFFFF);
  static Color purple = Color(0Xff7629FB);
  static Color pink = Color(0xffDA29E6);
  static Color black = Color(0Xff878787);
  static Color darkpink = Color(0XffFF4779);
  static Color darkblue = Color(0Xff1F0BE5);
  static Color darkpurple = Color(0Xff730676);
  static Color lightblue = Color(0Xff6B70FC);
  static Color gray = Color(0Xff000000);
  static Color green = Color(0Xff19CB60);
  static Color navy = Color(0Xff29D7FB);
  static Color navyblue = Color(0xff5D63C2);
  static Color orange = Color(0xffFF8658);
  static Color greencard = Color(0xff6DCE8A);
  static Color pinkred =  Color(0xffFF1665);
  static Color bgblue = Color(0xff4268B3);
  static Color bgdarkblue = Color(0xff4267B8);
  static Color yellow = Color(0xffE39917);
  static Color lightpink = Color(0xffE16B8B);

  static Color gradientStart = Colors.blue; //Change start gradient color here
  static Color gradientEnd = Colors.purple;



static List<Classes> Class_list = new List();

  static Classes activeclass ;

  static bool LoadData = true;
  static int QuestionNumber=0;
  static String userType;
  static String accounttype="";
  static String uid;
  static String class_name;
  static String class_icon;
  static String student_code;
  static String teacher_code;
  static String Username;
  static String Selected_subject;
  static String Selected_class;
  static String Selected_class_IDS;
  static List<bool> Slected_subject_bool=[false,false,false,false,false,false,false,false,false];
  static String QuizTitle="";
  static String QuizLevels="";
  static String NosofQuesPerLevel="";
  static String DurationofEachLevel="";
  static String ExamQuiz="";
  static String QuizID="";


}
                                  //Custom drawer for quiz menu
class drawerquiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(child: Padding(
            padding: const EdgeInsets.only(bottom: 40,top: 25),
            child: DrawerHeader(child: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/pic.png',),
                      radius: 35.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(GlobalData.Username,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 16),),
                      ),

                        Text(GlobalData.class_name,
                          style: TextStyle(color: Colors.white,fontSize: 13),)
                      ],),
                  )
                ],),
            ),),
          ),decoration: bg12,),



          Padding(
            padding: const EdgeInsets.only(left: 35,top:30),
            child: Row(children: <Widget>[Icon(Icons.home,color: GlobalData.lightblue,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  child: Text('Home',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  onTap: (){Navigator.of(context)
                      .pushNamed('dashboard');},
                ),
              )],),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 35,top:20),
            child: Row(children: <Widget>[Icon(Icons.assignment,color: GlobalData.lightblue,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Assignment Question Bank',style: TextStyle(
                    color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              )],),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 35,top:20),
            child: Row(children: <Widget>[Icon(Icons.live_help,color: GlobalData.lightblue,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  child: Text('Set Quiz Questions',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  onTap: (){Navigator.of(context)
                      .pushNamed('setquizquestions');},
                ),
              )],),
          ),

          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.offline_pin,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Set Spelling Challenge',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                ),],),
            ),onTap: (){},
          ),

          GestureDetector(

            child: Padding(
              padding: const EdgeInsets.only(left: 35,top:20),
              child: Row(children: <Widget>[Icon(Icons.power_settings_new,color: GlobalData.lightblue,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Log out',style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                ),],),
            ),onTap: ()async{

              SharedPreferences pre= await SharedPreferences.getInstance();
              pre.clear();
              Navigator.of(context).dispose();
              Navigator.of(context).pushNamed('login');

          },
          ),




        ],
      ),
    );
  }
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
      colors: [GlobalData.gradientStart, GlobalData.gradientEnd],
      begin: const FractionalOffset(0.5, 0.0),
      end: const FractionalOffset(0.0, 0.5),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

var bg12 = BoxDecoration(
  gradient: LinearGradient(
    colors: <Color>[GlobalData.gradientblue, GlobalData.gradientviolet],
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
                                color: GlobalData.white,
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
              hintStyle: TextStyle(color: GlobalData.black)),
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
      data: ThemeData(hintColor: GlobalData.white),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
            prefixIcon: Icon(
              Icons.account_circle,
              color: GlobalData.blue,
            ),
            hintText: 'User Name',
            hintStyle: TextStyle(color: GlobalData.black)),
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
  final bool password;
  final keyboardtype;





  CustomTextFieldBorder(
      {this.controller,
      this.hintColor,
      this.icon,
      this.hintText,
      this.hintStyle,
      this.password,
      this.keyboardtype,
      });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
        child: Theme(
          data: ThemeData(hintColor: hintColor),
          child: TextField(keyboardType: keyboardtype,
            obscureText: password == null?false:true,
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5),
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: Colors.white)),
                prefixIcon: icon,
                hintText: hintText,
                hintStyle: hintStyle)
          ),
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
            colors: [GlobalData.darkblue, GlobalData.darkpurple],
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
      padding: EdgeInsets.only(top: 5, bottom: 5),
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
  final bool Inputnumber ;
  final bool enabled;

  CustomTextField(
      {this.controller,
        this.hintColor,
        this.Inputnumber,
        this.Texth,
        this.enabled,
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
            padding: const EdgeInsets.all(5),
            child: TextField(
              enabled: enabled==null?true:false,
              keyboardType: Inputnumber==true?TextInputType.numberWithOptions(decimal: false,signed:false):TextInputType.text,
              decoration:
              InputDecoration(border: InputBorder.none,hintText: Texth,hintStyle: hintStyle),
              textAlign: TextAlign.center,
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}

class calc extends StatelessWidget {

  final String number;


  calc(
  {
    this.number,

}
      );
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(number,style: TextStyle(
                fontSize: 14,color: GlobalData.gray,
              ),),onPressed: (){},color: GlobalData.white
            )
          ],
        ),

      );
  }
}


class classactivitys extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;

  classactivitys(
      {
        this.heading,
        this.paragraph,
        this.color});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(heading,textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        PopupMenuButton(
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (_) => <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: GlobalData.lightblue,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Edit',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: ''),


                                            new PopupMenuItem<String>(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4,top: 1),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: GlobalData.darkpink,size: 12,
                                                      ),
                                                    ),
                                                    new Text('Delete',style: TextStyle(fontSize: 15),),
                                                  ],
                                                ), value: ''),

                                          ],
                                          onSelected: ( value){},
                                        ),
                                      ],
                                    ),
                                  ), ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Text(paragraph,style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),

                  ],
                ),
              ),





            ],
          ),

        ),
      );
  }
}






class levelcomplete extends StatelessWidget {

  final String heading;
  final String paragraph;
  final Color color;

  levelcomplete(
      {
        this.heading,
        this.paragraph,
        this.color});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Card(elevation: 5.0,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: color),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(heading,textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),

                          ],

                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25,top: 20,right: 30,bottom: 30),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(paragraph,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15,color: GlobalData.gray),textAlign: TextAlign.justify,),
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


/*class option {
  bool selected;
  String Text;
  option({this.selected,this.Text});
  option.fromJson(Map<String, dynamic> json)
      : selected = json['selected'],
        Text = json['Text'];
  Map<String, dynamic> toJson() =>
      {
        'Selected': selected,
        'Text': Text,
      };
}*/



class option {
  bool trueanswer;
  String value;
  option({this.trueanswer,this.value});
  option.fromJson(Map<String, dynamic> json)
      : trueanswer = json['trueanswer'],
        value = json['value'];
  Map<String, dynamic> toJson() =>
      {
        'trueanswer': trueanswer,
        'value': value,
      };
}

class MatchClass {
  String val1;
  String val2;
  MatchClass({this.val1,this.val2});
  MatchClass.fromJson(Map<String, dynamic> json)
      : val1 = json['val1'],
        val2 = json['val2'];
  Map<String, dynamic> toJson() =>
      {
        'val1': val1,
        'val2': val2,
      };
}