import 'package:flutter/cupertino.dart';

import 'colors/dark.dart';
import 'colors/light.dart';


class AppBaseColors {
  final Color primary;
  final Color primaryDark;
  final Color accent;
  final Color accentInactive;
  final Color background;
  final Color surface;
  final Color extraPositive;
  final Color extraNegative;
  final Color extraActive;
  final Color warning;
  final Color onWarning;
  final Color onExtra;
  final Color onPrimary;
  final Color onSurface;
  final Color onBackground;
  final Color onAccent;
  final Color onAccentInactive;

  AppBaseColors({
    required this.primary,
    required this.primaryDark,
    required this.accent,
    required this.accentInactive,
    required this.background,
    required this.surface,
    required this.extraPositive,
    required this.extraNegative,
    required this.extraActive,
    required this.warning,
    required this.onWarning,
    required this.onExtra,
    required this.onPrimary,
    required this.onSurface,
    required this.onBackground,
    required this.onAccent,
    required this.onAccentInactive,
  });

  static AppBaseColors getLightColorTheme() => AppBaseColors(
    primary: AppLightColors.primary,
    primaryDark: AppLightColors.primaryDark,
    accent: AppLightColors.accent,
    background: AppLightColors.background,
    surface: AppLightColors.surface,
    onPrimary: AppLightColors.onPrimary,
    onSurface: AppLightColors.onSurface,
    onBackground: AppLightColors.onBackground,
    extraActive: AppLightColors.extraActive,
    extraNegative: AppLightColors.extraNegative,
    extraPositive: AppLightColors.extraPositive,
    warning: AppLightColors.warning,
    onWarning: AppLightColors.onWarning,
    onExtra: AppLightColors.onExtra,
    accentInactive: AppLightColors.accentInactive,
    onAccent: AppLightColors.onAccent,
    onAccentInactive: AppLightColors.onAccentInactive,
  );

  static AppBaseColors getDarkColorTheme() => AppBaseColors(
    primary: AppDarkColors.primary,
    primaryDark: AppDarkColors.primaryDark,
    accent: AppDarkColors.accent,
    background: AppDarkColors.background,
    surface: AppDarkColors.surface,
    onPrimary: AppDarkColors.onPrimary,
    onSurface: AppDarkColors.onSurface,
    onBackground: AppDarkColors.onBackground,
    extraActive: AppDarkColors.extraActive,
    extraNegative: AppDarkColors.extraNegative,
    extraPositive: AppDarkColors.extraPositive,
    warning: AppDarkColors.warning,
    onWarning: AppDarkColors.onWarning,
    onExtra: AppDarkColors.onExtra,
    accentInactive: AppDarkColors.accentInactive,
    onAccent: AppDarkColors.onAccent,
    onAccentInactive: AppDarkColors.onAccentInactive,
  );
}
