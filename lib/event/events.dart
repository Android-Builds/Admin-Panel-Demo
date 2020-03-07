import 'package:AdminPanelDemo/event/categories.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String dropdownValue = 'One';

  dropDown(String value) {
    if(value == 'Add Event') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
    }
  }

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
        } else {
          endDate = picked;
        }
      });
      //TODO: endDate should not be less than startDate
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Events'),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  maxLines: 1,
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
                              Text("${startDate.toLocal()}".split(' ')[0]),
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
                              Text("${endDate.toLocal()}".split(' ')[0]),
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
                  obscureText: false,
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Theme",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
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
              Padding(
                padding: const EdgeInsets.only(right:45.0, bottom: 40.0),
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Add'),
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