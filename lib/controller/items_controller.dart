import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce_app_w/data/datasource/remote/items_data.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:ecommerce_app_w/view/screen/showitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

abstract class ItemsController extends GetxController {
  initialData();

  changeSelectedCategory(int selectedCategory);

  getItems();

  toShowItem(ItemsModel item);

  addToFavorite(int itemID);
}

class ItemsControllerImp extends ItemsController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  Icon favoriteIcon = const Icon(Icons.favorite_border);

  // bool isFavorite = false;
  List categories = [];
  List items = [];
  int? selectedCategory;
  late int userID;

  late StatusRequest statusRequest;

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    // print("selected category  is : ${selectedCategory!}");
    // print("selected category sended is : ${categories[selectedCategory!]["categories_id"]}");
    var response = await itemsData.getData(
        categories[selectedCategory!]["categories_id"].toString(),
        userID.toString());
    print("items response :  $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        items.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
    getItems();
  }

  @override
  void changeSelectedCategory(int selectedCategory) {
    this.selectedCategory = selectedCategory;
    // to clear the items to not stack
    items.clear();
    getItems();
    update();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    // isn't that better replacing another request to data base (getItems)
    // items = Get.arguments["items"];
    selectedCategory = Get.arguments["selectedCategory"];
    userID = myServices.sharedpref.getInt(AppSharedPrefKeys.userID)!;
    print("items_controller : user ID ${userID}");
  }

  @override
  void addToFavorite(itemID) async
  {
     await favoriteData.addRemove(userID.toString(), itemID.toString());
    for (var item in items) {
      if (item["items_id"] == itemID) {
        item["favorite"] = item["favorite"] == 1 ? 0 : 1;
        break;
      }
    }

    update();
  }

  // void addToFavorite(itemID) async {
  //   await favoriteData.postData(userID.toString(), itemID.toString());
  //
  //   // Update the favorite status locally for the specific item
  //   for (var item in items) {
  //     if (item["items_id"] == itemID) {
  //       item["favorite"] = item["favorite"] == 1 ? 0 : 1;
  //       break;
  //     }
  //   }
  //
  //   update(); // Notify GetBuilder to rebuild
  // }


  void changeFavoriteIcon() {
    update();
  }

  @override
  toShowItem(item) {
    Get.toNamed(AppRoutes.showItems, arguments: {
      "item": item,
    });
  }
}
