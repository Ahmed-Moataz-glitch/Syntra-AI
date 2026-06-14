class RegisterResponseEntity {
  bool success;
  RegisterUserEntity user;
  String token;
  String message;

  RegisterResponseEntity(
      {this.success = false,
      this.user = const RegisterUserEntity(),
      this.token = '',
      this.message = ''});
}

class RegisterUserEntity {
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

  const RegisterUserEntity(
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
