import 'package:syntra_ai/features/community/data/api/api_result.dart';
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
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class CommunityRepoImpl implements CommunityRepo {
  final CommunityDataSource _communityDataSource;
  CommunityRepoImpl(this._communityDataSource);

  @override
  Future<ApiResult<GetUsersFinishedTracksResponseEntity>> getUsersFinishedTracks() {
    return _communityDataSource.getUsersFinishedTracks();
  }

  @override
  Future<ApiResult<GetTracksResponseEntity>> getTracks() {
    return _communityDataSource.getTracks();
  }

  @override
  Future<ApiResult<GetLanguagesResponseEntity>> getLanguages() {
    return _communityDataSource.getLanguages();
  }

  @override
  Future<ApiResult<StartInterviewResponseEntity>> startInterview(StartInterviewRequestEntity startInterviewRequestEntity) {
    return _communityDataSource.startInterview(startInterviewRequestEntity);
  }

  @override
  Future<ApiResult<InterviewChatResponseEntity>> interviewChat(InterviewChatRequestEntity interviewChatRequestEntity) {
    return _communityDataSource.interviewChat(interviewChatRequestEntity);
  }

  @override
  Future<ApiResult<GetInterviewSessionStatusResponseEntity>> getInterviewSessionStatus(String sessionId) {
    return _communityDataSource.getInterviewSessionStatus(sessionId);
  }

  @override
  Future<ApiResult<TextToAudioResponseEntity>> textToAudio(TextToAudioRequestEntity textToAudioRequestEntity) {
    return _communityDataSource.textToAudio(textToAudioRequestEntity);
  }

  @override
  Future<ApiResult<EndInterviewResponseEntity>> endInterview(String sessionId) {
    return _communityDataSource.endInterview(sessionId);
  }

  @override
  Future<ApiResult<ProcessAudioResponseEntity>> processAudio(ProcessAudioRequestEntity processAudioRequestEntity) {
    return _communityDataSource.processAudio(processAudioRequestEntity);
  }
  
}