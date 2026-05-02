import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';

class ResetPasswordRequestDto {
  String? token;
  String? password;
  String? passwordConfirm;

  ResetPasswordRequestDto({this.token, this.password, this.passwordConfirm});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['password'] = password;
    data['passwordConfirm'] = passwordConfirm;
    return data;
  }

  ResetPasswordRequestEntity toEntity() {
    return ResetPasswordRequestEntity(
      token: token ?? '',
      password: password ?? '',
      passwordConfirm: passwordConfirm ?? '',
    );
  }
}
