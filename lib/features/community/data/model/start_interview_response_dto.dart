import 'package:syntra_ai/features/community/domain/entities/start_interview_response_entity.dart';

class StartInterviewResponseDto {
  String? sessionId;
  String? track;
  String? language;
  String? message;
  bool? done;

  StartInterviewResponseDto(
      {this.sessionId, this.track, this.language, this.message, this.done});

  StartInterviewResponseDto.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    track = json['track'];
    language = json['language'];
    message = json['message'];
    done = json['done'];
  }

  StartInterviewResponseEntity toEntity() {
    return StartInterviewResponseEntity(
      sessionId: sessionId ?? '',
      track: track ?? '',
      language: language ?? '',
      message: message ?? '',
      done: done ?? false,
    );
  }
}
