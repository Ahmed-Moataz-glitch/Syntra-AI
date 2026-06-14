import 'package:hive/hive.dart';

part 'user_roadmap_model.g.dart';

@HiveType(typeId: 1)
class UserRoadmapModel extends HiveObject {
  @HiveField(0)
  final String trackName;
  @HiveField(1)
  final int userHoursPerWeek;
  @HiveField(2)
  final int totalWeeksCalculated;
  @HiveField(3)
  final int selectedIndex;
  @HiveField(4)
  final int progress;
  @HiveField(5)
  final List<RoadmapModel> roadmap;

  UserRoadmapModel({
    required this.trackName,
    required this.userHoursPerWeek,
    required this.totalWeeksCalculated,
    required this.selectedIndex,
    required this.progress,
    required this.roadmap,
  });
}

@HiveType(typeId: 2)
class RoadmapModel {
  @HiveField(0)
  final int weekNumber;
  @HiveField(1)
  final bool isCompleted;
  @HiveField(2)
  final List<SkillsModel> skills;

  RoadmapModel({
    required this.weekNumber,
    required this.isCompleted,
    required this.skills,
  });
}

@HiveType(typeId: 3)
class SkillsModel {
  @HiveField(0)
  final String skillName;
  @HiveField(1)
  final int estimatedHours;
  @HiveField(2)
  final ResourcesModel resources;

  SkillsModel({
    required this.skillName,
    required this.estimatedHours,
    required this.resources,
  });
}

@HiveType(typeId: 4)
class ResourcesModel {
  @HiveField(0)
  final String youtubeLink;
  @HiveField(1)
  final String bookReference;
  @HiveField(2)
  final String articleLink;

  const ResourcesModel(
      {required this.youtubeLink, required this.bookReference, required this.articleLink});
}
