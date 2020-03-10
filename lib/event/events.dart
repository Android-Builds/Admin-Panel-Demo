import 'package:AdminPanelDemo/event/categories.dart';
import 'package:AdminPanelDemo/models/Event.dart';
import 'package:AdminPanelDemo/models/EventCagory.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  Events({this.event, this.edit = false});
  final Event event;
  final bool edit;
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  
  int index;
  String id, name, theme;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String dropDownValue = 'Add Event Categories';
  List<String> categoryList = ['...', 'Add Event Categories'];
  List<EventCategory> listCategory = [];
  TextEditingController tid = new TextEditingController();
  TextEditingController tname = new TextEditingController();
  TextEditingController ttheme = new TextEditingController();

  dropDown(String value) async {
    if(value == 'Add Event Categories') {
      var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
      result != null ? setState((){
        if (categoryList[0] == '...'){
          categoryList.removeAt(0);
        }
        categoryList.insert(0, result.name);
        listCategory.insert(0, result);
      }) : NullThrownError();
    } else if (value != '...') {
      for(int i=0; i<listCategory.length; i++) {
        if(listCategory[i].name == value) {
          index = i;
          break;
        }
      }
      var result = await Navigator.push(context, 
            MaterialPageRoute(builder: (context) => Categories(eventCategory: listCategory[index], edit: true)));
      result != null ? setState(() {
        dropDownValue = result.name;
        categoryList[index] = result.name;
        listCategory[index] = result;
      }) : NullThrownError();
    }
    //TODO: Address error on having same element in the list
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
  void initState() {
    super.initState();
    if(widget.edit) {
      tid.text = id = widget.event.id;
      tname.text = name = widget.event.name;
      if(widget.event.eventCategories.length != null) {
        
      }
    }
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  controller: tid,
                  onChanged: (value) {
                    id = tid.text;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[900],
                    filled: true,
                    hintText: "Event ID",
                    border: InputBorder.none
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  controller: tname,
                  onChanged: (value) {
                    name = tname.text;
                  },                  
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Event Name",
                    border: InputBorder.none,
                    fillColor: Colors.grey[900],
                    filled: true,
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
                          color: Colors.grey[900],
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
                child: TextField(
                  controller: ttheme,
                  onChanged: (value) {
                    theme = ttheme.text;
                  },                  
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Theme",
                    fillColor: Colors.grey[900],
                    filled: true,
                    border: InputBorder.none,
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
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                    dropDown(newValue);
                  },
                  items: categoryList
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