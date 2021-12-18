import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/theme.dart';
import '../../data/storage/theme.dart';
import '../resource/colors.dart';
import '../resource/theme/text.dart';

class BaseAppTheme {
  BaseAppTheme({
    required AppTextThemeData Function(AppBaseColors colorTheme) createTextTheme,
    required AppBaseColors Function() createColorTheme,
  }) {
    _color = createColorTheme();
    _text = createTextTheme(_color);
  }

  late AppTextThemeData _text;

  AppTextThemeData get text => _text;

  late AppBaseColors _color;

  AppBaseColors get color => _color;

  ThemeData get appThemeData => ThemeData(
        primaryColor: color.primary,
        secondaryHeaderColor: color.accent,
        brightness: Brightness.light,
        textSelectionTheme: TextSelectionThemeData(cursorColor: color.accent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
        fontFamily: 'Roboto',
      );

  static BaseAppTheme get lightTheme => BaseAppTheme(
        createColorTheme: AppBaseColors.getLightColorTheme,
        createTextTheme: _getDefaultTextTheme,
      );

  static BaseAppTheme get darkTheme => BaseAppTheme(
        createColorTheme: AppBaseColors.getDarkColorTheme,
        createTextTheme: _getDefaultTextTheme,
      );
}

AppTextThemeData _getDefaultTextTheme(AppBaseColors color) {
  return AppTextThemeData(
    listTitleHeader1: TextStyle(
      color: color.onBackground,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    textButtonLabel: TextStyle(
      color: color.accent,
      fontSize: 14,
    ),
    titleAppBar: TextStyle(
      color: color.onPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}

extension BuildContextExtension on BuildContext {
  AppBaseColors get colorTheme => read<ThemeProvider>().theme.color;
}

class ThemeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  BaseAppTheme get theme => _theme;

  ThemeVariants get themeVariant => ThemeStorageHive().theme;

  BaseAppTheme get _theme {
    switch (themeVariant) {
      case ThemeVariants.dark:
        return BaseAppTheme.darkTheme;
      case ThemeVariants.light:
        return BaseAppTheme.lightTheme;
    }
  }

  void switchTheme(ThemeVariants variant) {
    ThemeStorageHive().theme = variant;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('theme', themeVariant.toString()));
  }
}
