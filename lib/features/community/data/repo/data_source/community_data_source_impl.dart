import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/data/api/community_api.dart';
import 'package:syntra_ai/features/community/data/model/get_users_finished_tracks_response_dto.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/data_source/community_data_source.dart';

class CommunityDataSourceImpl implements CommunityDataSource {
  final CommunityApi _communityApi;
  CommunityDataSourceImpl(this._communityApi);

  @override
  Future<ApiResult<GetUsersFinishedTracksResponseEntity>> getUsersFinishedTracks() async {
    final result = await _communityApi.getUsersFinishedTracks();
    switch (result) {
      case ApiSuccess<GetUsersFinishedTracksResponseDto>():
        return ApiSuccess<GetUsersFinishedTracksResponseEntity>(result.data?.toEntity());
      case ApiError<GetUsersFinishedTracksResponseDto>():
        return ApiError<GetUsersFinishedTracksResponseEntity>(result.message);
    }
  }
}
