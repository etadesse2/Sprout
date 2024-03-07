import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprouts/registration_screen.dart';
import 'home_screen.dart'; // Assuming this is your HomeScreen; rename as necessary

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  Future<void> _login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String storedUsername = prefs.getString('username') ?? '';
    String storedPassword = prefs.getString('password') ?? '';

    if (_usernameController.text == storedUsername &&
        _passwordController.text == storedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // HomeScreen
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect username or password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 230),
                    child: Image(
                      image: AssetImage('assets/images/leaf.png'),
                      height: 45,
                      width: 30,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 22.0),
                    child: Text(
                      'SPROUT',
                      style: TextStyle(
                          letterSpacing: 10,
                          fontSize: 40,
                          color: Color.fromARGB(255, 28, 67, 30)),
                    ),
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Username',
                      contentPadding: const EdgeInsets.only(left: 30),
                      hintStyle: const TextStyle(
                          fontSize: 14, color: Color(0xFFB8B8B8)),
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color(0xFF134800))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.only(left: 30),
                      hintStyle: const TextStyle(
                          fontSize: 14, color: Color(0xFFB8B8B8)),
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color(0xFF134800))),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () => _login(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF134800)),
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                        splashColor: Colors.white,
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
