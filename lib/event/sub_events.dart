import 'package:AdminPanelDemo/models/SubEvent.dart';
import 'package:flutter/material.dart';

class SubEvents extends StatefulWidget {
  @override
  _SubEventsState createState() => _SubEventsState();
}

class _SubEventsState extends State<SubEvents> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String dropdownValue = 'One';
  String id, name, date, time, location, universities, description;
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController textEditingController2 = new TextEditingController();
  TextEditingController textEditingController3 = new TextEditingController();
  TextEditingController textEditingController4 = new TextEditingController();
  TextEditingController textEditingController5 = new TextEditingController();

  Future<Null> _selectDate(BuildContext context, int n)async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: n == 1 ? startDate : endDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now())
      setState(() {
        if(n == 1) {
          startDate = picked;
          date = startDate.toLocal().toString().split(' ')[0];
        } else {
          endDate = picked;
          time = endDate.toString();
        }
      });
      //TODO: endDate should not be less than startDate
  }

  void initState() {
    super.initState();
    date = startDate.toLocal().toString().split(' ')[0];
    time = startDate.toLocal().toString().split(' ')[1].substring(0,5);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: TextField(
                    maxLines: 1,
                    controller: textEditingController,
                    onChanged: (value) {
                      id = textEditingController.text;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Event ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: TextField(
                    maxLines: 1,
                    controller: textEditingController2,
                    onChanged: (value) {
                      name = textEditingController2.text;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Event Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _selectDate(context, 1),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("$date"),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                      Text('To'),
                      GestureDetector(
                        onTap: () => _selectDate(context, 2),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("$time"),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),                      
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: TextField(
                    maxLines: 1,
                    controller: textEditingController3,
                    onChanged: (value) {
                      location = textEditingController3.text;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: TextField(
                    maxLines: 1,
                    controller: textEditingController4,
                    onChanged: (value) {
                      universities = textEditingController4.text;
                    },
                    obscureText: false,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Universities",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: Container(
                    // margin: EdgeInsets.all(12.0),
                    height: 5 * 24.0,
                    child: TextField(
                      controller: textEditingController5,
                      onChanged: (value) {
                        description = textEditingController5.text;
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter event deetails",
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
                        SubEvent subEvent = new SubEvent(id: id, name: name, date: date, 
                                time: time, location: location, universities: universities);
                        Navigator.pop(context, subEvent);
                      },
                      child: Text('Add'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}