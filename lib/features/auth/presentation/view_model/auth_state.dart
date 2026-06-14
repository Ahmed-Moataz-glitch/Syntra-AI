part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class SaveUserProfileSuccess extends AuthState {}

final class SaveUserProfileError extends AuthState {
  final String message;

  SaveUserProfileError(this.message);
}

final class SendingOtp extends AuthState {}

final class OtpSent extends AuthState {
  final String message;

  OtpSent(this.message);
}

final class SendingOtpError extends AuthState {
  final String message;

  SendingOtpError(this.message);
}

final class ReSendingOtp extends AuthState {}

final class OtpReSent extends AuthState {
  final String message;

  OtpReSent(this.message);
}

final class ReSendingOtpError extends AuthState {
  final String message;

  ReSendingOtpError(this.message);
}

final class VerifyingOtp extends AuthState {}

final class OtpVerified extends AuthState {}

final class VerifyingOtpError extends AuthState {
  final String message;

  VerifyingOtpError(this.message);
}

final class LoginWithOtherMethodSuccess extends AuthState {
  final String message;

  LoginWithOtherMethodSuccess(this.message);
}

final class LoginWithOtherMethodError extends AuthState {
  final String message;

  LoginWithOtherMethodError(this.message);
}

final class RegisterSuccess extends AuthState {
  final String message;

  RegisterSuccess(this.message);
}

final class RegisterError extends AuthState {
  final String message;

  RegisterError(this.message);
}

final class LoginSuccess extends AuthState {
  final String message;

  LoginSuccess(this.message);
}

final class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

final class ForgetPasswordSuccess extends AuthState {
  final String message;

  ForgetPasswordSuccess(this.message);
}

final class ForgetPasswordError extends AuthState {
  final String message;

  ForgetPasswordError(this.message);
}

final class ResetPasswordSuccess extends AuthState {
  final String message;

  ResetPasswordSuccess(this.message);
}

final class ResetPasswordError extends AuthState {
  final String message;

  ResetPasswordError(this.message);
}
