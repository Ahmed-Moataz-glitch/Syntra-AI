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
