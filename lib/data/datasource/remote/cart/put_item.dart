import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';


class CartData {
  late Crud crud;

  CartData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.cartPutItem,
        {
          // "userid" :  ,
          // "itemid" :  ,
        });
    return response.fold((l) => l, (r) => r); //?
  }
}