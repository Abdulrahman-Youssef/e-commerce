import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';
import 'package:http/http.dart';

class VerifyCodeData {
  late Crud curd;

  VerifyCodeData(this.curd);

  postData(String email, String verifyCode) async {
    var response = await curd.postData(
        AppLink.verifycode, {"email": email, "verifycode": verifyCode});
    return response.fold((l) => l, (r) => r);
  }
}
