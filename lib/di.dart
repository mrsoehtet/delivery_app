import 'package:delivery_app/controller/naviController.dart';
import 'package:get/get.dart';

import 'controller/getController.dart';

void configure() {
  Get.put<OrderController>(OrderController());
  Get.put<NaviController>(NaviController());
  //Get.put<AppLanguageController>(AppLanguageController());
}
