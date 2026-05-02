import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_github_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/register_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/save_user_profile_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/send_otp_for_existing_user_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/send_otp_for_new_user_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/validate_otp_use_case.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SaveUserProfileUseCase saveUserProfileUseCase;
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  final RegisterUseCase registerUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithGithubUseCase loginWithGithubUseCase;
  final SendOtpForNewUserUseCase sendOtpForNewUserUseCase;
  final SendOtpForExistingUserUseCase sendOtpForExistingUserUseCase;
  final ValidateOtpUseCase validateOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  AuthCubit({
    required this.saveUserProfileUseCase,
    required this.loginWithEmailAndPasswordUseCase,
    required this.registerUseCase,
    required this.loginWithGoogleUseCase,
    required this.loginWithGithubUseCase,
    required this.sendOtpForNewUserUseCase,
    required this.sendOtpForExistingUserUseCase,
    required this.validateOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> saveUserProfile(UserProfileModel userProfileModel) async {
    try {
      await saveUserProfileUseCase.call(userProfileModel);
      emit(SaveUserProfileSuccess());
    } catch (e) {
      emit(SaveUserProfileError(e.toString()));
    }
  }

  Future<void> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  ) async {
    emit(AuthLoading());
    try {
      final result = await loginWithEmailAndPasswordUseCase.call(
        loginRequestEntity,
      );
      switch (result) {
        case ApiSuccess<LoginResponseEntity>():
          final user = result.data!.user;
          await saveUserProfile(
            UserProfileModel(
              id: user.id,
              name: user.name,
              email: user.email,
              role: user.role,
              githubId: user.githubId,
              emailVerified: user.emailVerified,
              isActive: user.isActive,
              createdAt: user.createdAt,
              updatedAt: user.updatedAt,
            ),
          );
          emit(AuthSuccess('Login successful'));
        case ApiError<LoginResponseEntity>():
          emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterRequestEntity registerRequestEntity) async {
    try {
      final result = await registerUseCase.call(registerRequestEntity);
      switch (result) {
        case ApiSuccess<RegisterResponseEntity>():
          emit(AuthSuccess('Registration successful'));
        case ApiError<RegisterResponseEntity>():
          emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    final result = await loginWithGoogleUseCase.call();
    switch (result) {
      case true:
        emit(LoginWithOtherMethodSuccess('Login Successful'));
      case false:
        emit(LoginWithOtherMethodError("Login Failed"));
    }
  }

  Future<void> loginWithGitHub() async {
    final result = await loginWithGithubUseCase.call();
    switch (result) {
      case true:
        emit(LoginWithOtherMethodSuccess('Login Successful'));
      case false:
        emit(LoginWithOtherMethodError("Login Failed"));
    }
  }

  Future<void> sendOtpForNewUser(String email) async {
    emit(SendingOtp());
    try {
      await sendOtpForNewUserUseCase.call(email);
      emit(OtpSent('OTP sent successfully'));
    } catch (e) {
      emit(SendingOtpError(e.toString()));
    }
  }

  Future<void> resendOtpForNewUser(String email) async {
    emit(ReSendingOtp());
    try {
      await sendOtpForNewUserUseCase.call(email);
      emit(OtpReSent('OTP resent successfully'));
    } catch (e) {
      emit(ReSendingOtpError(e.toString()));
    }
  }

  Future<void> sendOtpForExistingUser(String email) async {
    emit(SendingOtp());
    try {
      await sendOtpForExistingUserUseCase.call(email);
      emit(OtpSent('OTP sent successfully'));
    } catch (e) {
      emit(SendingOtpError(e.toString()));
    }
  }

  Future<void> validateOtp({required String email, required String otp}) async {
    try {
      final result = await validateOtpUseCase.call(email: email, otp: otp);
      switch (result) {
        case true:
          emit(OtpVerified());
        case false:
          emit(VerifyingOtpError('Invalid OTP'));
      }
    } catch (e) {
      emit(VerifyingOtpError(e.toString()));
    }
  }

  Future<void> resetPassword(
    ResetPasswordRequestEntity resetPasswordRequestEntity,
  ) async {
    try {
      final result = await resetPasswordUseCase.call(
        resetPasswordRequestEntity,
      );
      switch (result) {
        case ApiSuccess<ResetPasswordResponseEntity>():
          emit(AuthSuccess('Reset password successful'));
        case ApiError<ResetPasswordResponseEntity>():
          emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
