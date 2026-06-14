import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/data/model/get_users_finished_tracks_response_dto.dart';

class CommunityApi {
    Future<ApiResult<GetUsersFinishedTracksResponseDto>> getUsersFinishedTracks() async {
    var url = Uri.https(
      AppApi.authHost,
      AppApi.baseUrl + AppApi.getusersFinishedTracksEndpoint,
    );

    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<GetUsersFinishedTracksResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<GetUsersFinishedTracksResponseDto>(
        GetUsersFinishedTracksResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<GetUsersFinishedTracksResponseDto>(e.toString());
    }
  }
}
