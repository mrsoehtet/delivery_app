import 'package:delivery_app/model/pickupProcess/process/process.dart';
import 'package:delivery_app/model/pickupProcess/processList/processList.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final processServiceProvider =
    FutureProvider.autoDispose<List<Process?>>((ref) async {
  final service = ref.watch(processProvider);
  final processData = await service.getRequestInfo();
  return processData;
});

final processProvider = Provider((ref) => ProcessService(Dio()));

class ProcessService {
  ProcessService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getRequestInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      APIURL.pickupProcess,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = ProcessList.fromJson(response.data);
    return request.data;
  }
}
