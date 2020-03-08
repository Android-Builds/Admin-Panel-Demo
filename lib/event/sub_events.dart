import 'package:AdminPanelDemo/event/event_details.dart';
import 'package:AdminPanelDemo/models/EventDetail.dart';
import 'package:AdminPanelDemo/models/SubEvent.dart';
import 'package:flutter/material.dart';

class SubEvents extends StatefulWidget {
  @override
  _SubEventsState createState() => _SubEventsState();
}

class _SubEventsState extends State<SubEvents> {
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  String dropdownValue = 'Add Event Details';
  String universitiesDropDown = 'Add Universities';
  List<String> universityList = ['KIIT', 'Add Universities'];
  String id, name, date, time, location, universities, description;
  TextEditingController tid = new TextEditingController();
  TextEditingController tname = new TextEditingController();
  TextEditingController tlocation = new TextEditingController();
  TextEditingController textEditingController4 = new TextEditingController();
  TextEditingController textEditingController5 = new TextEditingController();
  var list = <EventDetail>[];

  Future<Null> _selectDate(BuildContext context)async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now())
      setState(() {
        pickedDate = picked;
        date = pickedDate.toLocal().toString().split(' ')[0];
      });
      //TODO: endDate should not be less than startDate
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: pickedTime,);
    if (picked != null && picked != TimeOfDay.now())
      setState(() {
        pickedTime = picked;
        time = pickedTime.hour.toString() + ':' + pickedTime.minute.toString();
      });
      //TODO: endDate should not be less than startDate
  }

  dropDown(String value) async {
    if(value == 'Add Event Details') {
      var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage()));
      list.add(result);
      // for(int i=0; i<list.length; i++) {
      //   print(list[i].header); // to check if the values returned are being added to the list.
      // }
    }
  }

  void initState() {
    super.initState();
    date = pickedDate.toLocal().toString().split(' ')[0];
    time = pickedTime.hour.toString() + ':' + pickedTime.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Sub Events'),
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
                  child: Container(
                    child: TextField(
                      controller: tid,
                      maxLines: 1,
                      onChanged: (value) {
                        id = tid.text;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Event ID",
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
                      controller: tname,
                      maxLines: 1,
                      onChanged: (value) {
                        name = tname.text;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Event Name",
                        fillColor: Colors.grey[900],
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Date'),
                      Text('Time'),                     
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => _selectDate(context),
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
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => _selectTime(context),
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
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: Container(
                    child: TextField(
                      controller: tlocation,
                      maxLines: 1,
                      onChanged: (value) {
                        location = tlocation.text;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Location",
                        fillColor: Colors.grey[900],
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: DropdownButton<String>(
                          value: universitiesDropDown,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            color: Colors.grey
                          ),
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              universitiesDropDown = newValue;
                            });
                            // dropDown(newValue);
                          },
                          items: universityList.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(child: Text(value)),
                              );
                            })
                            .toList(),
                        ),
                      ),
                      Center(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            color: Colors.grey
                          ),
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                            dropDown(newValue);
                          },
                          items: <String>['One', 'Two', 'Free', 'Add Event Details']
                            .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(child: Text(value)),
                              );
                            })
                            .toList(),
                        ),
                      ),                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: Container(
                    height: 5 * 24.0,
                    child: TextField(
                      controller: textEditingController5,
                      onChanged: (value) {
                        description = textEditingController5.text;
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter event details",
                        fillColor: Colors.grey[900],
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0),
                  child: RaisedButton(
                    onPressed: () {
                      SubEvent subEvent = new SubEvent(id: id, name: name, date: date, 
                              time: time, location: location, universities: universities, details: list);
                      Navigator.pop(context, subEvent);
                    },
                    child: Text('Add'),
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