import 'package:get/get.dart';

import '../utils/sharedPref.dart';

class IsLoginController extends GetxController {
  var islogin = false.obs;

  void login() {
    islogin(true);
  }

  void logout() {
    islogin(false);
  }

  @override
  void onInit() async {
    var _islogin =
        await SharedPref.getBoolForLoginUser(key: SharedPref.islogin);
    if (_islogin == true) {
      islogin(true);
    } else {
      islogin(false);
    }
    super.onInit();
  }
}
