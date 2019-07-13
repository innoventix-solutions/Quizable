import 'package:flutter/material.dart';
import 'global.dart';

class CheckBoxAletDialog extends StatefulWidget {



  @override
  CheckBoxAletDialogState createState() {
    return new CheckBoxAletDialogState();
  }
}

class CheckBoxAletDialogState extends State<CheckBoxAletDialog> {
  bool _isChecked1 = true;
  bool _isChecked2 = true;
  bool _isChecked3= true;
  bool _isChecked4 = true;


  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('CheckBox'),
            content: Column(
              children: <Widget>[
                CheckboxListTile(
                  title: Text("CheckBox Text"),
                  value: _isChecked1,
                  onChanged: (val) {
                    setState(() {
                      _isChecked1 = val;

                    });
                  },
                ),
              CheckboxListTile(
                  title: Text("CheckBox Text2"),
                  value: _isChecked2,
                  onChanged: (val) {
                    setState(() {
                      _isChecked2 = val;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("CheckBox Text3"),
                  value: _isChecked3,
                  onChanged: (val) {
                    setState(() {
                      _isChecked3 = val;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("CheckBox Text4"),
                  value: _isChecked4,
                  onChanged: (val) {
                    setState(() {
                      _isChecked4 = val;
                    });
                  },
                ),

                GradientButtonText(
                  linearGradient:LinearGradient(colors: <Color>[purple,pink]) ,text: Text("Apply",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,),textAlign: TextAlign.center,),
                ),  ],
            ),

            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox in AlertDialog'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.lightBlue,
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}