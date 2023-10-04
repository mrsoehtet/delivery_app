import 'package:delivery_app/model/login/login/user.dart';
import 'package:delivery_app/model/login/profile/profile.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../controller/naviController.dart';

import '../utils/global.dart';
import '../utils/sharedPref.dart';

final profileServiceProvider = FutureProvider.autoDispose<User?>((ref) async {
  final service = ref.watch(profileProvider);
  final requestData = await service.getUserInfo();
  return requestData;
});

final profileProvider = Provider((ref) => ProfileService(Dio()));

class ProfileService {
  ProfileService(this._dio);
  Dio _dio;

  User? userData;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getUserInfo() async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.get(
        APIURL.getProfile,
        options: Options(
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': '$token',
          },
        ),
      );

      final userInfo = Profile.fromJson(response.data);
      // print(response.data);

      print(userInfo.data);

      return userInfo.data;
    } on DioError catch (dioError) {
      print("Error Occur $dioError");
      SharedPref.clear();
      isLoginController.logout();
      Global.loginStatus();
      Global.isLogIn = false;
      NaviController.to.currentIndex.value = 4;
      //  Get.off(() => PreScreen());
      Get.snackbar(
        "Alert",
        "သင်၏ အင်တာနက်လိုင်း အခက်အခဲကြောင့် အကောင့်ပြန်ဝင်ပါ",
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
