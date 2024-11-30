import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';


class ItemsData {
  late Crud crud;

  ItemsData(this.crud);

  getData(String categoryID , String userid) async {
    var response = await crud.postData(AppLink.items, {
      "categoryID": categoryID,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r); //?
  }
}