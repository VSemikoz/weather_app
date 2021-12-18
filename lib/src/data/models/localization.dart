import 'package:hive/hive.dart';

part 'localization.g.dart';


@HiveType(typeId: 2)
enum LocalizationVariants {
  @HiveField(0)
  EN,
  @HiveField(1)
  RU,
}
