import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';

class SignupData {
  late Crud crud;
  SignupData(this.crud);

  postData(String username , String password , String email , String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "userrname" : username,
      "password" : password ,
      "email"  : email  ,
      "phone" : phone
    });
    return response.fold((l) => l, (r) => r); //?
  }
}


