import 'package:shared_preferences/shared_preferences.dart';
import 'package:vom_app/core/error/exceptions.dart';

class SettingsSharedPreferencesService {

  Future<void> saveSharedPrefs(Map<String,dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (data.containsKey("isDarkMode")) {
        await prefs.setBool("isDarkMode", data["isDarkMode"]);
      } 
      if (data.containsKey("fontScale")) {
        await prefs.setDouble("fontScale", data["fontScale"]);
      }
      if (data.containsKey("notificationsEnabled")) {
        await prefs.setBool("isDarkMode", data["notificationsEnabled"]);
      } 
    } catch (e) {
      throw StorageException();
    }
  }

  Future<Map<String, dynamic>> getSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      return {
        "isDarkMode" : prefs.getBool("isDarkMode"), 
        "notificationsEnabled": prefs.getBool("notificationsEnabled"), 
        "fontScale" : prefs.getDouble("fontScale")     
      };
    } catch (e) {
     throw StorageException(); 
    }
  }
}