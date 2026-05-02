import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class SendOtpForNewUserUseCase {
  final AuthRepo _authRepo;
  SendOtpForNewUserUseCase(this._authRepo);

  Future<void> call(String email) {
    return _authRepo.sendOtpForNewUser(email);
  }
}