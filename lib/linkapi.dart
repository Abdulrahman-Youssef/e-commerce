class AppLink {
  // servers for diff proposes
  // static const String server = "http://localehost/ecommerce_w";
  static const String serverEmulator = "http://10.0.2.2/ecommerce_w";
  static const String serverPhysicalDevice = "http://192.168.1.2/ecommerce_w";
  static const String server = serverPhysicalDevice;

  //pages
  static const String test = "$server/test.php";
  static const String home = "$server/home.php";
  static const String search = "$server/search.php";


  // auth folder
  static const String authFolder = "$server/auth";
  static const String signup = "$authFolder/signup.php";
  static const String verifyCodeSignUp = "$authFolder/verifycode.php";
  static const String login = "$authFolder/login.php";
  static const String reSendCode = "$authFolder/resendcode.php";

  // forgetPassword folder
  static const String forgetPasswordFolder = "$server/forgetpassword";
  static const String checkEmail = "$forgetPasswordFolder/checkemail.php";
  static const String verifycode = "$forgetPasswordFolder/verifycode.php";
  static const String resetpassword = "$forgetPasswordFolder/resetpassword.php";

  //itemsFolder
  static const String itemsFolder = "$server/items";
  static const String items= "$itemsFolder/items.php";

  //favorite folder
  static const String favoriteFolder = "$server/favorite";
  static const String addRemove = "$favoriteFolder/addremove.php";
  static const String gettable = "$favoriteFolder/gettable.php";

  // cart folder
  static const String cartFolder = "$server/cart";
  static const String cartPutItem = "$cartFolder/putItem.php";
  static const String cartRemoveItem = "$cartFolder/removeItem.php";
  static const String cartGetItems = "$cartFolder/getItems.php";


  // address address




}
