class AppLink {
  // servers for diff proposes
  static const String server = "http://localehost/ecommerce_w";
  static const String serverEmulator = "http://10.0.2.2/ecommerce_w";
  static const String serverPhysicalDevice = "http://192.168.1.2/ecommerce_w";
  //pages 
  static const String test = "$serverEmulator/test.php";
  static const String home = "$serverEmulator/home.php";
  // auth folder
   static const  String authFolder = "$serverEmulator/auth";
  static const String signup = "$authFolder/signup.php";
  static const String verifyCodeSignUp = "$authFolder/verifycode.php";
  static const String login = "$authFolder/login.php";

  // forgetpassowrd folder
  static const String forgetPasswordFolder = "$serverEmulator/forgetpassword";
  static const String checkEmail = "$forgetPasswordFolder/checkemail.php";
  static const String verifycode = "$forgetPasswordFolder/verifycode.php";
  static const String resetpassword = "$forgetPasswordFolder/resetpassword.php";

}