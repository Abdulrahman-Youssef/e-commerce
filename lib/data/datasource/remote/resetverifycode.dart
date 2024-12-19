import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';
import 'package:flutter/material.dart';


class ResetVerifyCodeData {
  late Crud crud;

  ResetVerifyCodeData(this.crud);

  restVerfiyCode(String email) async {
    var response = await crud.postData(AppLink.reSendCode, {
      "email" : email,
    });
    return response.fold((l) => l, (r) => r); //?
  }

}