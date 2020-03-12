import 'package:flutter/material.dart';
import '../constatnts.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key key, @required this.user, @required this.pass}) : super(key: key);
  final TextEditingController user;
  final TextEditingController pass;
  @override
  Widget build(BuildContext context) {
    // final user = new TextEditingController();
    // final pass = new TextEditingController();

    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0),
              CircleAvatar(
                radius: 60.0,
                child: Icon(
                  Icons.account_circle,
                  size: 110.0,
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  controller: user,
                  onChanged: (text) {
                    userid = user.text;
                  },
                  maxLines: 1,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "User ID",
                    border: InputBorder.none,
                    fillColor: Colors.grey[900],
                    filled: true
                  ),
                ),
              ),
              SizedBox(height: 40.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  controller: pass,
                  onChanged: (text) {
                    password = pass.text;
                  },
                  maxLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    fillColor: Colors.grey[900],
                    filled: true
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