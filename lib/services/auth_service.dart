import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_config.dart';

class AuthService {
  static Future<Map<String,dynamic>> register(String username, String password) async {
    final url = Uri.parse('${ApiConfig.baseUrl}auth/register.php');
    final resp = await http.post(url, body: {'username': username, 'password': password});
    return json.decode(resp.body);
  }

  static Future<Map<String,dynamic>> login(String username, String password) async {
    final url = Uri.parse('${ApiConfig.baseUrl}auth/login.php');
    final resp = await http.post(url, body: {'username': username, 'password': password});
    return json.decode(resp.body);
  }
}