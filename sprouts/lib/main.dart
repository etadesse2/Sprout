import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Make sure to create and import WelcomeScreen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(), // Set WelcomeScreen as the initial screen
    );
  }
}
