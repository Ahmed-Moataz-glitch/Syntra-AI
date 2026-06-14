class RecommendedProjectsResponseEntity {
  List<ProjectsEntity> projects;

  RecommendedProjectsResponseEntity({this.projects = const []});
}

class ProjectsEntity {
  String projectTitle;
  String difficulty;
  String overview;
  List<String> coreFeatures;
  String techStackUsage;
  List<String> implementationSteps;

  ProjectsEntity(
      {this.projectTitle = '',
      this.difficulty = '',
      this.overview = '',
      this.coreFeatures = const [],
      this.techStackUsage = '',
      this.implementationSteps = const []});
}
