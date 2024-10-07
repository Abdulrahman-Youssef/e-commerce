import 'package:ecommerce_app_w/controller/onboarding_controller.dart';
import 'package:ecommerce_app_w/view/widget/onboarding/Skipbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotControllerOnBoarding(),
                  SizedBox(
                    height: 45,
                  ),
                  CustomButtonOnBoarding(),
                  SkipbuttonOnBoaridng(),
                ],
              ))
        ],
      ),
    ));
  }
}
