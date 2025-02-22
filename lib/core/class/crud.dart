// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:ecommerce_app_w/core/class/statusRequest.dart';
// import 'package:ecommerce_app_w/core/function/checkinternet.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//






import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    // Check internet connection
    bool isConnected = await checkinternet();
    if (!isConnected) {
      return const Left(StatusRequest.offlineFailure);
    }

    try {
      // Make the HTTP POST request
      var response = await http.post(Uri.parse(linkurl), body: data);

      // Log the response status code and body for debugging
      print("Crud: Response Status Code = ${response.statusCode}");
      print("Crud: Response Body = ${response.body}");

      // Check if the response status code is successful
      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          // Decode the JSON response
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } catch (e) {
          // Handle JSON decoding errors
          print("Crud: JSON Decoding Error = $e");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        // Handle non-successful status codes
        return const Left(StatusRequest.serverFailure);
      }
    } catch (e) {
      // Handle network-related exceptions (e.g., timeouts, connection errors)
      print("Crud: Network Error = $e");
      return const Left(StatusRequest.serverException);
    }
  }
}














//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     // try {
//       if (await checkinternet()) {
//         var response = await http.post(Uri.parse(linkurl), body: data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           print("curd: response ${response.statusCode}");
//           Map responseBody = jsonDecode(response.body);
//           print("crud: responseBody =  $responseBody");
//           return Right(responseBody);
//         } else {
//           return left(StatusRequest.serverFailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlineFailure);
//       }
//     }
//     // catch (_) {
//     //   return const Left(StatusRequest.serverException);
//     // }
//   }
// // }
