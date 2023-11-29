import 'package:delivery_app/model/deliveryGetWay/deliverygetWay/getway.dart';
import 'package:delivery_app/model/deliveryGetWay/getWayList/getwayList.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final getwayServiceProvider =
    FutureProvider.autoDispose<List<GetWay?>>((ref) async {
  final service = ref.watch(getwayProvider);
  final getwayData = await service.getGetWayInfo();
  return getwayData;
});

final getwayProvider = Provider((ref) => GetWayService(Dio()));

class GetWayService {
  GetWayService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getGetWayInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      APIURL.deliveryGetWayList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = GetWayList.fromJson(response.data);
    return request.data;
  }
}
