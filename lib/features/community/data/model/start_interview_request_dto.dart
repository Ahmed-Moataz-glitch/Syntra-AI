import 'package:syntra_ai/features/community/domain/entities/start_interview_request_entity.dart';

class StartInterviewRequestDto {
  String? track;
  String? language;

  StartInterviewRequestDto({this.track, this.language});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track'] = track;
    data['language'] = language;
    return data;
  }

  StartInterviewRequestEntity toEntity() {
    return StartInterviewRequestEntity(
      track: track ?? '',
      language: language ?? '',
    );
  }
}
