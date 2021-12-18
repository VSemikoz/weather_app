import 'package:flutter/material.dart';

import '../colors.dart';

class AppTextThemeData {
  AppTextThemeData({
    required this.listTitleHeader1,
    required this.textButtonLabel,
    required this.titleAppBar,
  });

  final TextStyle listTitleHeader1;

  final TextStyle textButtonLabel;

  final TextStyle titleAppBar;
}

class AppTextTheme {
  AppTextTheme({required this.createTheme});

  final AppTextThemeData Function(AppBaseColors colorTheme) createTheme;
}
