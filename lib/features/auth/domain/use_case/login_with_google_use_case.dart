import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class LoginWithGoogleUseCase {
  final AuthRepo _authRepo;
  LoginWithGoogleUseCase(this._authRepo);

  Future<bool> call() {
    return _authRepo.loginWithGoogle();
  }
}