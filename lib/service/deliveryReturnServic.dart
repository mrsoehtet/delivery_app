import 'package:delivery_app/model/deliReturn/deliReturnList/deliReturnList.dart';
import 'package:delivery_app/model/deliReturn/delireturn/delireturn.dart';
import 'package:delivery_app/model/deliveryDone/deliDoneList/deliDoneList.dart';
import 'package:delivery_app/model/deliveryDone/delidone/delidone.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final deliReturnServiceProvider =
    FutureProvider.autoDispose<List<DeliveryReturn?>>((ref) async {
  final service = ref.watch(deliReturnProvider);
  final deliReturnData = await service.getDeliveryReturnInfo();
  return deliReturnData;
});

final deliReturnProvider = Provider((ref) => DeliveryReturnService(Dio()));

class DeliveryReturnService {
  DeliveryReturnService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getDeliveryReturnInfo() async {
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
    final request = DeliveryReturnList.fromJson(response.data);
    return request.data;
  }
}
