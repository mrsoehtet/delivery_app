import 'package:delivery_app/model/transferToWH/transferToWH/transfer_to_WH.dart';
import 'package:delivery_app/model/transferToWH/transferToWHList/transferToWHList.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/isLoginController.dart';
import '../utils/sharedPref.dart';

final transferToWHServiceProvider =
    FutureProvider.autoDispose<List<TransferToWH?>>((ref) async {
  final service = ref.watch(transferToWHProvider);
  final transferToWHData = await service.getTransferToWHInfo();
  return transferToWHData;
});

final transferToWHProvider = Provider((ref) => TransferToWHService(Dio()));

class TransferToWHService {
  TransferToWHService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getTransferToWHInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      APIURL.deliverytransferToWH,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = TransferToWHList.fromJson(response.data);
    return request.data;
  }
}
