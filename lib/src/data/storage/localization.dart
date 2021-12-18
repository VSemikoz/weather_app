import 'dart:io';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/localization.dart';

abstract class LocalizationLocalStorage {
  LocalizationVariants localization = LocalizationVariants.EN;
}

@Injectable(as: LocalizationLocalStorage)
class LocalizationStorageHive implements LocalizationLocalStorage {
  static const String boxName = 'localization';

  static Future initHive() async {
    Hive.registerAdapter(LocalizationVariantsAdapter());
    await Hive.openBox(boxName);
  }

  Box get _hiveBox => Hive.box(boxName);

  LocalizationVariants get localization {
    LocalizationVariants? locale = _hiveBox.get(_Keys.localization.toString());
    return locale ?? _getInitLocale();
  }

  @override
  set localization(LocalizationVariants? _localization) {
    _hiveBox.put(_Keys.localization.toString(), _localization);
  }

  LocalizationVariants _getInitLocale() {
    Platform.localeName == "ru_RU"
        ? localization = LocalizationVariants.RU
        : localization = LocalizationVariants.EN;
    return localization;
  }
}

enum _Keys { localization }
