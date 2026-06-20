import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/process_audio_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/process_audio_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class ProcessAudioUseCase {
  final CommunityRepo _communityRepo;
  ProcessAudioUseCase(this._communityRepo);

  Future<ApiResult<ProcessAudioResponseEntity>> call(
      ProcessAudioRequestEntity processAudioRequestEntity) {
    return _communityRepo.processAudio(processAudioRequestEntity);
  }
}