import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_errors.dart';
import 'package:ecommerce_app/core/network/api_exceptions.dart';
import 'package:ecommerce_app/core/network/api_services.dart';
import 'package:ecommerce_app/core/utils/helper.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

class AuthRepo {
  final ApiServices apiServices = ApiServices();

  // login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiServices.post('/auth/signIn', {
        'email': email,
        'password': password,
      });

      if (response is ApiErrors) {
        throw response;
      }
      final Map<String, dynamic> userData = (response != null && response['data'] != null)
          ? response['data']
          : (response ?? {});

      final user = UserModel.fromJson(userData);

      String? token = user.token.isNotEmpty ? user.token : response?['token']?.toString();

      if (token != null && token.isNotEmpty) {
        await Helper.saveToken(token);
      }

      return user;

    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      if (e is ApiErrors) {
        throw e;
      }
      throw ApiErrors(message: e.toString());
    }
  }
//register
  Future<UserModel?> register({
    required String name,
    required String username,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await apiServices.post('/auth/signUp', {
        'name': name,
        'username': username,
        'phone': phone,
        'email': email,
        'password': password,
        'confirmPassword': password,
      });

      if (response is ApiErrors) {
        throw response;
      }
      final Map<String, dynamic> userData = (response != null && response['data'] != null)
          ? response['data']
          : (response ?? {});

      final user = UserModel.fromJson(userData);

      String? token = user.token.isNotEmpty ? user.token : response?['token']?.toString();

      if (token != null && token.isNotEmpty) {
        await Helper.saveToken(token);
      }

      return user;

    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      if (e is ApiErrors) {
        throw e;
      }
      throw ApiErrors(message: e.toString());
    }}}