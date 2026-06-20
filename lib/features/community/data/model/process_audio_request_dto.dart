import 'package:syntra_ai/features/community/domain/entities/process_audio_request_entity.dart';

class ProcessAudioRequestDto {
  String? audio;
  String? language;

  ProcessAudioRequestDto({this.audio, this.language});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['audio'] = audio;
    data['language'] = language;
    return data;
  }

  ProcessAudioRequestEntity toEntity() {
    return ProcessAudioRequestEntity(
      audio: audio ?? '',
      language: language ?? '',
    );
  }
}
