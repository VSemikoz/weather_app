import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/theme.dart';

abstract class ThemeLocalStorage {
  ThemeVariants theme = ThemeVariants.dark;
}

@Injectable(as: ThemeLocalStorage)
class ThemeStorageHive implements ThemeLocalStorage {
  static const String boxName = 'theme';

  static Future initHive() async {
    Hive.registerAdapter(ThemeVariantsAdapter());
    await Hive.openBox(boxName);
  }

  Box get _hiveBox => Hive.box(boxName);

  ThemeVariants get theme {
    ThemeVariants? theme = _hiveBox.get(_Keys.theme.toString());
    return theme ?? _getInitTheme();
  }

  @override
  set theme(ThemeVariants? theme) {
    _hiveBox.put(_Keys.theme.toString(), theme);
  }

  ThemeVariants _getInitTheme() => ThemeVariants.dark;

}

enum _Keys { theme }
