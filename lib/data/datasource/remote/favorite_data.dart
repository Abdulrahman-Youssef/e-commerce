import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';

class FavoriteData {
  late Crud crud;

  FavoriteData(this.crud);

  addRemove(String userid, String itemid) async {
    var response = await crud.postData(AppLink.addRemove, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(String userid) async {
    var response = await crud.postData(AppLink.gettable,
        {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
