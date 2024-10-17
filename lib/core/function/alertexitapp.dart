import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp(){
   Get.defaultDialog(
    title: "exit app ?",
        middleText: "are you sure you want to get of of the app :(",
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: const Text("confirm")),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: const Text("cancel"))
    ]
  );
   return Future.value(true);
}