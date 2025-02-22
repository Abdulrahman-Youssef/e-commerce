import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';

class LoginData {
  late Crud crud;
  LoginData(this.crud);

  postData(String email , String password) async {
    var response = await crud.postData(AppLink.login, {
      "email"  : email  ,
      "password" : password
    });
    return response.fold((l) => l, (r) => r); // ??
  }
}


