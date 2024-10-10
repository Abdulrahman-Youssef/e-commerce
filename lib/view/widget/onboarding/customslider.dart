import 'package:ecommerce_app_w/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoaridingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoaridingList[i].title!,
                  style:Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black ,),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(

                  onBoaridingList[i].image!,
                  height: 400,
                  width: 200,
                  fit: BoxFit.fill,
                ),
                Text(
                  onBoaridingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ));
  }
}
