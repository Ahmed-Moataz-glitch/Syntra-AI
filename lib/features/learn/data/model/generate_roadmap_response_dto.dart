import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';

class GenerateRoadmapResponseDto {
  String? trackName;
  int? userHoursPerWeek;
  int? totalWeeksCalculated;
  List<Roadmap>? roadmap;

  GenerateRoadmapResponseDto(
      {this.trackName,
      this.userHoursPerWeek,
      this.totalWeeksCalculated,
      this.roadmap});

  GenerateRoadmapResponseDto.fromJson(Map<String, dynamic> json) {
    trackName = json['track_name'];
    userHoursPerWeek = (json['user_hours_per_week'] as num?)?.toInt();
    totalWeeksCalculated = (json['total_weeks_calculated'] as num?)?.toInt();
    if (json['roadmap'] != null) {
      roadmap = <Roadmap>[];
      json['roadmap'].forEach((v) {
        roadmap!.add(Roadmap.fromJson(v));
      });
    }
  }

  GenerateRoadmapResponseEntity toEntity() {
    return GenerateRoadmapResponseEntity(
      trackName: trackName ?? '',
      userHoursPerWeek: userHoursPerWeek ?? 0,
      totalWeeksCalculated: totalWeeksCalculated ?? 0,
      roadmap: roadmap
              ?.map((e) => RoadmapEntity(
                    weekNumber: e.weekNumber ?? 0,
                    skills: e.skills
                            ?.map((s) => SkillsEntity(
                                  skillName: s.skillName ?? '',
                                  estimatedHours: s.estimatedHours ?? 0,
                                  resources: ResourcesEntity(
                                    youtubeLink: s.resources?.youtubeLink ?? '',
                                    bookReference:
                                        s.resources?.bookReference ?? '',
                                    articleLink: s.resources?.articleLink ?? '',
                                  ),
                                ))
                            .toList() ??
                        [],
                  ))
              .toList() ??
          [],
    );
  }
}

class Roadmap {
  int? weekNumber;
  List<Skills>? skills;

  Roadmap({this.weekNumber, this.skills});

  Roadmap.fromJson(Map<String, dynamic> json) {
    weekNumber = (json['week_number'] as num?)?.toInt();
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
  }

  RoadmapEntity toEntity() {
    return RoadmapEntity(
      weekNumber: weekNumber ?? 0,
      skills: skills
              ?.map((s) => SkillsEntity(
                    skillName: s.skillName ?? '',
                    estimatedHours: s.estimatedHours ?? 0,
                    resources: ResourcesEntity(
                      youtubeLink: s.resources?.youtubeLink ?? '',
                      bookReference: s.resources?.bookReference ?? '',
                      articleLink: s.resources?.articleLink ?? '',
                    ),
                  ))
              .toList() ??
          [],
    );
  }
}

class Skills {
  String? skillName;
  int? estimatedHours;
  Resources? resources;

  Skills({this.skillName, this.estimatedHours, this.resources});

  Skills.fromJson(Map<String, dynamic> json) {
    skillName = json['skill_name'];
    estimatedHours = (json['estimated_hours'] as num?)?.toInt();
    resources = json['resources'] != null
        ? Resources.fromJson(json['resources'])
        : null;
  }

  SkillsEntity toEntity() {
    return SkillsEntity(
      skillName: skillName ?? '',
      estimatedHours: estimatedHours ?? 0,
      resources: ResourcesEntity(
        youtubeLink: resources?.youtubeLink ?? '',
        bookReference: resources?.bookReference ?? '',
        articleLink: resources?.articleLink ?? '',
      ),
    );
  }
}

class Resources {
  String? youtubeLink;
  String? bookReference;
  String? articleLink;

  Resources({this.youtubeLink, this.bookReference, this.articleLink});

  Resources.fromJson(Map<String, dynamic> json) {
    youtubeLink = json['youtube_link'];
    bookReference = json['book_reference'];
    articleLink = json['article_link'];
  }

  ResourcesEntity toEntity() {
    return ResourcesEntity(
      youtubeLink: youtubeLink ?? '',
      bookReference: bookReference ?? '',
      articleLink: articleLink ?? '',
    );
  }
}
