import 'package:ecommerce_app_w/controller/auth/successsignupcontroller.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/login/customeauthbutton.dart';

class SuccessSingUp extends StatelessWidget {
  const SuccessSingUp({super.key});
  @override
  Widget build(BuildContext context) {
  SuccessSignUpControllerImpl controller = Get.put(SuccessSignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Success SignUp"),
      ),
      body:Container(
        padding: const EdgeInsets.symmetric(vertical: 80 , horizontal: 15),
        child: ListView(
          children: [
              const Center(child: Icon(Icons.check_circle_outline , size: 200,color: AppColor.primaryColor,))
            ,const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: CustomAuthButton(
                text: "Done",
                onPressed: (){
                  controller.toLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
