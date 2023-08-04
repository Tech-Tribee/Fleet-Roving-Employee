import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAME";

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<void> saveUserName(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString(userNameKey, userName);
  }

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
