import 'package:delivery_app/model/deliveryDone/deliDoneList/deliDoneList.dart';
import 'package:delivery_app/model/deliveryDone/delidone/delidone.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final deliDoneServiceProvider =
    FutureProvider.autoDispose<List<DeliveryDone?>>((ref) async {
  final service = ref.watch(deliDoneProvider);
  final deliDoneData = await service.getDeliveryDoneInfo();
  return deliDoneData;
});

final deliDoneProvider = Provider((ref) => DeliveryDoneService(Dio()));

class DeliveryDoneService {
  DeliveryDoneService(this._dio);
  Dio _dio;
  
  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getDeliveryDoneInfo() async {
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
    final request = DeliveryDoneList.fromJson(response.data);
    return request.data;
  }

 
}
