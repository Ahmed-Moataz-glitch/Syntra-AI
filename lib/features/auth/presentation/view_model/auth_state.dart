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

final class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
