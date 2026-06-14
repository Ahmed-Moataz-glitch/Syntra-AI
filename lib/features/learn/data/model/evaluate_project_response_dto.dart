import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_response_entity.dart';

class EvaluateProjectResponseDto {
  String? message;
  String? studentId;

  EvaluateProjectResponseDto({this.message, this.studentId});

  EvaluateProjectResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    studentId = json['studentId'];
  }

  EvaluateProjectResponseEntity toEntity() {
    return EvaluateProjectResponseEntity(
      message: message ?? '',
      studentId: studentId ?? '',
    );
  }
}
