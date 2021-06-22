import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zeatech/layouts/login.dart';
import 'package:zeatech/layouts/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    );
  }
}