import 'package:flutter/material.dart';
import 'global.dart';

class accounttype extends StatefulWidget {
  @override
  _accounttypeState createState() => _accounttypeState();
}

class _accounttypeState extends State<accounttype> {

  String selectedvalue = "Basic School";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(automaticallyImplyLeading: true,
      backgroundColor: GlobalData.darkpurple),

      body:
      Container(
        decoration: BoxDecoration(color: GlobalData.darkblue),


          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60,bottom: 55),
                  child: Text('Select an Account Type',
                    style:TextStyle(color: GlobalData.white,fontSize: 22,fontWeight: FontWeight.bold) ,),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 25,top: 50),
                  child: Text('An Admin Teacher may set up an account \n'
                      'to manage a Class in an educational \ninstitution. '
                      'Please select the type of \ninstitution your classroom belongs.',
                    style:TextStyle(color: GlobalData.white,fontSize: 16,fontWeight: FontWeight.bold,
                        height: 1.1),),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 45,left: 35,right: 35),
                  child: Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(child:


                              DropdownButton(
                                value: selectedvalue,
                                isDense: true,
                                hint:Text( "Type of Institution"),
                                onChanged: (String newValue) {
                                 selectedvalue=newValue;

                                 setState(() {

                                 });
                                },
                                items: ["Basic School", "Distance Learning Institute",
                                  "Religious Institute", "Secondary School",
                                  "Tertiary Institution","Vocational & Remedial Institute",
                                  "Other"].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),














//                              Mydropdown(
//                                dropdownValues: <String>
//                                ["Basic School", "Distance Learning Institute",
//                                  "Religious Institute", "Secondary School",
//                                  "Tertiary Institution","Vocational & Remedial Institute",
//                                  "Other"],
//                                hint: "Type of Institution",
//                              onChanged: (value){
//
//                              },),
                              ),
                            ],
                          ),),
                      ],
                    ),
                  ),
                ),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25,right: 25),
                    child: GestureDetector(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                        Text('Proceed',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: GlobalData.white),
                        ),Icon(Icons.arrow_forward_ios,color: GlobalData.white,)
                          ],),onTap: (){
                      GlobalData.accounttype=selectedvalue;
                      Navigator.of(context)
                          .pushNamed('signup');
                    },
                    ),
                  ),
                )

              ],
            ),
          ),

      ),
    );
  }
}
