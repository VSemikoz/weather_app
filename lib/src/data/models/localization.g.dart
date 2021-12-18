// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationVariantsAdapter extends TypeAdapter<LocalizationVariants> {
  @override
  final int typeId = 2;

  @override
  LocalizationVariants read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LocalizationVariants.EN;
      case 1:
        return LocalizationVariants.RU;
      default:
        return LocalizationVariants.EN;
    }
  }

  @override
  void write(BinaryWriter writer, LocalizationVariants obj) {
    switch (obj) {
      case LocalizationVariants.EN:
        writer.writeByte(0);
        break;
      case LocalizationVariants.RU:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationVariantsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
