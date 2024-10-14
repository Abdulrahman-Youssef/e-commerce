import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;

  const TextTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 30),
    );
  }
}
