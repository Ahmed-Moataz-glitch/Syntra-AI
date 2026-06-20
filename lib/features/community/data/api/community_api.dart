import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/core/utils/secure_storage.dart';
import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/data/model/end_interview_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/get_interview_session_status_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/get_languages_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/get_tracks_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/get_users_finished_tracks_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/interview_chat_request_dto.dart';
import 'package:syntra_ai/features/community/data/model/interview_chat_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/process_audio_request_dto.dart';
import 'package:syntra_ai/features/community/data/model/process_audio_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/start_interview_request_dto.dart';
import 'package:syntra_ai/features/community/data/model/start_interview_response_dto.dart';
import 'package:syntra_ai/features/community/data/model/text_to_audio_request_dto.dart';
import 'package:syntra_ai/features/community/data/model/text_to_audio_response_dto.dart';

class CommunityApi {
    Future<ApiResult<GetUsersFinishedTracksResponseDto>> getUsersFinishedTracks() async {
    final token = await SecureStorage.getToken();
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
          'Authorization': 'Bearer $token',
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

  Future<ApiResult<GetTracksResponseDto>> getTracks() async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.getTracksEndpoint,
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
        return ApiError<GetTracksResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<GetTracksResponseDto>(
        GetTracksResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<GetTracksResponseDto>(e.toString());
    }
  }

  Future<ApiResult<GetLanguagesResponseDto>> getLanguages() async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.getLanguagesEndpoint,
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
        return ApiError<GetLanguagesResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<GetLanguagesResponseDto>(
        GetLanguagesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<GetLanguagesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<StartInterviewResponseDto>> startInterview(StartInterviewRequestDto startInterviewRequestDto) async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.startInterviewEndpoint,
    );

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(startInterviewRequestDto.toJson()),
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<StartInterviewResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<StartInterviewResponseDto>(
        StartInterviewResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<StartInterviewResponseDto>(e.toString());
    }
  }

  Future<ApiResult<InterviewChatResponseDto>> interviewChat(InterviewChatRequestDto interviewChatRequestDto) async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.interviewChatEndpoint,
    );

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(interviewChatRequestDto.toJson()),
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<InterviewChatResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<InterviewChatResponseDto>(
        InterviewChatResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<InterviewChatResponseDto>(e.toString());
    }
  }

  Future<ApiResult<GetInterviewSessionStatusResponseDto>> getInterviewSessionStatus(String sessionId) async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.getInterviewSessionStatusEndpoint + sessionId,
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
        return ApiError<GetInterviewSessionStatusResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<GetInterviewSessionStatusResponseDto>(
        GetInterviewSessionStatusResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<GetInterviewSessionStatusResponseDto>(e.toString());
    }
  }

  Future<ApiResult<EndInterviewResponseDto>> endInterview(String sessionId) async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.endInterviewEndpointPart1 + sessionId + AppApi.endInterviewEndpointPart2,
    );

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<EndInterviewResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<EndInterviewResponseDto>(
        EndInterviewResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<EndInterviewResponseDto>(e.toString());
    }
  }

  Future<ApiResult<TextToAudioResponseDto>> textToAudio(TextToAudioRequestDto textToAudioRequestDto) async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.textToAudioEndpoint,
    );

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(textToAudioRequestDto.toJson()),
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<TextToAudioResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<TextToAudioResponseDto>(
        TextToAudioResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<TextToAudioResponseDto>(e.toString());
    }
  }

  Future<ApiResult<ProcessAudioResponseDto>> processAudio(ProcessAudioRequestDto processAudioRequestDto) async {
    var url = Uri.https(
      AppApi.interviewHost,
      AppApi.processAudioEndpoint,
    );

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(processAudioRequestDto.toJson()),
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<ProcessAudioResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<ProcessAudioResponseDto>(
        ProcessAudioResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<ProcessAudioResponseDto>(e.toString());
    }
  }
}
