import 'package:ecommerce_app_w/core/class/statusRequest.dart';

StatusRequest handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    if (response["status"] == "success") {
      return StatusRequest.success;
    } else {
      return StatusRequest.failure;
    }
  }
}
