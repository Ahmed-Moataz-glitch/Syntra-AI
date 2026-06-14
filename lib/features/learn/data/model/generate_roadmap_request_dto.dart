import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_request_entity.dart';

class GenerateRoadmapRequestDto {
  String? trackName;
  int? hoursPerWeek;

  GenerateRoadmapRequestDto({this.trackName, this.hoursPerWeek});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_name'] = trackName;
    data['hours_per_week'] = hoursPerWeek;
    return data;
  }

  GenerateRoadmapRequestEntity toEntity() {
    return GenerateRoadmapRequestEntity(
      trackName: trackName ?? '',
      hoursPerWeek: hoursPerWeek ?? 0,
    );
  }
}
