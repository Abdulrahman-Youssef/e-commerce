import 'package:ecommerce_app_w/controller/auth/CheckEmail_Controller.dart';
import 'package:ecommerce_app_w/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/login/Authtextfield.dart';
import 'package:ecommerce_app_w/view/widget/login/customeauthbutton.dart';
import 'package:ecommerce_app_w/view/widget/login/textbody.dart';
import 'package:ecommerce_app_w/view/widget/login/texttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImpl controller = Get.put(CheckEmailControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          "Check email",
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
          child: ListView(
            children: [
              const TextTitle(
                title: "check email",
              ),
              const SizedBox(
                height: 20,
              ),
              const TextBody(
                bodyText: "enter your email and wait for the verification code",
              ),
              const SizedBox(height: 30),
              AuthTextField(
                  mycontroller: controller.email,
                  hinttext: "Enter your email",
                  iconData: Icons.mail_outline,
                  labeltext: "Email"),
              const SizedBox(
                height: 40,
              ),
              CustomAuthButton(
                text: "check",
                onPressed: () {
                  controller.toSuccessSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
