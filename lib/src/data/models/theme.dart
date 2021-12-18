import 'package:hive/hive.dart';

part 'theme.g.dart';

@HiveType(typeId: 1)
enum ThemeVariants {
  @HiveField(0)
  dark,
  @HiveField(1)
  light,
}
