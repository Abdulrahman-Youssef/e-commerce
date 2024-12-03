import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';

class CheckEmailData {
  late Crud curd;

  CheckEmailData(this.curd);

  postData(String email) async {
    var response = await curd.postData(AppLink.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
