import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_exceptions.dart';
import 'package:ecommerce_app/core/network/dio_cilent.dart';

class ApiServices {
  final DioCilent dioCilent =DioCilent();
  // get
Future<dynamic> get(String endpoint) async{
  try{
    final response =  await dioCilent.dio.get(endpoint);
    return response.data;
  } on DioException catch (e) {
    return ApiException.handleError(e);
  }
}
// pst method
  Future<dynamic> post(String endpoint,Map<String,dynamic>body) async{
    try{
      final response =  await dioCilent.dio.post(endpoint,data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiException.handleError(e);
    }
  }
  // put method
  Future<dynamic> put(String endpoint,Map<String,dynamic>body) async{
    try{
      final response =  await dioCilent.dio.put(endpoint,data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiException.handleError(e);
    }
  }
  // delete method
  Future<dynamic> delete(String endpoint,Map<String,dynamic>body) async{
    try{
      final response =  await dioCilent.dio.delete(endpoint,data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiException.handleError(e);
    }
  }
}