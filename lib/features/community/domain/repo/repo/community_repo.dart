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

abstract class CommunityRepo {
  Future<ApiResult<GetUsersFinishedTracksResponseEntity>> getUsersFinishedTracks();

  Future<ApiResult<GetTracksResponseEntity>> getTracks();

  Future<ApiResult<GetLanguagesResponseEntity>> getLanguages();

  Future<ApiResult<StartInterviewResponseEntity>> startInterview(
      StartInterviewRequestEntity startInterviewRequestEntity);

  Future<ApiResult<InterviewChatResponseEntity>> interviewChat(
      InterviewChatRequestEntity interviewChatRequestEntity);

  Future<ApiResult<GetInterviewSessionStatusResponseEntity>>
      getInterviewSessionStatus(String sessionId);

  Future<ApiResult<EndInterviewResponseEntity>> endInterview(String sessionId);

  Future<ApiResult<TextToAudioResponseEntity>> textToAudio(
      TextToAudioRequestEntity textToAudioRequestEntity);

  Future<ApiResult<ProcessAudioResponseEntity>> processAudio(
      ProcessAudioRequestEntity processAudioRequestEntity);
}
