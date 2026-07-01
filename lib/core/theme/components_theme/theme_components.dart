import 'package:flutter/material.dart';

class ThemeComponents {
  final ColorScheme colors;
  final TextTheme textTheme;
  ThemeComponents({required this.colors, required this.textTheme});

  DrawerThemeData getDrawerTheme(){
    return DrawerThemeData(
      backgroundColor: colors.surfaceContainerHigh
    );
  }

  IconThemeData getIconTheme(){
    return IconThemeData(
      color: colors.primary,
      size: 40,
      grade: 200,
    );
  }

  AppBarThemeData getAppBarTheme() {
    return AppBarThemeData(
      centerTitle: true,
      backgroundColor: colors.surfaceContainerHighest,
      foregroundColor: colors.onPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.displaySmall,
      toolbarHeight: 150.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      iconTheme: getIconTheme().copyWith(color: colors.onPrimary),
    );
  }

  BottomAppBarThemeData getBotomAppBarTheme(){
    return BottomAppBarThemeData(
    color: colors.surfaceContainerHighest,
    elevation: 0,
    );
  }
}