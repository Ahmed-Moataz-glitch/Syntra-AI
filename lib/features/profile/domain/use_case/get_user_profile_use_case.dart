import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';
import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class GetUserProfileUseCase {
  final ProfileRepo profileRepo;
  GetUserProfileUseCase(this.profileRepo);

  UserProfileModel? call(String userId){
    return profileRepo.getUserProfile(userId);
  }
}