import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RememberController extends GetxController {
  final box = GetStorage();
  final key = 'rememberToken';
  final nameKey = 'nameKey';
  final passwordKey = 'passwordKey';

  @override
  void onInit() {
    super.onInit();
  }

  void saveRememberUserName({required String username}) {
    box.write(nameKey, username);
  }

  void saveRememberPassword({required String password}) {
    box.write(passwordKey, password);
  }

  String? readRememberUsername() {
    return box.read(nameKey);
  }

  String? readRememberPassword() {
    return box.read(passwordKey);
  }

  String? removeRememberUsername() {
    box.remove(nameKey);
    return null;
  }

  String? removeRememberPassword() {
    box.remove(passwordKey);
    return null;
  }

  // void removeRememberToken(){
  //   box.remove(key);
  // }
}
