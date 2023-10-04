import 'package:delivery_app/model/pickupWays/pickupList/pickupList.dart';
import 'package:delivery_app/model/pickupWays/pickup_ways/pickup_ways.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/global.dart';
import '../utils/sharedPref.dart';

// String? id;
// final pickupWaysServiceProvider =
//     FutureProvider.family<List<PickupWays>>((ref) async {
//   final service = ref.watch(pickupProvider);
//   final pickupData = await service.getPickupInfo(id.toString());
//   return pickupData;
// });

final pickupWaysServiceProvider =
    FutureProvider.family<PickupList, String>((ref, id) async {
  final service = ref.watch(pickupProvider);
  final pickupData = await service.getPickupInfo(id);
  return pickupData;
});

final pickupProvider = Provider((ref) => PickupService(Dio()));

class PickupService {
  PickupService(this._dio);
  Dio _dio;

  PickupWays? pickupData;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getPickupInfo(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);
    //print(" Pickup Requet Id ************ $id");

    final response = await _dio.get(
      "https://newbrdemo.icgwebdevelopment.com/api/pickup_ways/$id",
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final pickup = PickupList.fromJson(response.data);
    // print(response.data);
    return pickup;
  }

  // void fetchDataAndUseId() async {
  //   try {
  //     final requestApi = await getRequestInfo();
  //   } catch (e) {
  //     print('Error $e');
  //   }
  // }
}
