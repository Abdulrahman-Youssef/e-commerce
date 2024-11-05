import 'package:ecommerce_app_w/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedpref;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedpref = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
    await Get.putAsync(() => MyServices().init());
}
