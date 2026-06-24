import 'package:flutter/material.dart';

class Typographys {
  final double fontScale;
  final ColorScheme colors;
  final double fontBaseSize = 16;
  Typographys.build({required this.fontScale, required this.colors});

  TextTheme getTypography() {
    final TextStyle baseTextStyle = TextStyle(
      fontFamily: 'Helvetica',
      color: colors.onPrimary,
    );

    return TextTheme(

  // DISPLAY
      displayLarge: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 3 * fontScale,
        fontWeight: FontWeight.bold
      ),

      displayMedium: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 2.5 * fontScale,
        fontWeight: FontWeight.bold
      ),

      displaySmall: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 2.25 * fontScale,
        fontWeight: FontWeight.bold
      ),

  // HEADLINE

      // ENCABEZADO PRINCIPAL {APPBAR}
      headlineLarge: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 2 * fontScale,
        fontWeight: FontWeight.bold,
      ),

      // SUBTITULO FUERTE
      headlineMedium: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 1.75 * fontScale,
        fontWeight: FontWeight.bold,
      ),

      // ENCABEZADO SECUNDARIO
      headlineSmall: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 1.5 *fontScale,
      ),

  // TITLE

      // TITULO COMUN {TITULO DE CATEGORIA DE CARDS}
      titleLarge: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 1.375 * fontScale,
        fontWeight: FontWeight.bold,
      ),

      // TITULO DE CARDS O LISTAS  
      titleMedium: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 1.25 * fontScale,
        fontWeight: FontWeight.bold,
      ),

      // ETIQUETAS IMPORTANTES
      titleSmall: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 1.25 * fontScale,
      ),

  // BODY

      // PARRAFO NORMAL
      bodyLarge: baseTextStyle.copyWith(
        fontSize: fontBaseSize * fontScale,
      ),

      // CONTENIDO SECUNDARIO
      bodyMedium: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 0.875 * fontScale,
      ),

      // DETALLES
      bodySmall: baseTextStyle.copyWith(
        fontSize: fontBaseSize * 0.75 * fontScale,
      ),

  // LABEL

      // BOTONES
      labelLarge: baseTextStyle.copyWith(
        fontSize: fontBaseSize * (fontScale - 0.5),
      ),

      // CHIPS Y TABLAS
      labelMedium: baseTextStyle.copyWith(),

      // CAPTIONS PEQUENNOS
      labelSmall: baseTextStyle.copyWith(),
    );
  }
}