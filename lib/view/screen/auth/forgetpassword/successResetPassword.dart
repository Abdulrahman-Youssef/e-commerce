import 'package:ecommerce_app_w/controller/auth/successresetpasswordcontroller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/login/customeauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});
// ????????remove and use the same
  @override
  Widget build(BuildContext context) {
    SSuccessResetPasswordControllerImpl controller = Get.put(SSuccessResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Success ResetPassword"),
      ),
      body:Container(
        padding: const EdgeInsets.symmetric(vertical: 80 , horizontal: 15),
        child: Column(
          children: [
            const Center(child: Icon(Icons.check_circle_outline , size: 200,color: AppColor.primaryColor,))
            ,const Spacer(),
            Container(
              width: double.infinity,
              child: CustomAuthButton(
                text: "Done",
                onPressed: controller.toLogin(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
