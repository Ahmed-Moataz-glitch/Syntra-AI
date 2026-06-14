import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/data/api/profile_api.dart';
import 'package:syntra_ai/features/profile/data/model/logout_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/upload_user_profile_image_request_dto.dart';
import 'package:syntra_ai/features/profile/data/model/upload_user_profile_image_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/user_data_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';
import 'package:syntra_ai/features/profile/domain/entities/logout_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_request_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/repo/data_source/profile_data_source.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final ProfileApi _profileApi;
  ProfileDataSourceImpl(this._profileApi);

  @override
  Future<ApiResult<UserDataResponseEntity>> fetchUserData() async {
    final result = await _profileApi.fetchUserData();
    switch (result) {
      case ApiSuccess<UserDataResponseDto>():
        return ApiSuccess<UserDataResponseEntity>(result.data?.toEntity());
      case ApiError<UserDataResponseDto>():
        return ApiError<UserDataResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<LogoutResponseEntity>> logout(String userId) async {
    final result = await _profileApi.logout(userId);
    switch (result) {
      case ApiSuccess<LogoutResponseDto>():
        return ApiSuccess<LogoutResponseEntity>(result.data?.toEntity());
      case ApiError<LogoutResponseDto>():
        return ApiError<LogoutResponseEntity>(result.message);
    }
  }

  @override
  Future<String?> pickUserProfileImage() async {
    return await _profileApi.pickUserProfileImage();
  }

  @override
  Future<ApiResult<UploadUserProfileImageResponseEntity>> uploadUserProfileImage(UploadUserProfileImageRequestEntity uploadUserProfileImageRequestEntity) async {
    final result = await _profileApi.uploadUserProfileImage(
      UploadUserProfileImageRequestDto(image: uploadUserProfileImageRequestEntity.image),
    );
    switch (result) {
      case ApiSuccess<UploadUserProfileImageResponseDto>():
        return ApiSuccess<UploadUserProfileImageResponseEntity>(result.data?.toEntity());
      case ApiError<UploadUserProfileImageResponseDto>():
        return ApiError<UploadUserProfileImageResponseEntity>(result.message);
    }
  }

  @override
  Future<void> deleteUserProfile(String userId) {
    return _profileApi.deleteUserProfile(userId);
  }

  @override
  UserProfileModel? getUserProfile(String userId) {
    return _profileApi.getUserProfile(userId);
  }
}
