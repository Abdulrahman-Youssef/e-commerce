import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title ;
  const TextTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
 child: Text(
   'Welcome Back',
   textAlign: TextAlign.center,
   style: TextStyle(fontSize: 30),
 ),
    );
  }
}

