import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_request_entity.dart';

class EvaluateProjectRequestDto {
  String? projectLink;
  String? trackId;
  String? studentId;
  String? projectDescription;

  EvaluateProjectRequestDto(
      {this.projectLink,
      this.trackId,
      this.studentId,
      this.projectDescription});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectLink'] = projectLink;
    data['trackId'] = trackId;
    data['studentId'] = studentId;
    data['project_description'] = projectDescription;
    return data;
  }

  EvaluateProjectRequestEntity toEntity() {
    return EvaluateProjectRequestEntity(
      projectLink: projectLink ?? '',
      trackId: trackId ?? '',
      studentId: studentId ?? '',
      projectDescription: projectDescription ?? '',
    );
  }
}
