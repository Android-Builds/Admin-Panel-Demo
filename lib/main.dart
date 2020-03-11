import 'package:AdminPanelDemo/constatnts.dart';
import 'package:AdminPanelDemo/event/default_events.dart';
import 'package:AdminPanelDemo/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/login.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('rememberMe');
    print(rememberMe);
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Admin Panel',
        theme: ThemeData.dark(),
        home: rememberMe == false ? LoginPage() : DefaultEvents()
      )
    );
  }
