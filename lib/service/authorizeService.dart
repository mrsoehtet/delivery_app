import 'dart:convert';
import 'dart:io';


import 'package:delivery_app/utils/sharedPref.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../error/dioErrorException.dart';
import '../httpServic/httpException.dart';
import '../utils/api.dart';
import '../utils/global.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) {
    return AuthService(Dio());
  },
);

class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<dynamic> login({
    required String phone,
    required String password,
  }) async {
    try {
      var encodeJson = json.encode({
        'login_name': phone,
        'password': password,
      });
      var response = await http.post(Uri.parse(API.loginUrl),
          body: encodeJson, headers: Global.headers);
      var userData = jsonDecode(response.body);
      return userData;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> changePassword({
    required String old_password,
    required String new_password,
    required String confirm_password,
  }) async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.post(API.passwordResetUrl,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': '$token',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'currentPassword': old_password,
            'password': new_password,
            'confirmPassword': confirm_password,
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }

  Future<dynamic> update({
    required String fullName,
    required String loginName,
    required String phone,
    required String address,
    required String state,
    required String township,
  }) async {
    print(API.editProfile);
    final token = await SharedPref.getData(key: SharedPref.token);
    try {
      var encodeJson = json.encode({
        'full_name': fullName,
        'login_name': loginName,
        'phone': phone,
        'address': address,
        'state': state,
        'township': township,
      });
      print(encodeJson);
      var response = await http.post(Uri.parse(API.editProfile), body: {
        'full_name': fullName,
        'login_name': loginName,
        'phone': phone,
        'address': address,
        'state': state,
        'township': township,
      }, headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': '$token',
      });
      var userData = jsonDecode(response.body);
      return userData;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> forgetPassword({
    required String phone,
  }) async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.post(API.forgetPassword,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': '$token',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'phone': phone,
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }

  Future<dynamic> checkToken({
    required String token,
    required String phone,
  }) async {
    try {
      final response = await _dio.post(API.checkToken,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'two_factor_code': int.parse(token),
            'phone': phone,
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }

  Future<dynamic> registerFirstStep({
    required String phone,
  }) async {
    var encodeJson = json.encode({
      'phone': phone,
    });
    print(encodeJson);
    var response = await http.post(
      Uri.parse(API.signUpFirstStepUrl),
      body: {"phone": phone},
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    var userData = jsonDecode(response.body);
    return userData;
  }

  Future<dynamic> referralCodeCheck({
    required String referralCode,
  }) async {
    var encodeJson = json.encode({
      'referral_code': referralCode,
    });
    print(encodeJson);
    var response = await http.post(
      Uri.parse(API.referralCodeCheck),
      body: {"referral_code": referralCode},
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
    );
    var userData = jsonDecode(response.body);
    return userData;
  }

  Future<dynamic> resetPassword({
    required String phone,
    required String password,
    required String password_confirmation,
    required String token,
  }) async {
    try {
      final logintoken = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.post(API.resetPassword,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': '$logintoken',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'phone': phone,
            'password': password,
            'password_confirmation': password_confirmation,
            'token': token
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }
}
