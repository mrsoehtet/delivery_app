import 'dart:convert';

import 'package:delivery_app/model/pickuped.dart';

import 'constants.dart';
import 'package:http/http.dart' as http;

class Api {
  // static Future<bool> getPickUpRequest() async {
  //   Uri uri = Uri.parse("${APIURL.pickupRequest}");
  //   var resStr = await http.get(uri);
  //   var response = jsonDecode(resStr.body);
  //   var pickupList = response["data"] as List;
  //   // List<PickupRequest> requests =
  //   APIURL.requests =
  //       pickupList.map((request) => PickupRequest.fromJson(request)).toList();
  //   // requests.forEach((request) {
  //   //   request.name;
  //   //   print("*******");
  //   // });
  //   print(response["data"]);
  //   return true;
  // }

  static Future<bool> getPickUpWay() async {
    Uri uri = Uri.parse("${APIURL.pickedup}");
    var resStr = await http.get(uri);
    var response = jsonDecode(resStr.body);
    if (response['data']) {
      var pickedup = response["data"] as List;
//List<PickupRequest> requests
      APIURL.pickups = pickedup
          .map((way) => PickedUp.fromJson(way))
          .cast<PickedUp>()
          .toList();
    }

    // print(response["data"]);
    return response['data'];
  }
}
