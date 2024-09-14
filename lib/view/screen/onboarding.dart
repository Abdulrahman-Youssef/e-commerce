import 'package:flutter/material.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSlider(),
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
