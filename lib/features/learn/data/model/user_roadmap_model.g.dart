// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roadmap_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoadmapModelAdapter extends TypeAdapter<UserRoadmapModel> {
  @override
  final int typeId = 1;

  @override
  UserRoadmapModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRoadmapModel(
      trackName: fields[0] as String,
      userHoursPerWeek: fields[1] as int,
      totalWeeksCalculated: fields[2] as int,
      selectedIndex: fields[3] as int,
      progress: fields[4] as int,
      roadmap: (fields[5] as List).cast<RoadmapModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserRoadmapModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.trackName)
      ..writeByte(1)
      ..write(obj.userHoursPerWeek)
      ..writeByte(2)
      ..write(obj.totalWeeksCalculated)
      ..writeByte(3)
      ..write(obj.selectedIndex)
      ..writeByte(4)
      ..write(obj.progress)
      ..writeByte(5)
      ..write(obj.roadmap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoadmapModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoadmapModelAdapter extends TypeAdapter<RoadmapModel> {
  @override
  final int typeId = 2;

  @override
  RoadmapModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoadmapModel(
      weekNumber: fields[0] as int,
      isCompleted: fields[1] as bool,
      skills: (fields[2] as List).cast<SkillsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RoadmapModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.weekNumber)
      ..writeByte(1)
      ..write(obj.isCompleted)
      ..writeByte(2)
      ..write(obj.skills);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoadmapModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SkillsModelAdapter extends TypeAdapter<SkillsModel> {
  @override
  final int typeId = 3;

  @override
  SkillsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SkillsModel(
      skillName: fields[0] as String,
      estimatedHours: fields[1] as int,
      resources: fields[2] as ResourcesModel,
    );
  }

  @override
  void write(BinaryWriter writer, SkillsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.skillName)
      ..writeByte(1)
      ..write(obj.estimatedHours)
      ..writeByte(2)
      ..write(obj.resources);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResourcesModelAdapter extends TypeAdapter<ResourcesModel> {
  @override
  final int typeId = 4;

  @override
  ResourcesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResourcesModel(
      youtubeLink: fields[0] as String,
      bookReference: fields[1] as String,
      articleLink: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResourcesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.youtubeLink)
      ..writeByte(1)
      ..write(obj.bookReference)
      ..writeByte(2)
      ..write(obj.articleLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourcesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
