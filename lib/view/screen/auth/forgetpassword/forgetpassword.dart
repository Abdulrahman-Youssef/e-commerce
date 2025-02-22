import 'package:ecommerce_app_w/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/function/validinput.dart';
import 'package:ecommerce_app_w/view/widget/login/Authtextfield.dart';
import 'package:ecommerce_app_w/view/widget/login/customeauthbutton.dart';
import 'package:ecommerce_app_w/view/widget/login/textbody.dart';
import 'package:ecommerce_app_w/view/widget/login/texttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImpl controller =
        Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          "Forget Password",
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
                  validator: (val) {
                    return validInput(val!, 5, 40, "Email");
                  },
                  mycontroller: controller.email,
                  hinttext: "Enter your email",
                  iconData: Icons.mail_outline,
                  labeltext: "Email",
                  isNumber: false,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomAuthButton(
                  text: "check",
                  onPressed:() async {
                    bool result= await controller.checkEmail();
                    if(result){
                      controller.toVerfiyCode();
                    }
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
