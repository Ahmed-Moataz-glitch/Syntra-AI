import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class DeleteUserProfileUseCase {
  final ProfileRepo profileRepo;
  DeleteUserProfileUseCase(this.profileRepo);

  Future<void> call(String userId) {
    return profileRepo.deleteUserProfile(userId);
  }
}