import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';

class GetUsersFinishedTracksResponseDto {
  bool? success;
  int? count;
  List<UsersFinishedTracks>? users;

  GetUsersFinishedTracksResponseDto({this.success, this.count, this.users});

  GetUsersFinishedTracksResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['users'] != null) {
      users = <UsersFinishedTracks>[];
      json['users'].forEach((v) {
        users!.add(UsersFinishedTracks.fromJson(v));
      });
    }
  }

  GetUsersFinishedTracksResponseEntity toEntity() {
    return GetUsersFinishedTracksResponseEntity(
      success: success ?? false,
      count: count ?? 0,
      users: users
              ?.map((e) => UsersFinishedTracksEntity(
                    id: e.id ?? '',
                    name: e.name ?? '',
                    email: e.email ?? '',
                    avatar: e.avatar ?? '',
                    role: e.role ?? '',
                    githubId: e.githubId ?? '',
                    isActive: e.isActive ?? false,
                    emailVerified: e.emailVerified ?? false,
                    skills: e.skills ?? [],
                    finishedTracks: e.finishedTracks ?? [],
                    trackFinished: e.trackFinished ?? false,
                    createdAt: e.createdAt ?? '',
                    updatedAt: e.updatedAt ?? '',
                  ))
              .toList() ??
          [],
    );
  }
}

class UsersFinishedTracks {
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

  UsersFinishedTracks(
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

  UsersFinishedTracks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
    githubId = json['githubId'];
    isActive = json['isActive'];
    emailVerified = json['emailVerified'];
    skills = (json['skills'] as List?)?.map((e) => e.toString()).toList() ??
        <String>[];
    finishedTracks =
        (json['finishedTracks'] as List?)?.map((e) => e.toString()).toList() ??
            <String>[];
    trackFinished = json['trackFinished'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  UsersFinishedTracksEntity toEntity() {
    return UsersFinishedTracksEntity(
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
