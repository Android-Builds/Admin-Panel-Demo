import 'package:AdminPanelDemo/event/sub_events.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  String dropdownValue = 'One';

  dropDown(String value) {
    if(value == 'Add Event') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SubEvents()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              child: Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                    dropDown(newValue);
                  },
                  items: <String>['One', 'Two', 'Free', 'Add Event']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    })
                    .toList(),
                ),
              ),
            ),
            Divider(thickness: 2.0),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:50.0, vertical: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Name of Event",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:40.0),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('New'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}