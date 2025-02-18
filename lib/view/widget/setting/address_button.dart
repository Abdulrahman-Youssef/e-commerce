import 'package:ecommerce_app_w/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingControllerImpl>(
        builder: (controller) {
          return ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("address"),
            onTap: controller.toAddressScreen,
          );
        }
    );
  }
  }

