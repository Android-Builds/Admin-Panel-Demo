import 'package:AdminPanelDemo/models/EventDetail.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  String dropdownValue = 'One';
  String id, header, desc;
  TextEditingController tid = new TextEditingController();
  TextEditingController theader = new TextEditingController();
  TextEditingController tdesc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: Container(
                  child: TextField(
                    controller: tid,
                    onChanged: (value) {
                      id = tid.text;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ID",
                      fillColor: Colors.grey[900],
                      filled: true,
                    ),
                  ),
                ),
              ),              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: Container(
                  child: TextField(
                    controller: theader,
                    maxLines: 1,
                    onChanged: (value) {
                      header = theader.text;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Header",
                      fillColor: Colors.grey[900],
                      filled: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: Container(
                  height: 5 * 24.0,
                  child: TextField(
                    controller: tdesc,
                    maxLines: 5,
                    onChanged: (value) {
                      desc = tdesc.text;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Description",
                      fillColor: Colors.grey[900],
                      filled: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:45.0, bottom: 40.0),
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: RaisedButton(
                    onPressed: () {
                      EventDetail eventDetail = new EventDetail(id: id, header: header, desc: desc);
                      Navigator.pop(context, eventDetail);
                    },
                    child: Text('Add'),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}