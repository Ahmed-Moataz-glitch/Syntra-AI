import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_request_entity.dart';

class ExtractKeyPointsRequestDto {
  String? trackName;
  List<String>? urls;

  ExtractKeyPointsRequestDto({this.trackName, this.urls});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_name'] = trackName;
    data['urls'] = urls;
    return data;
  }

  ExtractKeyPointsRequestEntity toEntity() {
    return ExtractKeyPointsRequestEntity(
      trackName: trackName ?? '',
      urls: urls ?? [],
    );
  }
}
