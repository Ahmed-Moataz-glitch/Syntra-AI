import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_response_entity.dart';

class ResetPasswordResponseDto {
  bool? success;
  String? token;
  User? user;

  ResetPasswordResponseDto({this.success, this.token, this.user});

  ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(
      success: success ?? false,
      token: token ?? '',
      user: user?.toEntity() ?? UserResetPasswordEntity(
        id: '',
        name: '',
        email: '',
        avatar: '',
        role: '',
        githubId: '',
        isActive: false,
        emailVerified: false,
      ),
    );
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? role;
  String? githubId;
  bool? isActive;
  bool? emailVerified;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.role,
      this.githubId,
      this.isActive,
      this.emailVerified,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
    githubId = json['githubId'];
    isActive = json['isActive'];
    emailVerified = json['emailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  UserResetPasswordEntity toEntity() {
    return UserResetPasswordEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      role: role ?? '',
      githubId: githubId ?? '',
      isActive: isActive ?? false,
      emailVerified: emailVerified ?? false,
    );
  }
}
