import 'package:ecommerce_app_w/controller/address/address_screen_controller.dart';
import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/model/address_model.dart';
import 'package:ecommerce_app_w/view/screen/Checkout/checkoutController.dart';
import 'package:get/get.dart';

abstract class ChooseMethodController extends GetxController {}

class ChooseMethodControllerImpl extends ChooseMethodController {
  AddressScreenControllerImpl addressScreenController =
      AddressScreenControllerImpl();
  late List<AddressModel> address;
  int selectedAddress = -1;

  late StatusRequest statusRequest;
  ShippingMethod shippingMethod = ShippingMethod.delivery;
  PaymentMethod paymentMethod = PaymentMethod.paymentCard;
  bool paymentCard = true;
  bool cash = false;

  bool delivery = true;
  bool pickup = false;

  @override
  void onInit() async {
    super.onInit();
    getAddresses();
  }

  getAddresses() async {
    statusRequest = StatusRequest.loading;
    address = await addressScreenController.getAddresses();
    if (address.isNotEmpty) {
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  _putPaymentMethod() {
    if (paymentMethod == PaymentMethod.paymentCard) {
      paymentCard = true;
      cash = false;
    } else {
      cash = true;
      paymentCard = false;
    }
  }

  _putShippingMethod() {
    if (shippingMethod == ShippingMethod.delivery) {
      delivery = true;
      pickup = false;
    } else {
      pickup = true;
      delivery = false;
    }
  }

  choosePaymentCard() {
    paymentMethod = PaymentMethod.paymentCard;
    _putPaymentMethod();
    update();
  }

  chooseCash() {
    paymentMethod = PaymentMethod.cash;
    _putPaymentMethod();
    update();
  }

  chooseDelivery() {
    shippingMethod = ShippingMethod.delivery;
    _putShippingMethod();
    update();
  }

  choosePickup() {
    shippingMethod = ShippingMethod.pickUp;
    _putShippingMethod();
    selectedAddress = -1;
    update();
  }

  putSelectedAddress(int addressID) {
    selectedAddress = addressID;
    update();
  }

  checkout(){
   if(shippingMethod == ShippingMethod.delivery)
    {
      if (selectedAddress != -1) {

      }
    }




  }

}

enum ShippingMethod {
  delivery,
  pickUp,
}

enum PaymentMethod {
  cash,
  paymentCard,
}
