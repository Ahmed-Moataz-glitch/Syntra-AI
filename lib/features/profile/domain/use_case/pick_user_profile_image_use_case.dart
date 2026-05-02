import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class PickUserProfileImageUseCase {
  final ProfileRepo _profileRepo;
  PickUserProfileImageUseCase(this._profileRepo);

  Future<String?> call() {
    return _profileRepo.pickUserProfileImage();
  }
}