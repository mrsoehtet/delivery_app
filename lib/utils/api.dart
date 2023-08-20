import 'package:http/http.dart' as http;

class API {
  API(_);

  static var client = http.Client();

  //static const String mainUrl = "https://newbrdemo.icgwebdevelopment.com/api";
  static const String mainUrl = "https://newbrdemo.icgwebdevelopment.com/api";
  static const String mainUrlForUri = "newbrdemo.icgwebdevelopment.com";

  static const String movieListUrl =
      "$mainUrl/title/get-videos?tconst=tt0944947&limit=7&region=MM";
  static const String adsListUrl = "$mainUrl/advertises";

  //Contact
  static const String contactUrl = "$mainUrl/contact";

  //Joker App Play Store Link
  static const String playStoreLink =
      "https://play.google.com/store/apps/details?id=com.lucky.seven_mm";

  //Auth
  static const String loginUrl = "$mainUrl/apilogin";
  static const String profileUrl = "$mainUrl/delimens/profile";
  static const String passwordResetUrl = "$mainUrl/delimens/changepassword";
  static const String logout = "$mainUrl/delimens/logout";
  static const String editProfile = "$mainUrl/delimens/edit";

  static const String signUpUrl = "$mainUrl/register";
  static const String signUpFirstStepUrl = "$mainUrl/create-login";
  static const String referralCodeCheck = "$mainUrl/verify-token";
  //Request, Forgot, Reset Password
  // static const String passwordResetUrl = "$mainUrl/delimens/changepassword";
  static const String forgetPassword = "$mainUrl/password/create";
  static const String resetPassword = "$mainUrl/password/reset";
  static const String checkToken = "$mainUrl/verify";
  // static const String logout = "$mainUrl/delimens/logout";

  //Profile
  // static const String profileUrl = "$mainUrl/delimens/profile";
  // static const String editProfile = "$mainUrl/delimens/edit";
}
