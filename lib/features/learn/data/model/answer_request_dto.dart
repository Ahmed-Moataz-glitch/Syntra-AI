import 'package:syntra_ai/features/learn/domain/entities/answer_request_entity.dart';

class AnswerRequestDto {
  String? sessionId;
  String? selectedAnswer;

  AnswerRequestDto({this.sessionId, this.selectedAnswer});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_id'] = sessionId;
    data['user_answer'] = selectedAnswer;
    return data;
  }

  AnswerRequestEntity toEntity(){
    return AnswerRequestEntity(sessionId: sessionId ?? '', selectedAnswer: selectedAnswer ?? '');
  }
}
