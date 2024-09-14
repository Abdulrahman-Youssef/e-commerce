import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 35,
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(240)),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.blueAccent,
        child: const Text(
          "continue",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
