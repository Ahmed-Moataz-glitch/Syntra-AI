import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);

  Future<ApiResult<RegisterResponseEntity>> call(RegisterRequestEntity registerRequestEntity) {
    return _authRepo.register(registerRequestEntity);
  }
}