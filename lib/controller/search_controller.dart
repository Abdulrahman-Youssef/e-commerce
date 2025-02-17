import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce_app_w/data/datasource/remote/search_data.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  toShowItem(ItemsModel item);
}

class SearchControllerImpl extends SearchController {
  List<ItemsModel> items = <ItemsModel>[].obs;
  MyServices myServices = Get.find();
  SearchData searchData = SearchData(Get.find());
  FavoriteData favoriteData = FavoriteData(Get.find());
  late StatusRequest statusRequest = StatusRequest.loading;



  getData(String searchWord) async {
    print("searchWord in search_controller = $searchWord");
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData(myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString() , searchWord);
    print("response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        items.assignAll((response["data"] as List)
            .map((e) => ItemsModel.fromJson(e))
            .toList());
      } else {
        statusRequest = StatusRequest.failure;
        print("clear the cartItems ");
        items.clear();
      }
    } else {
      print("clear the cartItems ");
      items.clear();
    }
    update();
  }


  @override
  void onInit() async {
    super.onInit();
    await getData( Get.arguments["searchWord"]);
  }

  @override
  toShowItem(ItemsModel item) {
    Get.toNamed(AppRoutes.showItems, arguments: {
      "item": item,
    });
  }

  void addToFavorite(int itemID) async
  {
    await favoriteData.addRemove(myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString(), itemID.toString());
    for (var item in items) {
      if (item.itemsId == itemID) {
        item.favorite = item.favorite == 1 ? 0 : 1;
        break;
      }
    }
    update();
  }


}
