import 'package:delivery_app/utils/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/order.dart';

class OrderController extends GetxController {
  List<Order> orders = [
    Order(id: 0, pickup: "To Pickup (Assigned)", color: Constants.realRed),
    Order(id: 1, pickup: "Pickup Process", color: Constants.yellow),
    Order(id: 0, pickup: "Delivery Process", color: Constants.realBlue),
    Order(id: 10, pickup: "Total Done", color: Constants.green),
  ];
}
