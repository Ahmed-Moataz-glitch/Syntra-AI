class GetUsersFinishedTracksResponseEntity {
  bool success;
  int count;
  List<UsersFinishedTracksEntity> users;

  GetUsersFinishedTracksResponseEntity({this.success = false, this.count = 0, this.users = const []});
}

class UsersFinishedTracksEntity {
  String id;
  String name;
  String email;
  String avatar;
  String role;
  String githubId;
  bool isActive;
  bool emailVerified;
  List<String> skills;
  List<String> finishedTracks;
  bool trackFinished;
  String createdAt;
  String updatedAt;

  UsersFinishedTracksEntity(
      {this.id = '',
      this.name = '',
      this.email = '',
      this.avatar = '',
      this.role = '',
      this.githubId = '',
      this.isActive = false,
      this.emailVerified = false,
      this.skills = const [],
      this.finishedTracks = const [],
      this.trackFinished = false,
      this.createdAt = '',
      this.updatedAt = ''});
}
