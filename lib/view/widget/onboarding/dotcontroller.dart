import 'package:ecommerce_app_w/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../data/datasource/static/static.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoaridingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.all(5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            ));
  }
}
