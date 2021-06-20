import 'package:flutter/material.dart';
// import 'package:zeatech/layouts/home.dart';
import 'package:zeatech/layouts/login.dart';
// import 'package:zeatech/layouts/logincoba.dart';
import 'package:zeatech/layouts/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Login()
      },
      // home: LoginPage(),
    );
  }
}