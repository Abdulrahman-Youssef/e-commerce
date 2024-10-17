import 'package:ecommerce_app_w/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app_w/controller/auth/resetpassword_controller.dart';
import 'package:ecommerce_app_w/controller/auth/signup_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/function/validinput.dart';
import 'package:ecommerce_app_w/view/widget/login/Authtextfield.dart';
import 'package:ecommerce_app_w/view/widget/login/customauthtext.dart';
import 'package:ecommerce_app_w/view/widget/login/customeauthbutton.dart';
import 'package:ecommerce_app_w/view/widget/login/logoauth.dart';
import 'package:ecommerce_app_w/view/widget/login/textbody.dart';
import 'package:ecommerce_app_w/view/widget/login/texttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl controller =
        Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          "Reset Password",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        color: AppColor.backgroundcolor,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Center(
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                const TextTitle(
                  title: "New password",
                ),
                const SizedBox(height: 30),
                const TextBody(
                  bodyText: "please enter your new password",
                ),
                const SizedBox(height: 30),
                AuthTextField(
                    validator: (val) {
                      return validInput(val!, 8, 40, "Password");
                    },
                    mycontroller: controller.password,
                    hinttext: "Enter your password",
                    iconData: Icons.mail_outline,
                    labeltext: "password", isNumber: false,),
                const SizedBox(height: 30),
                AuthTextField(
                    validator: (val) {
                      return validInput(val!, 8, 40, "Password");
                    },
                    mycontroller: controller.rePassword,
                    hinttext: "Enter your re-password",
                    iconData: Icons.mail_outline,
                    labeltext: "Re-password", isNumber: false,),
                const SizedBox(height: 35),
                CustomAuthButton(
                  text: "check",
                  onPressed: () {
                    controller.toSuccessResetPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
