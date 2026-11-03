import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const ink = Color(0xFF14110E);
  static const inkRaised = Color(0xFF221C17);
  static const paper = Color(0xFFF3EEE6);
  static const line = Color(0xFFD8D0C4);
  static const lineStrong = Color(0xFFC9BFAF);
  static const brass = Color(0xFF6E451C);
  static const brassBright = Color(0xFFE0BE86);
  static const brassFill = Color(0xFFD2B07A);
  static const cream = Color(0xFFF6F1E8);
  static const creamMute = Color(0xFFD4CBBE);
  static const mute = Color(0xFF5E564E);
}

class PortfolioWidth {
  const PortfolioWidth._();

  static const frame = 1120.0;
  static const nav = 920.0;

  static double page(double width) {
    if (width >= 1040) return 40;
    if (width >= nav) return 28;
    return 20;
  }

  static bool showsNav(double width) => width >= nav;
}

class AppType {
  const AppType._();

  static TextStyle display(
    double size, {
    Color color = AppColors.ink,
    FontWeight weight = FontWeight.w600,
    double height = 0.96,
    double letterSpacing = -0.8,
  }) {
    return TextStyle(
      fontFamily: 'Fraunces',
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle body(
    double size, {
    Color color = AppColors.ink,
    FontWeight weight = FontWeight.w400,
    double height = 1.6,
  }) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color,
    );
  }

  static TextStyle ui(
    double size, {
    Color color = AppColors.ink,
    FontWeight weight = FontWeight.w500,
    double height = 1.2,
    double letterSpacing = 0.1,
  }) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }
}

class PortfolioTheme {
  const PortfolioTheme._();

  static ThemeData light() {
    final base = AppType.ui(14, weight: FontWeight.w600);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.ink,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      colorScheme: const ColorScheme.light(
        primary: AppColors.brass,
        onPrimary: AppColors.cream,
        surface: AppColors.paper,
        onSurface: AppColors.ink,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.brassFill.withValues(alpha: 0.45),
        cursorColor: AppColors.brass,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: base),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.inkRaised,
        contentTextStyle: AppType.body(14, color: AppColors.cream, height: 1.4),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
