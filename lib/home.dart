import 'package:AdminPanelDemo/event/events.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0,60),
          child: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('Admin Panel'),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25.0,
                  )
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                height: 300.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Events())),
                    child: Text('Add'),
                  ),
                  SizedBox(width: 100.0),
                  RaisedButton(
                    onPressed: () {
                      
                    },
                    child: Text('Manage'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}