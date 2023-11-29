import 'package:delivery_app/model/deliveryProcessList/deliProcess/deliProcess.dart';
import 'package:delivery_app/model/deliveryProcessList/deliProcessList/deliProcessList.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final deliProcessServiceProvider =
    FutureProvider.autoDispose<List<DeliveryProcess?>>((ref) async {
  final service = ref.watch(deliProcessProvider);
  final deliProcessData = await service.getDeliveryProcessInfo();
  return deliProcessData;
});

final deliProcessProvider = Provider((ref) => DeliveryProcessService(Dio()));

class DeliveryProcessService {
  DeliveryProcessService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getDeliveryProcessInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      APIURL.deliveryProcessList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = DeliveryProcessList.fromJson(response.data);
    return request.data;
  }

 
}
