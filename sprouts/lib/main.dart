import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Make sure to create and import WelcomeScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(), // Set WelcomeScreen as the initial screen
    );
  }
}
