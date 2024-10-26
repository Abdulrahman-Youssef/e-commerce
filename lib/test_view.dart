import 'package:ecommerce_app_w/controller/test_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataview.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("Title"),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
          ),
        );
      }),
    );
  }
}
