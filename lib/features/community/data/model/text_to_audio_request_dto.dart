import 'package:syntra_ai/features/community/domain/entities/text_to_audio_request_entity.dart';

class TextToAudioRequestDto {
  String? text;

  TextToAudioRequestDto({this.text});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }

  TextToAudioRequestEntity toEntity() {
    return TextToAudioRequestEntity(
      text: text ?? '',
    );
  }
}
