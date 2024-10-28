import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';

class VerifyCodeSignupData {
  late Crud crud;
  VerifyCodeSignupData(this.crud);

  postData(String email , String verifycode) async {
    var response = await crud.postData(AppLink.signup, {
      "email"  : email  ,
      "verifycode" : verifycode
    });
    return response.fold((l) => l, (r) => r); //?
  }
}


