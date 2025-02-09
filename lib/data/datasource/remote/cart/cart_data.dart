import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';


class CartData {
  late Crud crud;

  CartData(this.crud);

  getItems(String userid) async {
    var response = await crud.postData(AppLink.cartGetItems, {
      "userid" : userid,
    });
    return response.fold((l) => l, (r) => r); //?
  }

  putItem(String userid , String itemid ) async {
    var response = await crud.postData(AppLink.cartPutItem,
        {
          "userid" :userid,
          "itemid" :itemid,
        });
    return response.fold((l) => l, (r) => r); //?
  }

  removeItem(String userid , String cartID) async {
    var response = await crud.postData(AppLink.cartRemoveItem,
        {
          "userid" : userid,
          "cartID" : cartID,
        });
    return response.fold((l) => l, (r) => r); //?
  }

}