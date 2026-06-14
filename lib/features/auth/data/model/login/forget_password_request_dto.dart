import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_request_entity.dart';

class ForgetPasswordRequestDto {
  String? email;

  ForgetPasswordRequestDto({this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }

  ForgetPasswordRequestEntity toEntity() {
    return ForgetPasswordRequestEntity(email: email ?? '');
  }
}
