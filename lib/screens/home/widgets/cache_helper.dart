import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBoolean({required key, required value}) async {
    return await sharedPreferences!.setBool(key,value );
  }

  static bool getBoolean({required key}) {
    return sharedPreferences!.getBool(key) ?? true;
  }

  static Future<bool> saveInt({required key, required value}) async {
    return await sharedPreferences!.setInt(key, value);
  }

  static int getInt({required key}) {
    return sharedPreferences!.getInt(key) ?? 0;
  }
}
