import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';

class RegisterResponseDto {
  bool? success;
  RegisterUser? user;
  String? token;
  String? message;

  RegisterResponseDto({this.success, this.user, this.token, this.message});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? RegisterUser.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }

  RegisterResponseEntity toEntity() {
    return RegisterResponseEntity(
      success: success ?? false,
      user: RegisterUserEntity(
        id: user?.id ?? '',
        name: user?.name ?? '',
        email: user?.email ?? '',
        avatar: user?.avatar ?? '',
        role: user?.role ?? '',
        githubId: user?.githubId ?? '',
        isActive: user?.isActive ?? false,
        emailVerified: user?.emailVerified ?? false,
        skills: user?.skills ?? [],
        finishedTracks: user?.finishedTracks ?? [],
        trackFinished: user?.trackFinished ?? false,
        createdAt: user?.createdAt ?? '',
        updatedAt: user?.updatedAt ?? '',
      ),
      token: token ?? '',
      message: message ?? '',
    );
  }
}

class RegisterUser {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? role;
  String? githubId;
  bool? isActive;
  bool? emailVerified;
  List<String>? skills;
  List<String>? finishedTracks;
  bool? trackFinished;
  String? createdAt;
  String? updatedAt;

  RegisterUser(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.role,
      this.githubId,
      this.isActive,
      this.emailVerified,
      this.skills,
      this.finishedTracks,
      this.trackFinished,
      this.createdAt,
      this.updatedAt});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
    githubId = json['githubId'];
    isActive = json['isActive'];
    emailVerified = json['emailVerified'];
    skills = (json['skills'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
      <String>[];
    finishedTracks = (json['finishedTracks'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
      <String>[];
    trackFinished = json['trackFinished'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  RegisterUserEntity toEntity() {
    return RegisterUserEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      role: role ?? '',
      githubId: githubId ?? '',
      isActive: isActive ?? false,
      emailVerified: emailVerified ?? false,
      skills: skills ?? [],
      finishedTracks: finishedTracks ?? [],
      trackFinished: trackFinished ?? false,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }
}
