class GenerateRoadmapResponseEntity {
  String trackName;
  int userHoursPerWeek;
  int totalWeeksCalculated;
  int selectedIndex;
  int progress;
  List<RoadmapEntity> roadmap;

  GenerateRoadmapResponseEntity(
      {this.trackName = '',
      this.userHoursPerWeek = 0,
      this.totalWeeksCalculated = 0,
      this.selectedIndex = 0,
      this.progress = 0,
      this.roadmap = const []});
}

class RoadmapEntity {
  int weekNumber;
  bool isCompleted;
  List<SkillsEntity> skills;

  RoadmapEntity({this.weekNumber = 0, this.isCompleted = false, this.skills = const []});
}

class SkillsEntity {
  String skillName;
  int estimatedHours;
  ResourcesEntity resources;

  SkillsEntity(
      {this.skillName = '',
      this.estimatedHours = 0,
      this.resources = const ResourcesEntity()});
}

class ResourcesEntity {
  final String youtubeLink;
  final String bookReference;
  final String articleLink;

  const ResourcesEntity(
      {this.youtubeLink = '', this.bookReference = '', this.articleLink = ''});
}
