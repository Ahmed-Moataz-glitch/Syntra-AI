import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_response_entity.dart';

class ExtractKeyPointsResponseDto {
  String? trackName;
  List<String>? keyPoints;

  ExtractKeyPointsResponseDto({this.trackName, this.keyPoints});

  ExtractKeyPointsResponseDto.fromJson(Map<String, dynamic> json) {
    trackName = json['track_name'];
    keyPoints = json['key_points'].cast<String>();
  }

  ExtractKeyPointsResponseEntity toEntity() {
    return ExtractKeyPointsResponseEntity(
      trackName: trackName ?? '',
      keyPoints: keyPoints ?? [],
    );
  }
}
