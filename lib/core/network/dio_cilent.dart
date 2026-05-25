import 'package:dio/dio.dart';
import '../utils/helper.dart';

class DioCilent {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://supermarket-dan1.onrender.com/api/v1',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  DioCilent() {
     _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await Helper.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Dio get dio => _dio;
}