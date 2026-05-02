import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/domain/entities/logout_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';

class LogoutUseCase {
  final ProfileRepo _profileRepo;
  LogoutUseCase(this._profileRepo);

  Future<ApiResult<LogoutResponseEntity>> call() {
    return _profileRepo.logout();
  }
}
