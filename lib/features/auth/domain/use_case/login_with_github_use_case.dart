import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class LoginWithGithubUseCase {
  final AuthRepo _authRepo;
  LoginWithGithubUseCase(this._authRepo);

  Future<bool> call() {
    return _authRepo.loginWithGitHub();
  }
}