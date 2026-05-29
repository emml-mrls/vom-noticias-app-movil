import 'package:flutter/material.dart';

class ThemeComponents {
  final ColorScheme colors;
  final TextTheme textTheme;
  ThemeComponents({required this.colors, required this.textTheme});

  IconThemeData getIconTheme(){
    return IconThemeData(
      color: colors.onSurface,
      size: 40,
      grade: 200,
      opacity: 0,
    );
  }

  AppBarThemeData getAppBarTheme() {
    return AppBarThemeData(
      centerTitle: true,
      backgroundColor: colors.surfaceContainerHighest,
      foregroundColor: colors.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.displaySmall,
      toolbarHeight: 150.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      iconTheme: IconThemeData(size: 40),
    );
  }

  BottomAppBarThemeData getBotomAppBarTheme(){
    return BottomAppBarThemeData(
    color: colors.surfaceContainerHighest,
    elevation: 0,
    );
  }
}