import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_request_entity.dart';

class RecommendedProjectsRequestDto {
  String? track;
  List<String>? technologies;

  RecommendedProjectsRequestDto({this.track, this.technologies});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track'] = track;
    data['technologies'] = technologies;
    return data;
  }

  RecommendedProjectsRequestEntity toEntity() {
    return RecommendedProjectsRequestEntity(
      track: track ?? '',
      technologies: technologies ?? [],
    );
  }
}
