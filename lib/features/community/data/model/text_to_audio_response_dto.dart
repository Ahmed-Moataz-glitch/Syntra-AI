import 'package:syntra_ai/features/community/domain/entities/text_to_audio_response_entity.dart';

class TextToAudioResponseDto {
  String? audio;

  TextToAudioResponseDto({this.audio});

  TextToAudioResponseDto.fromJson(Map<String, dynamic> json) {
    audio = json['audio'];
  }

  TextToAudioResponseEntity toEntity() {
    return TextToAudioResponseEntity(
      audio: audio ?? '',
    );
  }
}
