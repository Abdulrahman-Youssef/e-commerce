import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();

  changeSelectedCategory(int selectedCategory);

  getItems();
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());

  List categories = [];
  List items = [];
  int? selectedCategory;

  late StatusRequest statusRequest;

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData();
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
    getItems();
    initialData();
   }

  @override
  changeSelectedCategory(int selectedCategory) {
    this.selectedCategory = selectedCategory;
    update();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    // isn't that better replacing another request to data base (getItems)
    // items = Get.arguments["items"];
    selectedCategory = Get.arguments["selectedCategory"];
  }
}
