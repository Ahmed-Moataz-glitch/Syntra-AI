class AddFinishedSkillResponseEntity {
  bool success;
  String message;
  List<String> skills;
  AddFinishedSkillUserEntity user;

  AddFinishedSkillResponseEntity(
      {this.success = false, this.message = '', this.skills = const [], this.user = const AddFinishedSkillUserEntity()});
}

class AddFinishedSkillUserEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;
  final String githubId;
  final bool isActive;
  final bool emailVerified;
  final List<String> skills;
  final List<String> finishedTracks;
  final bool trackFinished;
  final String createdAt;
  final String updatedAt;

  const AddFinishedSkillUserEntity(
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
