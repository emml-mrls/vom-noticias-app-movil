import 'package:flutter/material.dart';
import 'package:vom_app/core/theme/components_theme/theme_components.dart';
import 'package:vom_app/core/theme/typography/typographys.dart';

class AppTheme {
  final Typographys typography;
  final ThemeComponents themeComponents;
  final ColorScheme colors;
  final Brightness brightness;
  AppTheme({
    required this.typography,
    required this.themeComponents,
    required this.colors,
    required this.brightness
  });

  ThemeData getTheme () {
    final AppBarThemeData appBar = themeComponents.getAppBarTheme();
    final BottomAppBarThemeData bottomBar = themeComponents.getBotomAppBarTheme();
    final TextTheme textTheme =  typography.getTypography();
    final IconThemeData iconsDesign = themeComponents.getIconTheme();
    final DrawerThemeData drawerTheme = themeComponents.getDrawerTheme();
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colors,
      appBarTheme: appBar,
      bottomAppBarTheme: bottomBar,
      iconTheme: iconsDesign,
      textTheme: textTheme,
      drawerTheme: drawerTheme
    );
  }
}