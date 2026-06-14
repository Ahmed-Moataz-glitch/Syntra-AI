import 'package:syntra_ai/features/learn/domain/entities/progress_tracking_request_entity.dart';

class ProgressTrackingRequestDto {
  String? trackName;
  List<String>? roadmapCourses;

  ProgressTrackingRequestDto({this.trackName, this.roadmapCourses});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_name'] = trackName;
    data['roadmap_courses'] = roadmapCourses;
    return data;
  }

  ProgressTrackingRequestEntity toEntity() {
    return ProgressTrackingRequestEntity(
      trackName: trackName ?? '',
      roadmapCourses: roadmapCourses ?? const [],
    );
  }
}
