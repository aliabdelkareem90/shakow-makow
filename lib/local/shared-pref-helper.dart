import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late SharedPreferences preferences;

  static Future<SharedPreferences> init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await preferences.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    return preferences.getBool(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await preferences.setString(key, value);
    if (value is int) return await preferences.setInt(key, value);
    if (value is bool) return await preferences.setBool(key, value);

    return await preferences.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await preferences.remove(key);
  }
}
