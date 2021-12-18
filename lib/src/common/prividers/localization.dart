import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../generated/l10n.dart';
import '../../data/sotrage/localization.dart';
import '../../data/models/localization.dart';

class LocalizationProvider with ChangeNotifier, DiagnosticableTreeMixin {
  static LocalizationVariants get localeVariant => LocalizationStorageHive().localization;

  final StreamController<Locale> localeController = BehaviorSubject.seeded(_getLocale());

  static Locale _getLocale() => _getLocaleFromVariants(localeVariant);

  void switchLocale(LocalizationVariants localeToSet) {
    LocalizationStorageHive().localization = localeToSet;
    localeController.add(_getLocaleFromVariants(localeToSet));
    // notifyListeners(); //TODO стыдно
  }

  static Locale _getLocaleFromVariants(LocalizationVariants localeToSet) {
    switch (localeToSet) {
      case LocalizationVariants.EN:
        return S.delegate.supportedLocales.firstWhere((l) => l.languageCode == "en");
      case LocalizationVariants.RU:
        return S.delegate.supportedLocales.firstWhere((l) => l.languageCode == "ru");
      default:
        return S.delegate.supportedLocales.firstWhere((l) => l.languageCode == "en");
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('locale', localeVariant.toString()));
  }
}
