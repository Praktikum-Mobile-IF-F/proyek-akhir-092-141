// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PurchaseHistoryModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseHistoryModelAdapter extends TypeAdapter<PurchaseHistoryModel> {
  @override
  final int typeId = 1;

  @override
  PurchaseHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseHistoryModel(
      bundleName: fields[1] as String,
      price: fields[2] as String,
      purchasedAt: fields[3] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, PurchaseHistoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bundleName)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.purchasedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
