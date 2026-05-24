import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static const String token_key = 'uth token';
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}