import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/model/pickupRequest/request/request.dart';
import 'package:delivery_app/screen/home.dart';
import 'package:delivery_app/screen/pickup/process/pickupProcess.dart';
import 'package:delivery_app/appStart/preScreen.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/isLoginController.dart';
import '../controller/naviController.dart';
import '../httpServic/httpException.dart';
import '../httpServic/httpResponseHelper.dart';

import '../model/pickupRequest/requestList/requestList.dart';
import '../utils/global.dart';
import '../utils/sharedPref.dart';

final requestServiceProvider =
    FutureProvider.autoDispose<List<Request>>((ref) async {
  final service = ref.watch(requestProvider);
  final requestData = await service.getRequestInfo();
  return requestData;
});

final requestProvider = Provider((ref) => RequestService(Dio()));

class RequestService {
  RequestService(this._dio);
  Dio _dio;

  Request? requestData;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getRequestInfo() async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.get(
        APIURL.pickupRequest,
        options: Options(
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': '$token',
          },
        ),
      );

      final request = RequestList.fromJson(response.data);
      // if (response.data['status'] = true) {
      //   print(response.data['data']);
      // }
      //print(response.data['data']);
      print(request.data);

      return request.data;

      // if (response.statusCode == 200) {
      //   //  final Map<String, dynamic> resData = json.decode(response.data);

      //   if (response.data['status'] == true) {
      //     print("Response data : ${response.data['data']}");
      //   }
      //   return response.data;

      // }

      // else {
      //   print('Error');
      // }

      // if (request.data == null) {
      //   return [];
      // }

      // requestData.data;
    } on DioError catch (dioError) {
      print("Error Occur $dioError");
      SharedPref.clear();
      isLoginController.logout();
      Global.loginStatus();
      Global.isLogIn = false;
      NaviController.to.currentIndex.value = 2;
      Get.off(() => PreScreen());
      Get.snackbar(
        "Alert",
        "သင်၏ အင်တာနက်လိုင်း အခက်အခဲကြောင့် အကောင့်ပြန်ဝင်ပါ",
        backgroundColor: Colors.redAccent,
      );
    }
  }

  // Future<dynamic> getOrderList() async {
  //   final token = await SharedPref.getData(key: SharedPref.token);
  //   //print(APIURL.pickupRequest );
  //   try {
  //     final response = await http
  //         .get(Uri.parse(APIURL.pickupRequest), headers: <String, String>{
  //       'Accept': 'application/json; charset=UTF-8',
  //       'Authorization': '$token',
  //     });
  //     final jsonData = ReturnResponse(response);
  //     final requestData = RequestList.fromJson(jsonData);
  //     return requestData.data;
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
}
