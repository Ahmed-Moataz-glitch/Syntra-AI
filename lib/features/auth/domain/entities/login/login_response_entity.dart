class LoginResponseEntity {
  bool success;
  String token;
  LoginUserEnity user;

  LoginResponseEntity({this.success = false, this.token = '', this.user = const LoginUserEnity()});
}

class LoginUserEnity {
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

  const LoginUserEnity(
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
