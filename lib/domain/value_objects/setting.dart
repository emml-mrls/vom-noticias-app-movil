import 'package:vom_app/core/error/exceptions.dart';

class Setting {
  final bool isDarkMode;
  final bool notificationsEnabled;
  final double fontScale;

  const Setting._internal({
    required this.isDarkMode, 
    required this.notificationsEnabled, 
    required this.fontScale
  });

  factory Setting({required bool isDarkMode,required bool notificationsEnabled,required double fontScale}){
    if (fontScale < 0.75 || fontScale > 1.25 ) {
      throw ParseException();
    }
    return Setting._internal(isDarkMode: isDarkMode, notificationsEnabled: notificationsEnabled, fontScale: fontScale);
  }

  Setting copyWith({bool? isDarkMode,bool? notificationsEnabled,double? fontScale}) {
    return Setting(
    isDarkMode: isDarkMode ?? this.isDarkMode,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    fontScale: fontScale ?? this.fontScale,
    );
  }
}