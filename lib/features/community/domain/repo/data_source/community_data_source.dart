import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';

abstract class CommunityDataSource {
  Future<ApiResult<GetUsersFinishedTracksResponseEntity>> getUsersFinishedTracks();
}
