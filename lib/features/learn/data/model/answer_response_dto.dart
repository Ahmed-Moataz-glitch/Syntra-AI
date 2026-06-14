import 'package:syntra_ai/features/learn/domain/entities/answer_response_entity.dart';

class AnswerResponseDto {
  String? sessionId;
  String? question;
  Map<String, String>? options;
  int? questionNumber;
  bool? isFinished;
  Recommendation? recommendation;

  AnswerResponseDto(
      {this.sessionId,
      this.question,
      this.options,
      this.questionNumber,
      this.isFinished,
      this.recommendation});

  AnswerResponseDto.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    question = json['question'];
    options = json['options'] != null
        ? Map<String, String>.from(json['options'])
        : null;
    questionNumber = json['question_number'];
    isFinished = json['is_finished'];
    recommendation = json['recommendation'] != null
        ? Recommendation.fromJson(json['recommendation'])
        : null;
  }

  AnswerResponseEntity toEntity() {
    return AnswerResponseEntity(
        sessionId: sessionId ?? '',
        question: question ?? '',
        options: options ??
            const {
              'A': '',
              'B': '',
              'C': '',
              'D': '',
            },
        questionNumber: questionNumber ?? 0,
        isFinished: isFinished ?? false,
        recommendation: RecommendationEntity(
          trackName: recommendation?.trackName ?? '',
          reasoning: recommendation?.reasoning ?? '',
        ));
  }
}

class Recommendation {
  String? trackName;
  String? reasoning;

  Recommendation({this.trackName, this.reasoning});

  Recommendation.fromJson(Map<String, dynamic> json) {
    trackName = json['track_name'];
    reasoning = json['reasoning'];
  }

  RecommendationEntity toEntity() {
    return RecommendationEntity(
      trackName: trackName ?? '',
      reasoning: reasoning ?? '',
    );
  }
}
