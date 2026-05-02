import 'package:intl/intl.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_response_entity.dart';

class LoginResponseDto {
  bool? success;
  String? token;
  User? user;

  LoginResponseDto({this.success, this.token, this.user});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String formatIsoDate(String date) {
    final localDate = DateTime.parse(date).toLocal(); // remove toLocal() if you want UTC
    return DateFormat('dd MMM yyyy, HH:mm').format(localDate).toString();
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      success: success ?? false,
      token: token ?? '',
      user: user?.toEntity() ?? UserLoginEntity(
        id: '',
        name: '',
        email: '',
        avatar: '',
        role: '',
        githubId: '',
        isActive: false,
        emailVerified: false,
        createdAt: user?.createdAt ?? '',
        // createdAt: formatIsoDate(user?.createdAt ?? ''),
        updatedAt: user?.updatedAt ?? '',
        // updatedAt: formatIsoDate(user?.updatedAt ?? ''),
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

  String formatIsoDate(String date) {
    final localDate = DateTime.parse(date).toLocal(); // remove toLocal() if you want UTC
    return DateFormat('dd MMM yyyy, HH:mm').format(localDate).toString();
  }

  UserLoginEntity toEntity() {
    return UserLoginEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      role: role ?? '',
      githubId: githubId ?? '',
      isActive: isActive ?? false,
      emailVerified: emailVerified ?? false,
      createdAt: createdAt ?? '',
      // createdAt: formatIsoDate(createdAt ?? ''),
      updatedAt: updatedAt ?? '',
      // updatedAt: formatIsoDate(updatedAt ?? ''),
    );
  }
}
