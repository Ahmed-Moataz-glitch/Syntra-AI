class ResetPasswordResponseEntity {
  bool success;
  String token;
  UserResetPasswordEntity user;

  ResetPasswordResponseEntity({
    this.success = false,
    this.token = '',
    this.user = const UserResetPasswordEntity(
      id: '',
      name: '',
      email: '',
      avatar: '',
      role: '',
      githubId: '',
      isActive: false,
      emailVerified: false,
    ),
  });
}

class UserResetPasswordEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;
  final String githubId;
  final bool isActive;
  final bool emailVerified;

  const UserResetPasswordEntity({
    this.id = '',
    this.name = '',
    this.email = '',
    this.avatar = '',
    this.role = '',
    this.githubId = '',
    this.isActive = false,
    this.emailVerified = false,
  });
}
