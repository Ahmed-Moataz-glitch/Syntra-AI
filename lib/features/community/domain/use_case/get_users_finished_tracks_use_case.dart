import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class GetUsersFinishedTracksUseCase {
  final CommunityRepo communityRepo;
  GetUsersFinishedTracksUseCase(this.communityRepo);

  Future<ApiResult<GetUsersFinishedTracksResponseEntity>> call(){
    return communityRepo.getUsersFinishedTracks();
  }
}