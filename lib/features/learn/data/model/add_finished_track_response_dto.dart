import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_response_entity.dart';

class AddFinishedTrackResponseDto {
  bool? success;
  String? message;
  AddFinishedTrackUser? user;

  AddFinishedTrackResponseDto({this.success, this.message, this.user});

  AddFinishedTrackResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null
        ? AddFinishedTrackUser.fromJson(json['user'])
        : null;
  }

  AddFinishedTrackResponseEntity toEntity() {
    return AddFinishedTrackResponseEntity(
      success: success ?? false,
      message: message ?? '',
      user: AddFinishedTrackUserEntity(
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

class AddFinishedTrackUser {
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

  AddFinishedTrackUser(
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

  AddFinishedTrackUser.fromJson(Map<String, dynamic> json) {
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

  AddFinishedTrackUserEntity toEntity() {
    return AddFinishedTrackUserEntity(
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
