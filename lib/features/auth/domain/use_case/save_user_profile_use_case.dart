import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

class SaveUserProfileUseCase {
  final AuthRepo authRepo;
  SaveUserProfileUseCase(this.authRepo);

  Future<void> call(UserProfileModel userProfileModel) {
    return authRepo.saveUserProfile(userProfileModel);
  }
}