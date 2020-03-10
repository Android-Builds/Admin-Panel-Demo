import 'package:AdminPanelDemo/event/sub_events.dart';
import 'package:AdminPanelDemo/models/EventCagory.dart';
import 'package:AdminPanelDemo/models/SubEvent.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({this.eventCategory, this.edit = false});
  final EventCategory eventCategory;
  final bool edit;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  String dropDownValue = 'Add Sub Event';
  String name;
  int i, id, index;
  List<String> subEvents = ['...','Add Sub Event'];
  TextEditingController tid = new TextEditingController();
  TextEditingController tname = new TextEditingController();
  var subEventList = <SubEvent>[];

  @override
  void initState() {
    super.initState();
    if(widget.edit) {
      tname.text = name = widget.eventCategory.name;
      id = widget.eventCategory.id;
      tid.text = id.toString();
      if(widget.eventCategory.subEvents.isNotEmpty) {
        subEventList = widget.eventCategory.subEvents;
        for(i=0; i<subEventList.length; i++) {
          subEvents.add(widget.eventCategory.subEvents[i].name);
        }
        subEvents.insert(i,'Add Sub Event');
        dropDownValue = subEvents[0];
      }
    }
  }

  dropDown(String value) async {
    if(value == 'Add Sub Event') {
      var result = await Navigator.push(context, 
            MaterialPageRoute(builder: (context) => SubEvents()));
      result != null ? setState((){
        if (subEvents[0] == '...'){
          subEvents.removeAt(0);
        }
        subEvents.insert(0, result.name);
        subEventList.insert(0, result);
      }) : NullThrownError();
    } else if (value != '...') {
      for(int i=0; i<subEventList.length; i++) {
        if(subEventList[i].name == value) {
          index = i;
          break;
        }
      }
      var result = await Navigator.push(context, 
            MaterialPageRoute(builder: (context) => SubEvents(subEvent: subEventList[index], edit: true)));
      result != null ? dropDownValue = result.name : NullThrownError();
      setState(() {
        subEventList[index] = result;
      });
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
                child: Container(
                  child: TextField(
                    controller: tid,
                    maxLines: 1,
                    onChanged: (value) {
                      id = int.parse(tid.text);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Category ID",
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
                      hintText: "Category Name",
                      fillColor: Colors.grey[900],
                      filled: true,
                    ),
                  ),
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  value: dropDownValue,
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
                      dropDownValue = newValue;
                    });
                    dropDown(newValue);
                  },
                  items: subEvents
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
                    onPressed: () {
                      EventCategory eventCategory = new EventCategory(id: null, name: name, subEvents: subEventList);
                      Navigator.pop(context, eventCategory);
                    },
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