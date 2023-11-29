import 'package:delivery_app/model/orderDetail/orderDetailList/orderDetailList.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../model/pickupRequest/requestList/requestList.dart';
import '../utils/sharedPref.dart';

// final orderDetailProvider =
//     FutureProvider.autoDispose<OrderDetailList>((ref) async {
//   final service = ref.watch(orderDeProvider);
//   final orderDeData = await service.getOrderDetailInfo();
//   return orderDeData;
// });

final orderDetailProvider =
    FutureProvider.family<OrderDetailList, String>((ref, id) async {
  final service = ref.watch(orderDeProvider);
  final pickupData = await service.getOrderDetailInfo(id);
  return pickupData;
});

final orderDeProvider = Provider((ref) => OrderDetailService(Dio()));

class OrderDetailService {
  OrderDetailService(this._dio);
  Dio _dio;

  // Request? requestData;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getOrderDetailInfo(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      'https://newbrdemo.icgwebdevelopment.com/api/delivery/order_detail/$id',
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = OrderDetailList.fromJson(response.data);
    return request;
  }
}
