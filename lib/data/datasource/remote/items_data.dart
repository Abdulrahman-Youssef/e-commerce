import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';


class ItemsData {
  late Crud crud;

  ItemsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.items, {});
    return response.fold((l) => l, (r) => r); //?
  }
}