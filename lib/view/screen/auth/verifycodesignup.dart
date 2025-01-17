import 'package:ecommerce_app_w/controller/auth/verifycodesignup_controller.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/login/textbody.dart';
import 'package:ecommerce_app_w/view/widget/login/texttitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'dart:async';

class VerfiyCodeSignUp extends StatefulWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  _VerfiyCodeSignUpState createState() => _VerfiyCodeSignUpState();
}

class _VerfiyCodeSignUpState extends State<VerfiyCodeSignUp> {
  final VerifyCodeSignUpControllerImpl controller =
      Get.put(VerifyCodeSignUpControllerImpl());

  bool _isButtonEnabled = true;
  int _countdown = 30;
  Timer? _timer;

  void _startCooldown() {
    setState(() {
      _isButtonEnabled = false;
      _countdown = 30;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _isButtonEnabled = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        title: Text(
          "Verification Code",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImpl>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(
                child: Text("Loading"),
              )
            : Container(
                color: AppColor.backgroundcolor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Center(
                  child: ListView(
                    children: [
                      const TextTitle(
                        title: "Check Code",
                      ),
                      const SizedBox(height: 15),
                      const TextBody(
                        bodyText:
                            "Enter the verification code that has been sent to your email address.",
                      ),
                      const SizedBox(height: 13),
                      OtpTextField(
                        numberOfFields: 5,
                        borderWidth: 3,
                        borderRadius: BorderRadius.circular(15),
                        borderColor: const Color(0xFF512DA8),
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          controller.verifyCode = verificationCode;
                          controller.toSuccessSignUp();
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          TextButton(
                            onPressed: _isButtonEnabled
                                ? () {
                                    controller.reSendCode();
                                    _startCooldown();
                                  }
                                : null,
                            child: Text(
                              _isButtonEnabled
                                  ? "Resend code"
                                  : "Wait $_countdown s",
                              style: TextStyle(
                                color: _isButtonEnabled
                                    ? Colors.blueAccent
                                    : Colors.grey,
                                fontSize: 14,
                                decoration: _isButtonEnabled
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
