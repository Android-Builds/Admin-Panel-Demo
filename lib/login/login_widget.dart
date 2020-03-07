import 'package:flutter/material.dart';
import '../constatnts.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = new TextEditingController();
    final pass = new TextEditingController();

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
              SizedBox(height: 100.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextField(
                  controller: user,
                  onChanged: (text) {
                    userid = user.text;
                  },
                  maxLines: 1,
                  obscureText: false,
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "User ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
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
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
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