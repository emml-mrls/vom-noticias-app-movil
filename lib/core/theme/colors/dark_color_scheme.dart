import 'package:flutter/material.dart';
import 'package:vom_app/core/theme/colors/branding_colors.dart';

class DarkColorScheme {
  static const ColorScheme colors = ColorScheme(
    brightness: Brightness.dark,

    // PRIMARY
    primary: BrandingColors.blue,
    onPrimary: Colors.white,

    // SECONDARY
    secondary: BrandingColors.red,
    onSecondary: Colors.white,

    // TERTIARY
    tertiary: BrandingColors.grayD,
    onTertiary: Colors.white,

    // // ERROR
    error: Colors.red,
    onError: Colors.black,

    // SURFACE
    surface: Colors.black, 
    onSurface: Colors.white,
    surfaceContainer: BrandingColors.blueD,
    surfaceContainerHigh: Colors.black,
    surfaceContainerHighest: BrandingColors.blueD,
  );
}