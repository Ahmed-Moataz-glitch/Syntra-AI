import 'package:syntra_ai/features/learn/domain/entities/evaluation_result_response_entity.dart';

class EvaluationResultResponseDto {
  int? score;
  String? status;
  Feedback? feedback;
  List<RequirementsMet>? requirementsMet;

  EvaluationResultResponseDto(
      {this.score, this.status, this.feedback, this.requirementsMet});

  EvaluationResultResponseDto.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    status = json['status'];
    feedback = json['feedback'] != null
        ? Feedback.fromJson(json['feedback'])
        : null;
    if (json['requirements_met'] != null) {
      requirementsMet = <RequirementsMet>[];
      json['requirements_met'].forEach((v) {
        requirementsMet!.add(RequirementsMet.fromJson(v));
      });
    }
  }

  EvaluationResultResponseEntity toEntity() {
    return EvaluationResultResponseEntity(
      score: score ?? 0,
      status: status ?? '',
      feedback: FeedbackEnity(
        strengths: feedback?.strengths ?? [],
        weaknesses: feedback?.weaknesses ?? [],
        suggestions: feedback?.suggestions ?? '',
      ),
      requirementsMet: requirementsMet
              ?.map((e) => RequirementsMetEntity(
                    feature: e.feature ?? '',
                    status: e.status ?? false,
                  ))
              .toList() ??
          [],
    );
  }
}

class Feedback {
  List<String>? strengths;
  List<String>? weaknesses;
  String? suggestions;

  Feedback({this.strengths, this.weaknesses, this.suggestions});

  Feedback.fromJson(Map<String, dynamic> json) {
    if (json['strengths'] != null) {
      strengths = [];
      json['strengths'].forEach((v) {
        strengths!.add(v);
      });
    }
    weaknesses = (json['weaknesses'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
      <String>[];
    suggestions = json['suggestions'];
  }

  FeedbackEnity toEntity() {
    return FeedbackEnity(
      strengths: strengths ?? [],
      weaknesses: weaknesses ?? [],
      suggestions: suggestions ?? '',
    );
  }
}

class RequirementsMet {
  String? feature;
  bool? status;

  RequirementsMet({this.feature, this.status});

  RequirementsMet.fromJson(Map<String, dynamic> json) {
    feature = json['feature'];
    status = json['status'];
  }

  RequirementsMetEntity toEntity() {
    return RequirementsMetEntity(
      feature: feature ?? '',
      status: status ?? false,
    );
  }
}
