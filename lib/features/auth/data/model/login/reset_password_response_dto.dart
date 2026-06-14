import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';

class ResetPasswordResponseDto {
  bool? success;
  String? token;
  ResetPasswordUser? user;
  String? message;

  ResetPasswordResponseDto(
      {this.success, this.token, this.user, this.message});

  ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? ResetPasswordUser.fromJson(json['user']) : null;
    message = json['message'];
  }

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(
      success: success ?? false,
      token: token ?? '',
      user: ResetPasswordUserEntity(
        id: user?.id ?? '',
        name: user?.name ?? '',
        email: user?.email ?? '',
        avatar: user?.avatar ?? '',
        role: user?.role ?? '',
      ),
      message: message ?? '',
    );
  }
}

class ResetPasswordUser {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? role;

  ResetPasswordUser({this.id, this.name, this.email, this.avatar, this.role});

  ResetPasswordUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
  }

  ResetPasswordUserEntity toEntity() {
    return ResetPasswordUserEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      role: role ?? '',
    );
  }
}
