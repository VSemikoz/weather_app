// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeVariantsAdapter extends TypeAdapter<ThemeVariants> {
  @override
  final int typeId = 1;

  @override
  ThemeVariants read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeVariants.dark;
      case 1:
        return ThemeVariants.light;
      default:
        return ThemeVariants.dark;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeVariants obj) {
    switch (obj) {
      case ThemeVariants.dark:
        writer.writeByte(0);
        break;
      case ThemeVariants.light:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeVariantsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
