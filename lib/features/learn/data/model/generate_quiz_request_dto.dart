import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_request_entity.dart';

class GenerateQuizRequestDto {
  String? trackName;
  List<String>? keyPoints;

  GenerateQuizRequestDto({this.trackName, this.keyPoints});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_name'] = trackName;
    data['key_points'] = keyPoints;
    return data;
  }

  GenerateQuizRequestEntity toEntity() {
    return GenerateQuizRequestEntity(
      trackName: trackName ?? '',
      keyPoints: keyPoints ?? [],
    );
  }
}
