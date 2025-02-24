import 'package:ecommerce_app_w/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_app_w/controller/auth/forgetpassword/verifycode_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/login/Authtextfield.dart';
import 'package:ecommerce_app_w/view/widget/login/customeauthbutton.dart';
import 'package:ecommerce_app_w/view/widget/login/textbody.dart';
import 'package:ecommerce_app_w/view/widget/login/texttitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImpl controller = Get.put(VerifyCodeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          "Verification Code",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        color: AppColor.backgroundcolor,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Center(
          child: ListView(
            children: [
              const TextTitle(
                title: "check code",
              ),
              const SizedBox(height: 15),
              const TextBody(
                bodyText:
                    "enter the verification that have been send to your email address", // put the email from the last page
              ),
              const SizedBox(
                height: 13,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderWidth: 3,
                borderRadius: BorderRadius.circular(15),
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) async {
                  controller.verifyCode = verificationCode;
                  bool result = await controller.checkCode();
                  if (result) {
                    controller.toResetPassword();
                  }
                }, // end onSubmit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
