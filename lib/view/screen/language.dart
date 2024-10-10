import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/localization/changelocale.dart';
import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:ecommerce_app_w/view/widget/language/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr , style: Theme.of(context).textTheme.headlineMedium,),
            CustomButton(buttonText: "ar",onPressed: (){
              controller.changeLang("ar");
              Get.offNamed(AppRoutes.onBoarding);
            },),
            CustomButton(buttonText: "en", onPressed: (){
              controller.changeLang("en");
              Get.offNamed(AppRoutes.onBoarding);
            },)
          ],
        ),
      ),
    );
  }
}
