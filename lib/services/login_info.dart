import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSaver{
  static String nameKey = "NAMEKEY";
  static String emailKey = "EMAILKEY";
  static String imgKey = "IMGKEY";
  static String logKey = "LOGKEY";

  static Future<bool?> saveName(String username) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, username);
  }
  static Future<bool?> saveEmail(String email) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, email);
  }
  static Future<bool?> saveImg(String imgURL) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(imgKey, imgURL);
  }
  static Future<bool?> saveLogData(bool isUserLoggedIn) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(logKey, isUserLoggedIn);
  }

  static Future<String?> getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nameKey);
  }
  static Future<String?> getEmail() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(emailKey);
  }
  static Future<String?> getImg() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(imgKey);
  }
  static Future<bool?> getLogData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(logKey);
  }
}