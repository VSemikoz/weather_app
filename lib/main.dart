import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/data/storage/localization.dart';
import 'src/data/storage/theme.dart';

import 'app.dart';

void main() => setupApp().then((value) => runApp(WeatherApp()));

Future<void> setupApp() async {
  await Hive.initFlutter();
  await Future.wait([
    ThemeStorageHive.initHive(),
    LocalizationStorageHive.initHive(),
  ]);

  _disableLandscape();

  // Log().writer = kReleaseMode ? LogWriterProduction() : LogWriterDevelopment();

  // await configureInjection(Env.dev);
}

void _disableLandscape() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
