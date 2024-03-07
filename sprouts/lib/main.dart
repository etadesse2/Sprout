import 'package:flutter/material.dart';
import 'package:sprouts/login_screen.dart'; // Import the LoginScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprouts',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(), // Set LoginScreen as the initial screen
    );
  }
}
