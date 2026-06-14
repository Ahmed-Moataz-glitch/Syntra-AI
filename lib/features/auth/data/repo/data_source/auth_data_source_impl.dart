import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/data/api/auth_api.dart';
import 'package:syntra_ai/features/auth/data/model/login/forget_password_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/forget_password_response_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/login_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/login_response_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/reset_password_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/reset_password_response_dto.dart';
import 'package:syntra_ai/features/auth/data/model/register/register_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/register/register_response_dto.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final AuthApi _authApi;

  AuthDataSourceImpl(this._authApi);

  @override
  Future<ApiResult<LoginResponseEntity>> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  ) async {
    final result = await _authApi.loginWithEmailAndPassword(
      LoginRequestDto(
        email: loginRequestEntity.email,
        password: loginRequestEntity.password,
      ),
    );
    switch (result) {
      case ApiSuccess<LoginResponseDto>():
        return ApiSuccess<LoginResponseEntity>(result.data?.toEntity());
      case ApiError<LoginResponseDto>():
        return ApiError<LoginResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<RegisterResponseEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) async {
    final result = await _authApi.register(
      RegisterRequestDto(
        email: registerRequestEntity.email,
        password: registerRequestEntity.password,
        name: registerRequestEntity.name,
        role: registerRequestEntity.role,
      ),
    );
    switch (result) {
      case ApiSuccess<RegisterResponseDto>():
        return ApiSuccess<RegisterResponseEntity>(result.data?.toEntity());
      case ApiError<RegisterResponseDto>():
        return ApiError<RegisterResponseEntity>(result.message);
    }
  }

  @override
  Future<bool> loginWithGoogle() {
    return _authApi.loginWithGoogle();
  }

  @override
  Future<bool> loginWithGitHub() {
    return _authApi.loginWithGitHub();
  }

  @override
  Future<void> sendOtpForNewUser(String email) {
    return _authApi.sendOtpForNewUser(email);
  }

  @override
  Future<void> sendOtpForExistingUser(String email) {
    return _authApi.sendOtpForExistingUser(email);
  }

  @override
  Future<bool> validateOtp({required String email, required String otp}) {
    return _authApi.validateOtp(email: email, otp: otp);
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity resetPasswordRequestEntity,
  ) async {
    final result = await  _authApi.resetPassword(
      ResetPasswordRequestDto(
        email: resetPasswordRequestEntity.email,
        otp: resetPasswordRequestEntity.otp,
        password: resetPasswordRequestEntity.password,
        passwordConfirm: resetPasswordRequestEntity.passwordConfirm,
      ),
    );
    switch (result) {
      case ApiSuccess<ResetPasswordResponseDto>():
        return ApiSuccess<ResetPasswordResponseEntity>(result.data?.toEntity());
      case ApiError<ResetPasswordResponseDto>():
        return ApiError<ResetPasswordResponseEntity>(result.message);
    }
  }

  @override
  Future<void> saveUserProfile(UserProfileModel userProfileModel) {
    return _authApi.saveUserProfile(userProfileModel);
  }

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity forgetPasswordRequestEntity) async {
    final result = await _authApi.forgetPassword(
      ForgetPasswordRequestDto(
        email: forgetPasswordRequestEntity.email,
      ),
    );
    switch (result) {
      case ApiSuccess<ForgetPasswordResponseDto>():
        return ApiSuccess<ForgetPasswordResponseEntity>(result.data?.toEntity());
      case ApiError<ForgetPasswordResponseDto>():
        return ApiError<ForgetPasswordResponseEntity>(result.message);
    }
  }
}
