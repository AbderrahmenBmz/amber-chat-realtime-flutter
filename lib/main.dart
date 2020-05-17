import 'package:chatapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amber Chat',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: WelcomeScreen(),
    );
  }
}

