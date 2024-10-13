import 'package:ecommerce_app_w/controller/auth/signup_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/login/Authtextfield.dart';
import 'package:ecommerce_app_w/view/widget/login/customauthtext.dart';
import 'package:ecommerce_app_w/view/widget/login/customeauthbutton.dart';
import 'package:ecommerce_app_w/view/widget/login/logoauth.dart';
import 'package:ecommerce_app_w/view/widget/login/textbody.dart';
import 'package:ecommerce_app_w/view/widget/login/texttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImpl controller = Get.put(SignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          "Sign Up",
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
                title: "Welcome",
              ),
              const SizedBox(height: 10),
              const TextBody(
                bodyText:
                    "Sign UP with your email and password or with your social media",
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                  mycontroller: controller.name,
                  hinttext: "Enter your name",
                  iconData: Icons.person_outline,
                  labeltext: "Name"),
              const SizedBox(height: 35),
              AuthTextField(
                  mycontroller: controller.phone,
                  hinttext: "Enter your Phone",
                  iconData: Icons.phone_outlined,
                  labeltext: "Phone"),
              const SizedBox(height: 35),
              AuthTextField(
                  mycontroller: controller.email,
                  hinttext: "Enter your email",
                  iconData: Icons.mail_outline,
                  labeltext: "Email"),
              const SizedBox(height: 35),
              AuthTextField(
                  mycontroller: controller.password,
                  hinttext: "Enter your password",
                  iconData: Icons.lock_outline,
                  labeltext: "Password"),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget the password",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              const CustomAuthButton(
                text: "Login",
              ),
              CustomAuthText(
                text1: "I have account already ",
                text2: "Sign Up",
                onTap: () {
                  controller.toLogin();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
