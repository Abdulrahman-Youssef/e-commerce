import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/setting_controller.dart';

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingControllerImpl>(builder: (controller) {

      return ListTile(
        leading: Icon(Icons.notifications_on_outlined),
        trailing: Switch(
          value:controller.notification ,
          onChanged: (bool value) {
            print("$value + ${controller.notification}");
            controller.changeNotificationSwitch(controller.notification);
          },
        ),
        title: const Text("Notification"),
      );
    });
  }
}
