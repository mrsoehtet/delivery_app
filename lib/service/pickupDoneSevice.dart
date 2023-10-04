import 'package:delivery_app/model/pickupDone/done/donePickup.dart';
import 'package:delivery_app/model/pickupDone/donePickupList/donePickupList.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final donePickupServiceProvider =
    FutureProvider.autoDispose<List<DonePickup?>>((ref) async {
  final service = ref.watch(donePickupProvider);
  final donePickupData = await service.getRequestInfo();
  return donePickupData;
});

final donePickupProvider = Provider((ref) => donePickupService(Dio()));

class donePickupService {
  donePickupService(this._dio);
  Dio _dio;

  //donePickup? donePickup;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getRequestInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      APIURL.pickupDone,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = DonePickupList.fromJson(response.data);
    return request.data;
  }
}
