import 'package:syntra_ai/features/community/domain/entities/interview_chat_request_entity.dart';

class InterviewChatRequestDto {
  String? sessionId;
  String? message;

  InterviewChatRequestDto({this.sessionId, this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_id'] = sessionId;
    data['message'] = message;
    return data;
  }

  InterviewChatRequestEntity toEntity() {
    return InterviewChatRequestEntity(
      sessionId: sessionId ?? '',
      message: message ?? '',
    );
  }
}
