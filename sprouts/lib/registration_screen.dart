import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprouts/home_screen.dart';
import 'login_screen.dart'; // Adjust the import path as necessary

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegistrationScreen({Key? key}) : super(key: key);

  Future<void> _register(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Center(
            child: Column(
              children: <Widget>[
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'First Name',
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFFB8B8B8)),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF134800))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Last Name',
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFFB8B8B8)),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF134800))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Phone Number',
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFFB8B8B8)),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF134800))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Username',
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFFB8B8B8)),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF134800))),
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
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFFB8B8B8)),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF134800))),
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () => _register(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF134800)),
                      child: const Text('Register',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
