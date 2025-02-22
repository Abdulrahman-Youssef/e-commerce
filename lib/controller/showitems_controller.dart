import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

abstract class ShowItemsController extends GetxController {

  putItemToCard(int itemID);

}

class ShowItemsControllerImpl extends ShowItemsController {
 late  ItemsModel item;
 CartControllerImpl cartControllerImpl = Get.put(CartControllerImpl());


  initData(){
    item = Get.arguments["item"];
  }



  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  putItemToCard(int itemID) {
   cartControllerImpl.putItem(itemID, 1);
  }
}