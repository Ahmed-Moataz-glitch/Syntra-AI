import 'package:syntra_ai/features/community/domain/entities/get_interview_session_status_response_entity.dart';

class GetInterviewSessionStatusResponseDto {
  String? sessionId;
  String? track;
  String? language;
  bool? done;
  Null rating;
  Null evaluation;

  GetInterviewSessionStatusResponseDto(
      {this.sessionId,
      this.track,
      this.language,
      this.done,
      this.rating,
      this.evaluation});

  GetInterviewSessionStatusResponseDto.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    track = json['track'];
    language = json['language'];
    done = json['done'];
    rating = json['rating'];
    evaluation = json['evaluation'];
  }

  GetInterviewSessionStatusResponseEntity toEntity() {
    return GetInterviewSessionStatusResponseEntity(
      sessionId: sessionId ?? '',
      track: track ?? '',
      language: language ?? '',
      done: done ?? false,
      rating: rating,
      evaluation: evaluation
    );
  }
}