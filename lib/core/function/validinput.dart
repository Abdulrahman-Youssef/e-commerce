import 'package:get/get.dart';

validInput(String val,int min,int max,String type) {
  if (type == "UserName") {
    if (!GetUtils.isUsername(val)) {
      return "not valid UserName";
    }
  }

  if (type == "Email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }



  if (type == "PhoneNumber") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid Phone number";
    }
  }

  if(val.length < min){
    return "value cant be less then $min letters";
  }


  if(val.length > max){
    return "value  cant be then $max letters";
  }
  if(val.isEmpty){
    return "the value can't be empty";
  }

}
