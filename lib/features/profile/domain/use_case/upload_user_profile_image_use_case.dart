import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_request_entity.dart';
import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class UploadUserProfileImageUseCase {
  final ProfileRepo _profileRepo;
  UploadUserProfileImageUseCase(this._profileRepo);

  Future<ApiResult<UploadUserProfileImageResponseEntity>> call(UploadUserProfileImageRequestEntity uploadUserProfileImageRequestEntity) {
    return _profileRepo.uploadUserProfileImage(uploadUserProfileImageRequestEntity);
  }
}