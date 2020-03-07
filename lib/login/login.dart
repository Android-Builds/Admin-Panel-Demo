import 'package:AdminPanelDemo/constatnts.dart';
import 'package:AdminPanelDemo/home.dart';
import 'package:flutter/material.dart';
import 'login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  login() {
    print('called');
    if(userid == 'admin' && password == 'password') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Wrong Username or Password !')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              LoginWidget(),
              SizedBox(height: 60.0),
              RaisedButton(
                onPressed: () {
                  login();
                },
                child: Text('Login'),
              ),
              SizedBox(height: 50.0),
              GestureDetector(
                child: Text('Forgot Password ?',
                style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),    
    );
  }
}