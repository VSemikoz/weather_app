import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'src/common/injection/injection.dart';
import 'src/common/logger/logger.dart';
import 'src/data/storage/localization.dart';
import 'src/data/storage/theme.dart';

void main() => setupApp().then((value) => runApp(WeatherApp()));

Future<void> setupApp() async {
  await Hive.initFlutter();
  await Future.wait([
    ThemeStorageHive.initHive(),
    LocalizationStorageHive.initHive(),
  ]);

  _disableLandscape();

  Log().writer = kReleaseMode ? LogWriterProduction() : LogWriterDevelopment();

  await configureInjection(Env.dev);
}

void _disableLandscape() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
