import 'package:flutter/material.dart';
import 'package:newpro/global.dart';

class adminprofile extends StatefulWidget {
  @override
  _adminprofileState createState() => _adminprofileState();
}

class _adminprofileState extends State<adminprofile> {
  String selectedvalue = "Economics";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Center(
            child: Text(
              "Admin Profile",
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
                  child: Container(
                      height: 80,width: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/bg.png'),
                          ))),
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
                                  "Username",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Account Name",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40,top: 10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Field/Specialization:",
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Card(elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(padding: EdgeInsets.only(left: 25,right: 30,top: 13,bottom: 13),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Center(
                                              child: DropdownButton(
                                                value: selectedvalue,
                                                isDense: true,

                                                onChanged: (String newValue) {
                                                  selectedvalue = newValue;

                                                  setState(() {});
                                                },
                                                items: [
                                                  "Economics",
                                                  "Distance Learning Institute",
                                                  "Religious Institute",

                                                  "Other"
                                                ].map((String value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),

//
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),



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
                                  "Status",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            CustomTextField(),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text("Contact:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                child: Text('Via Email',style: TextStyle(
                                    color:lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),),onTap: (){},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                child: Text('Via SMS',style: TextStyle(
                                    color:lightblue,fontSize: 15,fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),),onTap: (){},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20,bottom: 20),
                              child: GradientButtonText(
                                linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,text: Text("Save Changes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,),textAlign: TextAlign.center,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

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
