import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/text_to_audio_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/text_to_audio_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class TextToAudioUseCase {
  final CommunityRepo _communityRepo;
  TextToAudioUseCase(this._communityRepo);

  Future<ApiResult<TextToAudioResponseEntity>> call(
      TextToAudioRequestEntity textToAudioRequestEntity) {
    return _communityRepo.textToAudio(textToAudioRequestEntity);
  }
}