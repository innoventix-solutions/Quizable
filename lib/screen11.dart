import 'package:flutter/material.dart';
import 'global.dart';

class screen11 extends StatefulWidget {
  @override
  _screen11State createState() => _screen11State();
}

class _screen11State extends State<screen11> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),backgroundColor: Color(0Xff1F0BE5)),

      body:
      Container(
        decoration: BoxDecoration(gradient: LinearGradient(
          colors: <Color>[gradientblue, gradientviolet],
          begin: Alignment.centerLeft,
          end: Alignment.bottomCenter,
        ),),


          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60,bottom: 55),
                  child: Text('Select an Account Type',
                    style:TextStyle(color: white,fontSize: 22,fontWeight: FontWeight.bold) ,),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 25),
                  child: Text('An Admin Teacher may set up an account \n'
                      'to manage a Class in an educational \ninstitution. '
                      'Please select the type of \ninstitution your classroom belongs.',
                    style:TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold,
                        height: 1.1),),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 45,left: 45,right: 45),
                  child: Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(child: Mydropdown(
                                dropdownValues: <String>
                                ["Basic School", "Distance Learning Institute",
                                  "Religious Institute", "Secondary School",
                                  "Tertiary Institution","Vocational & Remedial Institute",
                                  "Other"],
                                hint: "Type of Institution",),
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
                        Text('Proceed',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: white),
                        ),Icon(Icons.arrow_forward_ios,color: white,)
                          ],),onTap: (){},
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
