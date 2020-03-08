import 'package:AdminPanelDemo/event/sub_events.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String dropdownValue = 'One';

  dropDown(String value) async {
    if(value == 'Add Event') {
      final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SubEvents()));
      // print(result.id);
      // print(result.name);
      // print(result.date);
      // print(result.time);
      // print(result.location);
      // print(result.universities);
      // print(result.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Categories',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  maxLines: 1,
                  obscureText: false,
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Category ID",
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
                    hintText: "Category Name",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}