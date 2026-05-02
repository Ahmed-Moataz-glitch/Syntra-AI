import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';
import 'package:syntra_ai/features/profile/domain/entities/logout_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_request_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';

abstract class ProfileRepo {
  UserProfileModel? getUserProfile(String userId);

  Future<void> deleteUserProfile(String userId);

  Future<String?> pickUserProfileImage();

  Future<ApiResult<UploadUserProfileImageResponseEntity>>
  uploadUserProfileImage(
    UploadUserProfileImageRequestEntity uploadUserProfileImageRequestEntity,
  );

  Future<ApiResult<UserDataResponseEntity>> fetchUserData();

  Future<ApiResult<LogoutResponseEntity>> logout();
}
