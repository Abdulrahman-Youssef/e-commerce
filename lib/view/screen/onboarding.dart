import 'package:ecommerce_app_w/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const DotControllerOnBoarding(),
                  const SizedBox(
                    height: 45,
                  ),
                  const CustomButtonOnBoarding(),
                  Container(
                      child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ))
        ],
      ),
    ));
  }
}
