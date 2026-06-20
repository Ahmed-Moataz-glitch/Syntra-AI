import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class GetTracksUseCase {
  final CommunityRepo _communityRepo;
  GetTracksUseCase(this._communityRepo);

  Future<ApiResult<GetTracksResponseEntity>> call() {
    return _communityRepo.getTracks();
  }
}