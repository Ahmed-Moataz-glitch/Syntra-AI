import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_response_entity.dart';

class RecommendedProjectsResponseDto {
  List<Projects>? projects;

  RecommendedProjectsResponseDto({this.projects});

  RecommendedProjectsResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
      });
    }
  }

  RecommendedProjectsResponseEntity toEntity() {
    return RecommendedProjectsResponseEntity(
      projects: projects?.map((project) => ProjectsEntity(
        projectTitle: project.projectTitle ?? '',
        difficulty: project.difficulty ?? '',
        overview: project.overview ?? '',
        coreFeatures: project.coreFeatures ?? [],
        techStackUsage: project.techStackUsage ?? '',
        implementationSteps: project.implementationSteps ?? [],
      )).toList() ?? [],
    );
  }
}

class Projects {
  String? projectTitle;
  String? difficulty;
  String? overview;
  List<String>? coreFeatures;
  String? techStackUsage;
  List<String>? implementationSteps;

  Projects(
      {this.projectTitle,
      this.difficulty,
      this.overview,
      this.coreFeatures,
      this.techStackUsage,
      this.implementationSteps});

  Projects.fromJson(Map<String, dynamic> json) {
    projectTitle = json['project_title'];
    difficulty = json['difficulty'];
    overview = json['overview'];
    coreFeatures = json['core_features'].cast<String>();
    techStackUsage = json['tech_stack_usage'];
    implementationSteps = json['implementation_steps'].cast<String>();
  }

  ProjectsEntity toEntity() {
    return ProjectsEntity(
      projectTitle: projectTitle ?? '',
      difficulty: difficulty ?? '',
      overview: overview ?? '',
      coreFeatures: coreFeatures ?? [],
      techStackUsage: techStackUsage ?? '',
      implementationSteps: implementationSteps ?? [],
    );
  }
}
