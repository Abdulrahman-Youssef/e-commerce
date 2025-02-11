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

  putItem(String userid , String itemid  , {String itemCount = "1"}) async {
    var response = await crud.postData(AppLink.cartPutItem,
        {
          "userid" :userid,
          "itemid" :itemid,
          "itemCount":itemCount,
        });
    return response.fold((l) => l, (r) => r); //?
  }

  removeItem(String userid , String cartID , String itemCount ) async {

    var response = await crud.postData(AppLink.cartRemoveItem,
        {
          "userid" : userid,
          "cartID" : cartID,
          "itemCount": itemCount,
        });
    return response.fold((l) => l, (r) => r); //?
  }

}