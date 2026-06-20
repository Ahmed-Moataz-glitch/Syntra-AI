part of 'community_cubit.dart';

sealed class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class GetUsersFinishedTracksLoading extends CommunityState {}

final class GetUsersFinishedTracksSuccess extends CommunityState {
  final GetUsersFinishedTracksResponseEntity
      getUsersFinishedTracksResponseEntity;
  GetUsersFinishedTracksSuccess(this.getUsersFinishedTracksResponseEntity);
}

final class GetUsersFinishedTracksError extends CommunityState {
  final String message;

  GetUsersFinishedTracksError(this.message);
}

final class GetTracksLoading extends CommunityState {}

final class GetTracksSuccess extends CommunityState {
  final GetTracksResponseEntity getTracksResponseEntity;
  GetTracksSuccess(this.getTracksResponseEntity);
}

final class GetTracksError extends CommunityState {
  final String message;

  GetTracksError(this.message);
}

final class GetLanguagesLoading extends CommunityState {}

final class GetLanguagesSuccess extends CommunityState {
  final GetLanguagesResponseEntity getLanguagesResponseEntity;
  GetLanguagesSuccess(this.getLanguagesResponseEntity);
}

final class GetLanguagesError extends CommunityState {
  final String message;

  GetLanguagesError(this.message);
}

final class StartInterviewLoading extends CommunityState {}

final class StartInterviewSuccess extends CommunityState {
  final StartInterviewResponseEntity startInterviewResponseEntity;
  StartInterviewSuccess(this.startInterviewResponseEntity);
}

final class StartInterviewError extends CommunityState {
  final String message;

  StartInterviewError(this.message);
}

final class InterviewChatLoading extends CommunityState {}

final class InterviewChatSuccess extends CommunityState {
  final InterviewChatResponseEntity interviewChatResponseEntity;
  InterviewChatSuccess(this.interviewChatResponseEntity);
}

final class InterviewChatError extends CommunityState {
  final String message;

  InterviewChatError(this.message);
}

final class GetInterviewSessionStatusLoading extends CommunityState {}

final class GetInterviewSessionStatusSuccess extends CommunityState {
  final GetInterviewSessionStatusResponseEntity
      getInterviewSessionStatusResponseEntity;
  GetInterviewSessionStatusSuccess(
      this.getInterviewSessionStatusResponseEntity);
}

final class GetInterviewSessionStatusError extends CommunityState {
  final String message;

  GetInterviewSessionStatusError(this.message);
}

final class EndInterviewLoading extends CommunityState {}

final class EndInterviewSuccess extends CommunityState {
  final EndInterviewResponseEntity endInterviewResponseEntity;
  EndInterviewSuccess(this.endInterviewResponseEntity);
}

final class EndInterviewError extends CommunityState {
  final String message;
  EndInterviewError(this.message);
}

final class TextToAudioLoading extends CommunityState {}

final class TextToAudioSuccess extends CommunityState {
  final TextToAudioResponseEntity textToAudioResponseEntity;
  TextToAudioSuccess(this.textToAudioResponseEntity);
}

final class TextToAudioError extends CommunityState {
  final String message;

  TextToAudioError(this.message);
}

final class ProcessAudioLoading extends CommunityState {}

final class ProcessAudioSuccess extends CommunityState {
  final ProcessAudioResponseEntity processAudioResponseEntity;
  ProcessAudioSuccess(this.processAudioResponseEntity);
}

final class ProcessAudioError extends CommunityState {
  final String message;

  ProcessAudioError(this.message);
}
