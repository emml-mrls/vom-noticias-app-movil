import 'package:flutter/material.dart';
import 'package:vom_app/core/theme/colors/branding_colors.dart';

class LightColorScheme {
  static const ColorScheme colors= ColorScheme(
    brightness: Brightness.light,

    // PRIMARY
    primary: BrandingColors.blue,
    onPrimary: Colors.white,
    //primaryContainer: ,
    //onPrimaryContainer: ,

    // SECONDARY
    secondary: BrandingColors.red,
    onSecondary: Colors.white,
    //secondaryContainer: BrandingColors.vomAzul,
    //onSecondaryContainer: ,

    // // TERTIARY
    tertiary: BrandingColors.gray,
    // onTertiary: ,
    // tertiaryContainer: ,
    // onTertiaryContainer: ,

    // // ERROR
    error: Colors.red,
    onError: Colors.black,
    // errorContainer: ,
    // onErrorContainer: ,

    // SURFACE
    surface: Colors.white, 
    onSurface: Colors.black,
    surfaceContainer: BrandingColors.gray,
    surfaceContainerHigh: BrandingColors.grayL,
    surfaceContainerHighest: BrandingColors.blue,
    // surfaceContainerLow: ,
    // surfaceContainerLowest: ,
  );
}