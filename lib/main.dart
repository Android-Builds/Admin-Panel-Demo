import 'package:AdminPanelDemo/constatnts.dart';
import 'package:AdminPanelDemo/home.dart';
import 'package:flutter/material.dart';
import 'login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData.dark(
      ),
      home: rememberMe == true ? HomePage() : LoginPage(),
    );
  }
}
