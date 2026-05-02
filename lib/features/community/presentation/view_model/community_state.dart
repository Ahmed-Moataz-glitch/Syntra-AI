part of 'community_cubit.dart';

sealed class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class CommunityLoading extends CommunityState {}
final class CommunityLoaded extends CommunityState {

  CommunityLoaded();
}

final class CommunityError extends CommunityState {
  final String message;

  CommunityError(this.message);
}

