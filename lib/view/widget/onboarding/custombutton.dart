import 'package:ecommerce_app_w/controller/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp>{
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 35,
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(240)),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        color: Colors.blueAccent,
        child: const Text(
          "continue",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
