import 'dart:convert';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:delivery_app/model/pickupRequest/request/request.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/order.dart';
import '../utils/sharedPref.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  static var selectedImagePath = "".obs;
  static var selectedImageAvatarPath = "".obs;
  static var selectedImageSize = ''.obs;
  List<Request> nullList = [];
  List<Request> notnullList = [];

  Map<String?, List<Request>>? categoryData;
  List<String?> categoryList = [];
  static File? _image;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  static Future<String?> uploadImage(filename, url) async {
    print("Hello from profile Image Upload $filename");
    var res;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    final token = await SharedPref.getData(key: SharedPref.token);
    request.headers['Authorization'] = token!;
    request.headers['Accept'] = "application/json";
    request.fields['id'] = 1.toString();
    request.files.add(await http.MultipartFile.fromPath('photo', filename));

    print("Token : $request");
    //var res = await request.send();
    //await request.send().then((response) => print(response));
    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode(value);
        print("ResData : $resData");
        res = resData['message'];
        // setState(() {
        //   //uploadImage = imageRes.path;
        // });
      });
    }).catchError((e) {
      print(e);
    });
    print(res);

    return res;
  }

  static getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker()
        .getImage(source: imageSource, maxHeight: 300, maxWidth: 300);
    print("File path is  *************** ${pickedFile!.path}");
    var res = await uploadImage(pickedFile.path, APIURL.addWayWithPhoto);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      //_image= File(pickedFile.path);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
    print(res);
  }

  static getAvatorImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    var res = await uploadImage(pickedFile!.path, APIURL.updateAvatar);
    if (pickedFile != null) {
      selectedImageAvatarPath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
    print(res);
  }

  void groupPickup(List<Request> pickup) {
    final groups = groupBy(pickup, (Request r) {
      return r.status;
    });
    categoryData = groups;
    categoryList = groups.keys.toList();
    print(categoryList);

    for (var i = 0; i < categoryList.length; i++) {
      if (categoryList[i] == null) {
        nullList.addAll(categoryData![categoryList[i]]!);
      } else {
        notnullList.addAll(categoryData![categoryList[i]]!);
      }
    }
  }

  List<Order> orders = [
    Order(id: 0, pickup: "To Pickup (Assigned)", color: Constants.realRed),
    Order(id: 1, pickup: "Pickup Process", color: Constants.yellow),
    Order(id: 0, pickup: "Delivery Process", color: Constants.realBlue),
    Order(id: 10, pickup: "Total Done", color: Constants.green),
  ];
}
