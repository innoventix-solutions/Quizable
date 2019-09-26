import 'package:flutter/material.dart';
import 'package:newpro/global.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/Pojo/pojostydentlist.dart';

class adminprofile extends StatefulWidget {
  @override
  _adminprofileState createState() => _adminprofileState();
}

class _adminprofileState extends State<adminprofile> {

  GlobalData globalData = new GlobalData();

  var photo="";

  TextEditingController Name = new TextEditingController(text: GlobalData.Fullname);
  TextEditingController Phone = new TextEditingController(text: GlobalData.Phone);


  SharedPreferences shared;
  String image64 = "";
  File _image;

  Future getImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight:  200 , maxWidth: 200);
    _image = file;
    List<int> imagebytes = await file.readAsBytesSync();
    image64 = await base64.encode(imagebytes);
    setState(() {});
  }


  GetShared() async {
    shared = await SharedPreferences.getInstance();

    shared.setString("name", Name.text.toString());
    shared.setString("phone", Phone.text.toString());
    //shared.setString("userphoto", GlobalData.Userphoto);


  }


  getvalue() async {
    shared = await SharedPreferences.getInstance();

    Name.text=shared.getString("name");
    Phone.text=shared.getString("phone");
   //GlobalData.Userphoto = shared.getString("userphoto");

  }



  editprofile()async{

    await http.post("http://edusupportapp.com/api/update_profile.php",
        body:{
          "user_id":GlobalData.uid,
          "image":image64,
          "Fullname":Name.text.toString(),
          "phone_no":Phone.text.toString(),


        }).then((response) async {
      print(response.body);
      var ParsedJson = jsonDecode(response.body);

      if (ParsedJson['status'] == 1) {

        Navigator.of(context)
            .pushNamed('dashboard');


        SharedPreferences preferences =  await SharedPreferences.getInstance();
        GlobalData.Fullname = Name.text;
        GlobalData.Phone = Phone.text;
        GlobalData.Userphoto= ParsedJson['userdata']['user_photo'];
        preferences.setString("name",GlobalData.Fullname);
        preferences.setString("phone", GlobalData.Phone);
        preferences.setString("userphoto", GlobalData.Userphoto);
      }else
      {
        Show_toast_Now(ParsedJson['msg'],Colors.green);
      }
    });

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getvalue();
    print(GlobalData.uid);
    print(GlobalData.Fullname);

  }




  void ShowDialog({String Msg}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(Msg==null?"Updated Successfully":Msg),
        );
      },
    );
  }
  void ShowDialog1({String Msg}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(Msg==null?"Invalid user":Msg),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,

          title: Center(
            child: Text(
              "Edit Profile",
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
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(onTap: (){getImage();},
                    child: Stack(children: <Widget>[
                      Container(
                        height: 80,width: 80,
                          decoration:_image!=null?
                          new BoxDecoration(

                              borderRadius: BorderRadius.all(Radius.circular(100),),
                              color: Colors.black,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(_image),

                              )):
                          GlobalData.Userphoto!=""?
                          BoxDecoration(
                            image: DecorationImage(image: NetworkImage(GlobalData.Userphoto),fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(100)),

                          )

                              :BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              color: Colors.black,
                              image: DecorationImage(image:
                              globalData.getgender(),fit: BoxFit.cover)


                          )



                      ),
                      Positioned(
                        right: 0,bottom: 0,
                        child: GestureDetector(onTap: (){

                          getImage();

                        },
                          child: Card(color: Colors.black,elevation: 5.0,
                            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(




                                child:GestureDetector(onTap: (){
                                  getImage();
                                },
                                  child: Icon(
                                    Icons.file_upload,
                                    color: Colors.white,
                                    size: 12.0,

                                  ),
                                ),),
                            ),
                          ),
                        ),
                      ),
                    ],

                    ),

                  ),
                ),
                Text("Change Profile"),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Fullname",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextFieldBorderNew(controller: Name,),
                          ],
                        ),
                      ),
                    ),

                   Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Phone Number",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextFieldBorderNew(controller: Phone,keyboardtype: TextInputType.phone,),




                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: GradientButtonText(
                        linearGradient:LinearGradient(colors: <Color>[GlobalData.purple,GlobalData.pink]) ,
                        text: Text("Save Changes",style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 15,),textAlign: TextAlign.center,),
                        ButtonClick: (){editprofile();GetShared();},
                      ),
                    ),

                   /* Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Contact:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        child: Text('Via Email',style: TextStyle(
                            color:GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),onTap: (){},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        child: Text('Via SMS',style: TextStyle(
                            color:GlobalData.lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),onTap: (){},
                      ),
                    ),*/
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
