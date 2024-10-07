import 'package:ecommerce_app_w/view/screen/login.dart';
import 'package:flutter/cupertino.dart';

import 'core/constant/approutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => const Login(),
};
