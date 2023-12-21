import 'package:delivery_app/model/cancelList/cancel/cancel.dart';
import 'package:delivery_app/model/cancelList/cancellist/cancelList.dart';
import 'package:delivery_app/model/deliReturn/deliReturnList/deliReturnList.dart';
import 'package:delivery_app/model/deliReturn/delireturn/delireturn.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final cancelServiceProvider =
    FutureProvider.autoDispose<List<Cancel?>>((ref) async {
  final service = ref.watch(cancelProvider);
  final cancelData = await service.getCancelInfo();
  return cancelData;
});

final cancelProvider = Provider((ref) => CancelService(Dio()));

class CancelService {
  CancelService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getCancelInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      APIURL.cancelList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = CancelList.fromJson(response.data);
    return request.data;
  }
}
