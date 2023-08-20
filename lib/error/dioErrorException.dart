import 'package:dio/dio.dart';

class DioErrException implements Exception {
  DioErrException.fromDioError(DioError dioError) {
    // switch (dioError.type) {
    //   case DioErrorType.cancel:
    //     message = _handleError(dioError.response!.statusCode);
    //     break;
    //   case DioErrorType.connectTimeout:
    //     message = _handleError(dioError.response!.statusCode);
    //     break;
    //   case DioErrorType.other:
    //     message = _handleError(dioError.response!.statusCode);
    //     break;
    //   case DioErrorType.receiveTimeout:
    //     message = _handleError(dioError.response!.statusCode);
    //     break;
    //   case DioErrorType.response:
    //     message = _handleError(dioError.response!.statusCode);
    //     break;
    //   case DioErrorType.sendTimeout:
    //     message = _handleError(dioError.response!.statusCode);
    //     break;
    //   default:
    //     message = "Something went wrong";
    //     break;
    // }

    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      // case DioErrorType.connectTimeout:
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      // case DioErrorType.other:
      case DioExceptionType.connectionError:
        message = "Connection to API server failed due to internet connection";
        break;
      //case DioErrorType.receiveTimeout:
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      // case DioExceptionType.response:
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response!.statusCode);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String message = "";

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'The requested resource was not found';
      case 405:
        return 'Method not found';
      case 500:
        return 'Internal server error';
      case 401:
        return 'Unauthenticated';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
