import 'package:get/get.dart';

import 'controller/getController.dart';

void configure() {
  Get.put<OrderController>(OrderController());
  //Get.put<AppLanguageController>(AppLanguageController());
}
