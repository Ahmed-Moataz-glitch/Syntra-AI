part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetUserProfileSuccess extends ProfileState {
  final UserProfileModel? userProfileModel;

  GetUserProfileSuccess(this.userProfileModel);
}

final class PickUserProfileImageSuccess extends ProfileState {
  final String pickedImage;

  PickUserProfileImageSuccess(this.pickedImage);
}

final class PickUserProfileImageError extends ProfileState {
  final String message;

  PickUserProfileImageError(this.message);
}

final class UploadUserProfileImageLoading extends ProfileState {}

final class UploadUserProfileImageSuccess extends ProfileState {
  final UploadUserProfileImageResponseEntity uploadUserProfileImageResponseEntity;

  UploadUserProfileImageSuccess(this.uploadUserProfileImageResponseEntity);
}

final class UploadUserProfileImageError extends ProfileState {
  final String message;

  UploadUserProfileImageError(this.message);
}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserDataResponseEntity userDataResponseEntity;

  ProfileLoaded(this.userDataResponseEntity);
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

final class LogoutLoading extends ProfileState {}

final class LogoutSuccess extends ProfileState {
  final String message;

  LogoutSuccess(this.message);
}

final class LogoutError extends ProfileState {
  final String message;

  LogoutError(this.message);
}

