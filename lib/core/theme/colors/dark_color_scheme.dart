import 'package:flutter/material.dart';
import 'package:vom_app/core/theme/colors/branding_colors.dart';

class DarkColorScheme {
  static const ColorScheme colors = ColorScheme(
    brightness: Brightness.dark,

    // PRIMARY
    primary: BrandingColors.red,
    onPrimary: Colors.white,

    // SECONDARY
    secondary: BrandingColors.blue,
    onSecondary: Colors.white,

    // // ERROR
    error: Colors.red,
    onError: Colors.black,

    // SURFACE
    surface: Colors.black, 
    onSurface: Colors.white,
    surfaceContainer: BrandingColors.redD,
    surfaceContainerHigh: BrandingColors.blueD,
    surfaceContainerHighest: BrandingColors.grayD,
  );
}