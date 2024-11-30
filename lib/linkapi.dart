class AppLink {
  // servers for diff proposes
  // static const String server = "http://localehost/ecommerce_w";
  static const String serverEmulator = "http://10.0.2.2/ecommerce_w";
  static const String serverPhysicalDevice = "http://192.168.1.2/ecommerce_w";
  static const String server = serverPhysicalDevice;

  //pages
  static const String test = "$server/test.php";
  static const String home = "$server/home.php";


  // auth folder
  static const String authFolder = "$server/auth";
  static const String signup = "$authFolder/signup.php";
  static const String verifyCodeSignUp = "$authFolder/verifycode.php";
  static const String login = "$authFolder/login.php";

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


}
