import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class LoginWithEmailAndPasswordUseCase {
  final AuthRepo _authRepo;
  LoginWithEmailAndPasswordUseCase(this._authRepo);

  Future<ApiResult<LoginResponseEntity>> call(LoginRequestEntity loginRequestEntity) {
    return _authRepo.loginWithEmailAndPassword(loginRequestEntity);
  }
}