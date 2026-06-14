import 'package:syntra_ai/features/learn/domain/entities/start_session_response_entity.dart';

class StartSessionResponseDto {
  String? sessionId;
  String? question;
  Map<String, String>? options;
  int? questionNumber;
  bool? isFinished;

  StartSessionResponseDto(
      {this.sessionId,
      this.question,
      this.options,
      this.questionNumber,
      this.isFinished});

  StartSessionResponseDto.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    question = json['question'];
    options =
        json['options'] != null ? Map<String, String>.from(json['options']) : null;
    questionNumber = json['question_number'];
    isFinished = json['is_finished'];
  }

  StartSessionResponseEntity toEntity() {
    return StartSessionResponseEntity(
        sessionId: sessionId ?? '',
        question: question ?? '',
        options: options ?? const {
          'A': '',
          'B': '',
          'C': '',
          'D': '',
        },
        questionNumber: questionNumber ?? 0,
        isFinished: isFinished ?? false);
  }
}

