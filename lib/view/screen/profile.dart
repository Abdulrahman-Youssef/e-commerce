import 'package:ecommerce_app_w/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            height: Get.height / 4,
            color: AppColor.primaryColor,
          ),
          Positioned(
            right: Get.width / 2.7,
            height: Get.height / 2,
            width: Get.width / 4,
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              // backgroundImage: ,
            ),
          ),
        ],
      ),
    );
  }
}
