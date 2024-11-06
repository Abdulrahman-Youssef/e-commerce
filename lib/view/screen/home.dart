import 'package:ecommerce_app_w/controller/home_controller.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/main.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    HomeControllerImplementation controller = Get.put(HomeControllerImplementation());
    MyServices myServices = Get.find();


    return  Scaffold(
      body: Container(
        child: TextFormField(
          
        ),
      )
    );
  }
}
