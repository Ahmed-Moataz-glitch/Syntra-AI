import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/data_source/community_data_source.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class CommunityRepoImpl implements CommunityRepo {
  final CommunityDataSource _communityDataSource;
  CommunityRepoImpl(this._communityDataSource);

  @override
  Future<ApiResult<GetUsersFinishedTracksResponseEntity>> getUsersFinishedTracks() {
    return _communityDataSource.getUsersFinishedTracks();
  }
  
}