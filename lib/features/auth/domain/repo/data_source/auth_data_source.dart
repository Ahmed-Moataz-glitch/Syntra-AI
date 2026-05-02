import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

abstract class AuthDataSource {
  Future<void> saveUserProfile(UserProfileModel userProfileModel);

  Future<ApiResult<LoginResponseEntity>> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  );

  Future<ApiResult<RegisterResponseEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  );

  Future<bool> loginWithGoogle();

  Future<bool> loginWithGitHub();

  Future<void> sendOtpForNewUser(String email);

  Future<void> sendOtpForExistingUser(String email);

  Future<bool> validateOtp({required String email, required String otp});

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity resetPasswordRequestEntity,
  );
}
