import 'package:delivery_app/model/pickupRequest/request/request.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../model/pickupRequest/requestList/requestList.dart';
import '../utils/sharedPref.dart';

final requestServiceProvider =
    FutureProvider.autoDispose<RequestList>((ref) async {
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
    return request;
  }
}
