import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';

class SendOtpForExistingUserUseCase {
  final AuthRepo _authRepo;
  SendOtpForExistingUserUseCase(this._authRepo);

  Future<void> call(String email) {
    return _authRepo.sendOtpForExistingUser(email);
  }
}