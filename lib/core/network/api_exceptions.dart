import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_errors.dart';

class ApiException {
  static ApiErrors handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return ApiErrors(message: "No internet connection", statuscode: 0);

      case DioExceptionType.receiveTimeout:
        return ApiErrors(message: "Server timeout", statuscode: 0);

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message']
            ?? error.response?.data?['error']
            ?? 'Something went wrong';
        return ApiErrors(message: message, statuscode: statusCode);

      default:
        return ApiErrors(message: "Something went wrong", statuscode: 0);
    }
  }
}