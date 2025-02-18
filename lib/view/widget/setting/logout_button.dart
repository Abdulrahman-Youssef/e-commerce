import 'package:ecommerce_app_w/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingControllerImpl>(
      builder: (controller) {
        return ListTile(
          leading: const Icon(Icons.exit_to_app_outlined),
          title: const Text("Logout"),
          onTap: () async {
            final result = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirm'),
                  content: const Text('Do you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
            if (result == true) {
              controller.logout(result == true);
            }
          },
        );
      }
    );
  }
}
