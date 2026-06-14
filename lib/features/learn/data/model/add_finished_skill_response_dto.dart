import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_response_entity.dart';

class AddFinishedSkillResponseDto {
  bool? success;
  String? message;
  List<String>? skills;
  AddFinishedSkillUser? user;

  AddFinishedSkillResponseDto(
      {this.success, this.message, this.skills, this.user});

  AddFinishedSkillResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    skills = json['skills'].cast<String>();
    user = json['user'] != null
        ? AddFinishedSkillUser.fromJson(json['user'])
        : null;
  }

  AddFinishedSkillResponseEntity toEntity() {
    return AddFinishedSkillResponseEntity(
      success: success ?? false,
      message: message ?? '',
      skills: skills ?? [],
      user: AddFinishedSkillUserEntity(
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
    );
  }
}

class AddFinishedSkillUser {
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

  AddFinishedSkillUser(
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

  AddFinishedSkillUser.fromJson(Map<String, dynamic> json) {
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

  AddFinishedSkillUserEntity toEntity() {
    return AddFinishedSkillUserEntity(
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
