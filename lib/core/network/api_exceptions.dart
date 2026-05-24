import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_errors.dart';

class ApiException{
static ApiErrors handleError(DioError error){
  switch(error.type){
    case DioErrorType.connectionTimeout:
      return ApiErrors(message: "Bad Connection");
    case DioErrorType.badCertificate:
      return ApiErrors(message:error.toString());
     default:
       return ApiErrors(message: "somthanh went wrong");


}

}
}