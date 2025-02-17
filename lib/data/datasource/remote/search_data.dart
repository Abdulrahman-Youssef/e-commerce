import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';
import 'package:get/get.dart';




class SearchData {
  late Crud crud;

  SearchData(this.crud);

  getData( String userID,  String searchWord) async {
    var response = await crud.postData(AppLink.search, {
      "userID" :userID,
      "searchWord" :searchWord,
    });
    return response.fold((l) => l, (r) => r); //?
  }
}