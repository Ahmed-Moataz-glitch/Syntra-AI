import 'package:syntra_ai/features/learn/domain/entities/progress_tracking_response_entity.dart';

class ProgressTrackingResponseDto {
  String? trackName;
  Map<String, double>? allCoursesWeights;

  ProgressTrackingResponseDto({this.trackName, this.allCoursesWeights});

  ProgressTrackingResponseDto.fromJson(Map<String, dynamic> json) {
    trackName = json['track_name'];
    allCoursesWeights = json['all_courses_weights'] != null
        ? Map<String, double>.from(json['all_courses_weights'])
        : null;
  }

  ProgressTrackingResponseEntity toEntity() {
    return ProgressTrackingResponseEntity(
      trackName: trackName ?? '',
      allCoursesWeights: allCoursesWeights ?? const {},
    );
  }
}

