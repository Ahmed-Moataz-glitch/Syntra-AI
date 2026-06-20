import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/data/api/community_api.dart';
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
import 'package:syntra_ai/features/community/domain/entities/end_interview_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/get_interview_session_status_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/get_languages_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/get_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/interview_chat_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/interview_chat_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/process_audio_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/process_audio_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/start_interview_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/start_interview_response_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/text_to_audio_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/text_to_audio_response_entity.dart';
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

  @override
  Future<ApiResult<GetTracksResponseEntity>> getTracks() async {
    final result = await _communityApi.getTracks();
    switch (result) { 
      case ApiSuccess<GetTracksResponseDto>():
        return ApiSuccess<GetTracksResponseEntity>(result.data?.toEntity());
      case ApiError<GetTracksResponseDto>():
        return ApiError<GetTracksResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<GetLanguagesResponseEntity>> getLanguages() async {
    final result = await _communityApi.getLanguages();
    switch (result) {
      case ApiSuccess<GetLanguagesResponseDto>():
        return ApiSuccess<GetLanguagesResponseEntity>(result.data?.toEntity());
      case ApiError<GetLanguagesResponseDto>():
        return ApiError<GetLanguagesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<StartInterviewResponseEntity>> startInterview(StartInterviewRequestEntity startInterviewRequestEntity) async {
    final result = await _communityApi.startInterview(
      StartInterviewRequestDto(
        track: startInterviewRequestEntity.track,
        language: startInterviewRequestEntity.language,
      )
    );
    switch (result) {
      case ApiSuccess<StartInterviewResponseDto>():
        return ApiSuccess<StartInterviewResponseEntity>(result.data?.toEntity());
      case ApiError<StartInterviewResponseDto>():
        return ApiError<StartInterviewResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<InterviewChatResponseEntity>> interviewChat(InterviewChatRequestEntity interviewChatRequestEntity) async {
    final result = await _communityApi.interviewChat(
      InterviewChatRequestDto(
        sessionId: interviewChatRequestEntity.sessionId,
        message: interviewChatRequestEntity.message,
      )
    );
    switch (result) {
      case ApiSuccess<InterviewChatResponseDto>():
        return ApiSuccess<InterviewChatResponseEntity>(result.data?.toEntity());
      case ApiError<InterviewChatResponseDto>():
        return ApiError<InterviewChatResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<GetInterviewSessionStatusResponseEntity>> getInterviewSessionStatus(String sessionId) async {
    final result = await _communityApi.getInterviewSessionStatus(sessionId);
    switch (result) {
      case ApiSuccess<GetInterviewSessionStatusResponseDto>():
        return ApiSuccess<GetInterviewSessionStatusResponseEntity>(result.data?.toEntity());
      case ApiError<GetInterviewSessionStatusResponseDto>():
        return ApiError<GetInterviewSessionStatusResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<TextToAudioResponseEntity>> textToAudio(TextToAudioRequestEntity textToAudioRequestEntity) async {
    final result = await _communityApi.textToAudio(
      TextToAudioRequestDto(
        text: textToAudioRequestEntity.text,
      )
    );
    switch (result) {
      case ApiSuccess<TextToAudioResponseDto>():
        return ApiSuccess<TextToAudioResponseEntity>(result.data?.toEntity());
      case ApiError<TextToAudioResponseDto>():
        return ApiError<TextToAudioResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<EndInterviewResponseEntity>> endInterview(String sessionId) async {
    final result = await _communityApi.endInterview(sessionId);
    switch (result) {
      case ApiSuccess<EndInterviewResponseDto>():
        return ApiSuccess<EndInterviewResponseEntity>(result.data?.toEntity());
      case ApiError<EndInterviewResponseDto>():
        return ApiError<EndInterviewResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<ProcessAudioResponseEntity>> processAudio(ProcessAudioRequestEntity processAudioRequestEntity) async {
    final result = await _communityApi.processAudio(
      ProcessAudioRequestDto(
        audio: processAudioRequestEntity.audio,
      )
    );
    switch (result) {
      case ApiSuccess<ProcessAudioResponseDto>():
        return ApiSuccess<ProcessAudioResponseEntity>(result.data?.toEntity());
      case ApiError<ProcessAudioResponseDto>():
        return ApiError<ProcessAudioResponseEntity>(result.message);
    }
  }
}
