import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo _authRepo;
  ResetPasswordUseCase(this._authRepo);

  Future<ApiResult<ResetPasswordResponseEntity>> call(ResetPasswordRequestEntity resetPasswordRequestEntity) {
    return _authRepo.resetPassword(resetPasswordRequestEntity);
  }
}