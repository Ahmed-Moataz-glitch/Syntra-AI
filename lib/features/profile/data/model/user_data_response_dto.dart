import 'package:intl/intl.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';

class UserDataResponseDto {
  bool? success;
  User? user;

  UserDataResponseDto({this.success, this.user});

  UserDataResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String formatIsoDate(String date) {
    final localDate = DateTime.parse(date).toLocal(); // remove toLocal() if you want UTC
    return DateFormat('dd MMM yyyy, HH:mm').format(localDate).toString();
  }

  UserDataResponseEntity toEntity() {
    return UserDataResponseEntity(
      success: success ?? false,
      user: UserDataEntity(
        id: user?.id ?? '',
        name: user?.name ?? '',
        email: user?.email ?? '',
        avatar: user?.avatar ?? '',
        role: user?.role ?? '',
        githubId: user?.githubId ?? '',
        isActive: user?.isActive ?? false,
        emailVerified: user?.emailVerified ?? false,
        createdAt: formatIsoDate(user?.createdAt ?? ''),
        updatedAt: formatIsoDate(user?.updatedAt ?? ''),
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

  User({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.role,
    this.githubId,
    this.isActive,
    this.emailVerified,
    this.createdAt,
    this.updatedAt,
  });

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

  UserDataEntity toEntity() {
    return UserDataEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      role: role ?? '',
      githubId: githubId ?? '',
      isActive: isActive ?? false,
      emailVerified: emailVerified ?? false,
      createdAt: formatIsoDate(createdAt ?? ''),
      updatedAt: formatIsoDate(updatedAt ?? ''),
    );
  }
}
