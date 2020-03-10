import 'package:AdminPanelDemo/event/events.dart';
import 'package:AdminPanelDemo/models/Event.dart';
import 'package:flutter/material.dart';

class DefaultEvents extends StatefulWidget {
  @override
  _DefaultEventsState createState() => _DefaultEventsState();
}

class _DefaultEventsState extends State<DefaultEvents> {
  int i, index;
  String dropdownValue = 'Add Event';
  List<String> eventList = ['...', 'Add Event'];
  List<Event> events = [];

  dropDown(String value) async {
    if(value == 'Add Event') {
      var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Events()));
      result != null ? setState(() {
        if(eventList[0] == '...') {
          eventList.removeAt(0);
        }
        events.insert(0, result);
        eventList.insert(0, result.name);
      }) : NullThrownError();
    } else if (value != '...') {
      for(i=0; i<events.length; i++) {
        if(events[i].name == value) {
          index = i;
          break;
        }
      }
      var result = await Navigator.push(context, MaterialPageRoute(builder: 
          (context) => Events(event: events[index], edit: true)));
      result != null ? setState(() {
        dropdownValue = result.name;
        eventList[index] = result.name;
        events[index] = result;
      }) : NullThrownError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Default'),
        ),
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
                  items: eventList
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