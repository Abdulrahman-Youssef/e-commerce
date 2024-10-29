class AppLink {
  // servers for diff proposes
  static const String server = "http://localehost/ecommerce_w";
  static const String serverEmulator = "http://10.0.2.2/ecommerce_w";
  static const String serverPhysicalDevice = "http://192.168.1.2/ecommerce_w";
  //pages 
  static const String test = "$serverEmulator/test.php";
  // auth folder
   static const  String authFolder = "$serverEmulator/auth";
  static const String signup = "$authFolder/signup.php";
  static const String verifyCodeSignUp = "$authFolder/verifycode.php";

}