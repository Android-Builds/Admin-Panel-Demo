import 'package:flutter/material.dart';

class AddUniversititesPage extends StatefulWidget {
  @override
  _AddUniversititesPageState createState() => _AddUniversititesPageState();
}

class _AddUniversititesPageState extends State<AddUniversititesPage> {
  String university;
  TextEditingController tuniversity = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universities'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: tuniversity,
            onChanged: (value) {
              university = tuniversity.text;
            },
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context, university),
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}