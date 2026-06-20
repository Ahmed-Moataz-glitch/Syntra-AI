import 'package:syntra_ai/features/community/domain/entities/end_interview_response_entity.dart';

class EndInterviewResponseDto {
  bool? ended;

  EndInterviewResponseDto({this.ended});

  EndInterviewResponseDto.fromJson(Map<String, dynamic> json) {
    ended = json['ended'];
  }

  EndInterviewResponseEntity toEntity() {
    return EndInterviewResponseEntity(
      ended: ended ?? false,
    );
  }
}
