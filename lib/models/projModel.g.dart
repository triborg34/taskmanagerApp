// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 3;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      (fields[2] as List).cast<dynamic>(),
      title: fields[0] as String,
      datetime: fields[7] as DateTime,
      desp: fields[1] as String,
      startTime: fields[3] as String,
      endTime: fields[4] as String,
      progress: fields[5] as int,
    )..tasks = (fields[6] as List).cast<dynamic>();
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.desp)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.progress)
      ..writeByte(6)
      ..write(obj.tasks)
      ..writeByte(7)
      ..write(obj.datetime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
