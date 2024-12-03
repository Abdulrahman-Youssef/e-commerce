import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/function/checkinternet.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    // try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("curd: response ${response.statusCode}");
          Map responseBody = jsonDecode(response.body);
          print("crud: responseBody =  $responseBody");
          return Right(responseBody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    }
    // catch (_) {
    //   return const Left(StatusRequest.serverException);
    // }
  }
// }
