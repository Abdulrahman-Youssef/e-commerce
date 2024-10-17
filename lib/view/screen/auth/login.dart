import 'package:ecommerce_app_w/controller/auth/login_controller.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl controller = Get.put(LoginControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          "login",
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
            key: controller.fromState,
            child: ListView(
              children: [
                const LogoAuth(),
                const TextTitle(
                  title: "Welcome back",
                ),
                const SizedBox(height: 10),
                const TextBody(
                  bodyText:
                      "Login with your email and password or with your social media",
                ),
                const SizedBox(
                  height: 40,
                ),
                AuthTextField(
                    validator: (val) {
                      return validInput(val!, 5, 100, "Email");
                    },
                    mycontroller: controller.email,
                    hinttext: "Enter your email",
                    iconData: Icons.mail_outline,
                    labeltext: "Email"),
                const SizedBox(height: 35),
                AuthTextField(
                    validator: (val) {
                      return validInput(val!, 8, 30, "Password");
                    },
                    mycontroller: controller.password,
                    hinttext: "Enter your password",
                    iconData: Icons.lock_outline,
                    labeltext: "Password"),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      controller.toForgetPassword();
                    },
                    child: const Text(
                      "Forget the password",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                CustomAuthButton(
                  text: "Login",
                  onPressed: () {
                    controller.login();
                  },
                ),
                CustomAuthText(
                  text1: "Don't have account ? ",
                  text2: "Sign Up",
                  onTap: () {
                    controller.toSignUp();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
