// ignore_for_file: unused_field
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:syntra_ai/features/community/domain/use_case/end_interview_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_interview_session_status_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_languages_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_tracks_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_users_finished_tracks_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/interview_chat_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/process_audio_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/start_interview_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/text_to_audio_use_case.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final GetUsersFinishedTracksUseCase getUsersFinishedTracksUseCase;
  final GetTracksUseCase getTracksUseCase;
  final GetLanguagesUseCase getLanguagesUseCase;
  final StartInterviewUseCase startInterviewUseCase;
  final InterviewChatUseCase interviewChatUseCase;
  final GetInterviewSessionStatusUseCase getInterviewSessionStatusUseCase;
  final EndInterviewUseCase endInterviewUseCase;
  final TextToAudioUseCase textToAudioUseCase;
  final ProcessAudioUseCase processAudioUseCase;
  CommunityCubit({
    required this.getUsersFinishedTracksUseCase,
    required this.getTracksUseCase,
    required this.getLanguagesUseCase,
    required this.startInterviewUseCase,
    required this.interviewChatUseCase,
    required this.getInterviewSessionStatusUseCase,
    required this.endInterviewUseCase,
    required this.textToAudioUseCase,
    required this.processAudioUseCase,
  }) : super(CommunityInitial());

  Future<void> getUsersFinishedTracks() async {
    emit(GetUsersFinishedTracksLoading());
    try {
      final result = await getUsersFinishedTracksUseCase.call();
      switch (result) {
        case ApiSuccess<GetUsersFinishedTracksResponseEntity>():
          emit(GetUsersFinishedTracksSuccess(result.data!));
          break;
        case ApiError<GetUsersFinishedTracksResponseEntity>():
          emit(GetUsersFinishedTracksError(result.message));
          break;
      }
    } catch (e) {
      emit(GetUsersFinishedTracksError(e.toString()));
    }
  }

  Future<void> getTracks() async {
    emit(GetTracksLoading());
    try {
      final result = await getTracksUseCase.call();
      switch (result) {
        case ApiSuccess<GetTracksResponseEntity>():
          emit(GetTracksSuccess(result.data!));
          break;
        case ApiError<GetTracksResponseEntity>():
          emit(GetTracksError(result.message));
          break;
      }
    } catch (e) {
      emit(GetTracksError(e.toString()));
    }
  }

  Future<void> getLanguages() async {
    emit(GetLanguagesLoading());
    try {
      final result = await getLanguagesUseCase.call();
      switch (result) {
        case ApiSuccess<GetLanguagesResponseEntity>():
          emit(GetLanguagesSuccess(result.data!));
          break;
        case ApiError<GetLanguagesResponseEntity>():
          emit(GetLanguagesError(result.message));
          break;
      }
    } catch (e) {
      emit(GetLanguagesError(e.toString()));
    }
  }

  Future<void> startInterview(StartInterviewRequestEntity startInterviewRequestEntity) async {
    emit(StartInterviewLoading());
    try {
      final result = await startInterviewUseCase.call(startInterviewRequestEntity);
      switch (result) {
        case ApiSuccess<StartInterviewResponseEntity>():
          emit(StartInterviewSuccess(result.data!));
          break;
        case ApiError<StartInterviewResponseEntity>():
          emit(StartInterviewError(result.message));
          break;
      }
    } catch (e) {
      emit(StartInterviewError(e.toString()));
    }
  }

  Future<void> interviewChat(InterviewChatRequestEntity interviewChatRequestEntity) async {
    emit(InterviewChatLoading());
    try {
      final result = await interviewChatUseCase.call(interviewChatRequestEntity);
      switch (result) {
        case ApiSuccess<InterviewChatResponseEntity>():
          emit(InterviewChatSuccess(result.data!));
          break;
        case ApiError<InterviewChatResponseEntity>():
          emit(InterviewChatError(result.message));
          break;
      }
    } catch (e) {
      emit(InterviewChatError(e.toString()));
    }
  }

  Future<void> getInterviewSessionStatus(String sessionId) async {
    emit(GetInterviewSessionStatusLoading());
    try {
      final result = await getInterviewSessionStatusUseCase.call(sessionId);
      switch (result) {
        case ApiSuccess<GetInterviewSessionStatusResponseEntity>():
          emit(GetInterviewSessionStatusSuccess(result.data!));
          break;
        case ApiError<GetInterviewSessionStatusResponseEntity>():
          emit(GetInterviewSessionStatusError(result.message));
          break;
      }
    } catch (e) {
      emit(GetInterviewSessionStatusError(e.toString()));
    }
  }

  Future<void> endInterview(String sessionId) async {
    emit(EndInterviewLoading());
    try {
      final result = await endInterviewUseCase.call(sessionId);
      switch (result) {
        case ApiSuccess<EndInterviewResponseEntity>():
          emit(EndInterviewSuccess(result.data!));
          break;
        case ApiError<EndInterviewResponseEntity>():
          emit(EndInterviewError(result.message));
          break;
      }
    } catch (e) {
      emit(EndInterviewError(e.toString()));
    }
  }

  Future<void> textToAudio(TextToAudioRequestEntity textToAudioRequestEntity) async {
    emit(TextToAudioLoading());
    try {
      final result = await textToAudioUseCase.call(textToAudioRequestEntity);
      switch (result) {
        case ApiSuccess<TextToAudioResponseEntity>():
          emit(TextToAudioSuccess(result.data!));
          break;
        case ApiError<TextToAudioResponseEntity>():
          emit(TextToAudioError(result.message));
          break;
      }
    } catch (e) {
      emit(TextToAudioError(e.toString()));
    }
  }

  Future<void> processAudio(ProcessAudioRequestEntity processAudioRequestEntity) async {
    emit(ProcessAudioLoading());
    try {
      final result = await processAudioUseCase.call(processAudioRequestEntity);
      switch (result) {
        case ApiSuccess<ProcessAudioResponseEntity>():
          emit(ProcessAudioSuccess(result.data!));
          break;
        case ApiError<ProcessAudioResponseEntity>():
          emit(ProcessAudioError(result.message));
          break;
      }
    } catch (e) {
      emit(ProcessAudioError(e.toString()));
    }
  }
}