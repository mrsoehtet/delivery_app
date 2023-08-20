import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const token = "token";
  static const islogin = "islogin";
  static const asxoxinfo = "asxoxinfo";
  static const profile = 'profile';
  static const themeStatus = 'themeStatus';

  static Future<bool> setAsxoxData({String? key, String? value}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setString(key!, value!);
  }

  static Future<String?> getAsxoxData({String? key}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    String? str = shp.getString(key!);
    return str;
  }

  static Future<bool> setData({String? key, String? value}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setString(key!, value!);
  }

  static Future<String?> getData({String? key}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    String? str = shp.getString(key!);
    return str;
  }

  static Future<bool> setBoolForLoginUser({String? key, bool? value}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setBool(key!, value!);
  }

  static Future<bool?> getBoolForLoginUser({String? key}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    bool? islogin = shp.getBool(key!);
    return islogin;
  }

  // static Future<User?> getUser({required String key}) async {
  //   SharedPreferences shp = await SharedPreferences.getInstance();
  //   Map<String, dynamic> userJson = json.decode(shp.getString(key)!);
  //   var user = User.fromJson(userJson);
  //   return user;
  // }

  static Future<String?> setUser(
      {String? key, Map<String, dynamic>? user}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    String encodeMap = json.encode(user);
    shp.setString(key!, encodeMap);
    return encodeMap;
  }

  static void clear() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    shp.clear();
  }

  static Future<dynamic> setDarkTheme({String? key, bool? value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key!, value!);
  }

  static Future<dynamic> getTheme({String? key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool(key!);
    return isDark;
  }
}

class RememberSharedPref {
  static const rememberToken = "token";

  static Future<bool> setRememberData({String? key, String? value}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setString(key!, value!);
  }

  static Future<String?> getRememberData({String? key}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    String? str = shp.getString(key!);
    return str;
  }
}
