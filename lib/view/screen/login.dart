import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // AppBar color
        title: const Text('Login Screen'),
      ),
      body: Container(
        alignment: Alignment.center, // Align the content at the center
        child: const Text(
          'Welcome to the Login Screen',
          style: TextStyle(
            color: Colors.blueAccent, // Text color
            fontSize: 20, // Text size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}
