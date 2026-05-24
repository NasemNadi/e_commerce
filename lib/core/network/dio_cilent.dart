import 'package:dio/dio.dart';

class DioCilent {
 final Dio _dio =Dio(
       BaseOptions(
         baseUrl: 'https://supermarket-dan1.onrender.com/api/v1',
       headers: {'Content-Type': 'application/json'},

     ),
  );
 DioCilent(){
   dio.interceptors.add(InterceptorsWrapper(
     onRequest: (options,handler){
      final tokun ='tonkun tokun';
      if(tokun !=null &&tokun.isNotEmpty){
        options.headers ['Authorization']='Bearer $tokun';
      }
      return handler.next(options);
     }
   ));
 }
 Dio get dio => dio;
}