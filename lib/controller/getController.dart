import 'dart:io';

import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/order.dart';

class OrderController extends GetxController {
  static var selectedImagePath = "".obs;
  static var selectedImageSize = ''.obs;

  static getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

  List<Order> orders = [
    Order(id: 0, pickup: "To Pickup (Assigned)", color: Constants.realRed),
    Order(id: 1, pickup: "Pickup Process", color: Constants.yellow),
    Order(id: 0, pickup: "Delivery Process", color: Constants.realBlue),
    Order(id: 10, pickup: "Total Done", color: Constants.green),
  ];
}
