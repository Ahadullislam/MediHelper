// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_member_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyMemberModelAdapter extends TypeAdapter<FamilyMemberModel> {
  @override
  final int typeId = 0;

  @override
  FamilyMemberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FamilyMemberModel(
      id: fields[0] as String,
      name: fields[1] as String,
      age: fields[2] as int,
      relation: fields[3] as String,
      blood: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FamilyMemberModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.relation)
      ..writeByte(4)
      ..write(obj.blood);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyMemberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
