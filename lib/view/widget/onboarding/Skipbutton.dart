import 'package:ecommerce_app_w/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipbuttonOnBoaridng extends StatelessWidget {
  const SkipbuttonOnBoaridng({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        Get.off(const Login());
      },
      child: const Text(
        "Skip",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
