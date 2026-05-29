import 'package:vom_app/domain/value_objects/setting.dart';

class SettingsModel {
  final bool isDarkMode;
  final bool notificationsEnabled;
  final double fontScale;

  SettingsModel({
    required this.isDarkMode, 
    required this.notificationsEnabled,
    required this.fontScale
  });

  factory SettingsModel.fromMap(Map<String, dynamic> data) {
    return SettingsModel(
      isDarkMode: data["isDarkMode"] ?? false,
      notificationsEnabled: data["notificationsEnabled"] ?? false,
      fontScale: data["fontScale"] ?? 1.0,
    );
  }

  factory SettingsModel.fromEntity(Setting setting) {
    return SettingsModel(
      isDarkMode: setting.isDarkMode, 
      notificationsEnabled: setting.notificationsEnabled, 
      fontScale: setting.fontScale
      );
  }

  Map<String, dynamic> toMap (){
    return {"isDarkMode": isDarkMode, "notificationsEnabled" : notificationsEnabled, "fontScale" : fontScale};
  }

  Setting toEntity(){
    return Setting(isDarkMode: isDarkMode, notificationsEnabled: notificationsEnabled, fontScale: fontScale);
  }
}