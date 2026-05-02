import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';

class RegisterRequestDto {
  String? name;
  String? email;
  String? password;
  String? role;

  RegisterRequestDto({this.name, this.email, this.password, this.role});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    return data;
  }

  RegisterRequestEntity toEntity() {
    return RegisterRequestEntity(
      name: name ?? '',
      email: email ?? '',
      password: password ?? '',
      role: role ?? '',
    );
  }
}
