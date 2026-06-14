import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';

class ResetPasswordRequestDto {
  String? email;
  String? otp;
  String? password;
  String? passwordConfirm;

  ResetPasswordRequestDto(
      {this.email, this.otp, this.password, this.passwordConfirm});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    data['password'] = password;
    data['passwordConfirm'] = passwordConfirm;
    return data;
  }

  ResetPasswordRequestEntity toEntity() {
    return ResetPasswordRequestEntity(
      email: email ?? '',
      otp: otp ?? '',
      password: password ?? '',
      passwordConfirm: passwordConfirm ?? '',
    );
  }
}
