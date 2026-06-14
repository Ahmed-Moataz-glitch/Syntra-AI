import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';
import 'package:syntra_ai/features/profile/domain/entities/logout_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_request_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/use_case/delete_user_profile_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/fetch_user_data_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/get_user_profile_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/logout_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/pick_user_profile_image_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/upload_user_profile_image_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  String? pickedUserProfileImage;
  String? userProfileImage;
  UserProfileModel? userProfile;
  final GetUserProfileUseCase getUserProfileUseCase;
  final DeleteUserProfileUseCase deleteUserProfileUseCase; 
  final FetchUserDataUseCase fetchUserDataUseCase;
  final PickUserProfileImageUseCase pickUserProfileImageUseCase;
  final UploadUserProfileImageUseCase uploadUserProfileImageUseCase;
  final LogoutUseCase logoutUseCase;
  ProfileCubit({
    required this.getUserProfileUseCase,
    required this.deleteUserProfileUseCase,
    required this.fetchUserDataUseCase,
    required this.pickUserProfileImageUseCase,
    required this.uploadUserProfileImageUseCase,
    required this.logoutUseCase,
  }) : super(ProfileInitial());

  void getUserProfile(String userId) {
    userProfile = getUserProfileUseCase.call(userId);
    emit(GetUserProfileSuccess(userProfile));
  }

  Future<void> deleteUserProfile(String userId) async {
    await deleteUserProfileUseCase.call(userId);
  }

  Future<void> pickUserProfileImage() async {
    final result = await pickUserProfileImageUseCase.call();
    try {
      pickedUserProfileImage = result;
      emit(PickUserProfileImageSuccess(pickedUserProfileImage!));
    } catch (e) {
      emit(PickUserProfileImageError(e.toString()));
    }
  }

  Future<void> uploadUserProfileImage(String? pickedImage) async {
    emit(UploadUserProfileImageLoading());
    final result = await uploadUserProfileImageUseCase.call(UploadUserProfileImageRequestEntity(image: pickedImage ?? ''));
    switch (result) {
      case ApiSuccess<UploadUserProfileImageResponseEntity>():
        emit(UploadUserProfileImageSuccess(result.data!));
      case ApiError<UploadUserProfileImageResponseEntity>():
        emit(UploadUserProfileImageError(result.message));
    }
  }

  Future<void> fetchUserData() async {
    emit(ProfileLoading());
    final result = await fetchUserDataUseCase.call();
    switch (result) {
      case ApiSuccess<UserDataResponseEntity>():
        userProfileImage = result.data!.user.avatar;
        emit(ProfileLoaded(result.data!));
      case ApiError<UserDataResponseEntity>():
        emit(ProfileError(result.message));
    }
  }

  Future<void> logout(String userId) async {
    emit(LogoutLoading());
    final result = await logoutUseCase.call(userId);
    switch (result) {
      case ApiSuccess<LogoutResponseEntity>():
        emit(LogoutSuccess(result.data!.message));
      case ApiError<LogoutResponseEntity>():
        emit(LogoutError(result.message));
    }
  }
}
