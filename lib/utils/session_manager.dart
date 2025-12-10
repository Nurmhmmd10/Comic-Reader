import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences ? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static bool get isLoggedIn => _prefs?.getBool('isLoggedIn') ?? false;
  static int? get userId => _prefs?.getInt('user_id');
  static String? get username => _prefs?.getString('username');
  static bool? get isDarkMode => _prefs?.getBool('dark_mode');

  static Future setLogin({required int id, required String name}) async {
    await _prefs?.setBool('isLoggedIn', true);
    await _prefs?.setInt('user_id', id);
    await _prefs?.setString('username', name);
  }

  static Future logout() async {
    await _prefs?.remove('isLoggedIn');
    await _prefs?.remove('user_id');
    await _prefs?.remove('username');
  }

  static Future setDarkMode(bool v) async {
    await _prefs?.setBool('dark_mode', v);
  }
}