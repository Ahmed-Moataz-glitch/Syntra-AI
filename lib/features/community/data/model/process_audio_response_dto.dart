import 'package:syntra_ai/features/community/domain/entities/process_audio_response_entity.dart';

class ProcessAudioResponseDto {
  String? text;

  ProcessAudioResponseDto({this.text});

  ProcessAudioResponseDto.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  ProcessAudioResponseEntity toEntity() {
    return ProcessAudioResponseEntity(
      text: text ?? '',
    );
  }
}
