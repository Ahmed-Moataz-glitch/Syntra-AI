import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo _authRepo;

  ForgetPasswordUseCase(this._authRepo);

  Future<ApiResult<ForgetPasswordResponseEntity>> call(
    ForgetPasswordRequestEntity forgetPasswordRequestEntity,
  ) {
    return _authRepo.forgetPassword(forgetPasswordRequestEntity);
  }
}