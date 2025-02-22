import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';



Future<String> determineServerUrl() async {
   const String serverEmulator = "http://10.0.2.2/ecommerce_w";
   const String serverPhysicalDevice = "http://192.168.1.2/ecommerce_w";

  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      // If isPhysicalDevice is true, then it’s a real device.
      if (androidInfo.isPhysicalDevice) {
       return serverPhysicalDevice ;
      } else {
        return serverEmulator;
      }
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.isPhysicalDevice) {
        return serverPhysicalDevice;
      } else {
        return serverEmulator;
      }
    } else {
      // For other platforms, default to real device connection.
      return serverPhysicalDevice;
    }
  } catch (e) {
    // In case of error, fall back to a safe default.
    return serverPhysicalDevice;
  }
}