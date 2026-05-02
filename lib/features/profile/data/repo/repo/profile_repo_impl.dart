import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';
import 'package:syntra_ai/features/profile/domain/entities/logout_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_request_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource _profileDataSource;
  ProfileRepoImpl(this._profileDataSource);
  
  @override
  Future<ApiResult<UserDataResponseEntity>> fetchUserData() {
    return _profileDataSource.fetchUserData();
  }

  @override
  Future<ApiResult<LogoutResponseEntity>> logout() {
    return _profileDataSource.logout();
  }

  @override
  Future<String?> pickUserProfileImage() {
    return _profileDataSource.pickUserProfileImage();
  }

  @override
  Future<ApiResult<UploadUserProfileImageResponseEntity>> uploadUserProfileImage(UploadUserProfileImageRequestEntity uploadUserProfileImageRequestEntity) {
    return _profileDataSource.uploadUserProfileImage(uploadUserProfileImageRequestEntity);
  }

  @override
  Future<void> deleteUserProfile(String userId) {
    return _profileDataSource.deleteUserProfile(userId);
  }

  @override
  UserProfileModel? getUserProfile(String userId) {
    return _profileDataSource.getUserProfile(userId);
  }
}