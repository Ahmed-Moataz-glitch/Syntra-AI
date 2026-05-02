import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class FetchUserDataUseCase {
  final ProfileRepo _profileRepo;
  FetchUserDataUseCase(this._profileRepo);

  Future<ApiResult<UserDataResponseEntity>> call() {
    return _profileRepo.fetchUserData();
  }
}