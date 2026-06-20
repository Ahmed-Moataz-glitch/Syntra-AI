import 'package:syntra_ai/features/community/domain/entities/interview_chat_response_entity.dart';

class InterviewChatResponseDto {
  String? sessionId;
  String? message;
  bool? done;
  Null rating;
  Null evaluation;

  InterviewChatResponseDto(
      {this.sessionId, this.message, this.done, this.rating, this.evaluation});

  InterviewChatResponseDto.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    message = json['message'];
    done = json['done'];
    rating = json['rating'];
    evaluation = json['evaluation'];
  }

  InterviewChatResponseEntity toEntity() {
    return InterviewChatResponseEntity(
      sessionId: sessionId ?? '',
      message: message ?? '',
      done: done ?? false,
      rating: rating,
      evaluation: evaluation,
    );
  }
}
