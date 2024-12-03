import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/core/middlewere/mymiddleware.dart';
import 'package:ecommerce_app_w/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  getData();

  initData();

  removeFromFavorites(int itemid);
}

class FavoriteControllerImp extends FavoriteController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices services = Get.find();
  List favorites = [].obs;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  initData() {
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData(
        services.sharedpref.getInt(AppSharedPrefKeys.userID).toString());
    print("response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        favorites.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFromFavorites(itemID) async {
    await favoriteData.addRemove(
        services.sharedpref.getInt(AppSharedPrefKeys.userID).toString(),
        itemID.toString());

    for (var item in favorites) {
      if (item["items_id"] == itemID) {
        item["favorite"] = item["favorite"] == 1 ? 0 : 1;
        favorites.removeWhere((f) => f["items_id"] == itemID);
        break;
      }
    }
  }
}
