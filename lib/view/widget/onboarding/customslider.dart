import 'package:ecommerce_app_w/controller/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
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
                  style: const TextStyle(
                      height: 3, color: AppColor.grey, fontSize: 18),
                )
              ],
            ));
  }
}
