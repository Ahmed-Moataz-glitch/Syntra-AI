// ignore_for_file: override_on_non_overriding_member
import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl(this._authDataSource);

  @override
  Future<ApiResult<LoginResponseEntity>> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  ) {
    return _authDataSource.loginWithEmailAndPassword(loginRequestEntity);
  }

  @override
  Future<ApiResult<RegisterResponseEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return _authDataSource.register(registerRequestEntity);
  }

  @override
  Future<bool> loginWithGoogle() {
    return _authDataSource.loginWithGoogle();
  }

  @override
  Future<bool> loginWithGitHub() {
    return _authDataSource.loginWithGitHub();
  }
  
  @override
  Future<void> sendOtpForNewUser(String email){
    return _authDataSource.sendOtpForNewUser(email);
  }

  @override
  Future<void> sendOtpForExistingUser(String email){
    return _authDataSource.sendOtpForExistingUser(email);
  }

  @override
  Future<bool> validateOtp({required String email, required String otp}){
    return _authDataSource.validateOtp(email: email, otp: otp);
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity resetPasswordRequestEntity) {
    return _authDataSource.resetPassword(resetPasswordRequestEntity);
  }

  @override
  Future<void> saveUserProfile(UserProfileModel userProfileModel) {
    return _authDataSource.saveUserProfile(userProfileModel);
  }

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity forgetPasswordRequestEntity) {
    return _authDataSource.forgetPassword(forgetPasswordRequestEntity);
  }
}
