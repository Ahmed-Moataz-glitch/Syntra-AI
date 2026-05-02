class LoginResponseEntity {
  bool success;
  String token;
  UserLoginEntity user;

  LoginResponseEntity({
    this.success = false,
    this.token = '',
    this.user =  const UserLoginEntity(
      id: '',
      name: '',
      email: '',
      avatar: '',
      role: '',
      githubId: '',
      isActive: false,
      emailVerified: false,
      createdAt: '',
      updatedAt: '',
    ),
  });
}

class UserLoginEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;
  final String githubId;
  final bool isActive;
  final bool emailVerified;
  final String createdAt;
  final String updatedAt;

  const UserLoginEntity({
    this.id = '',
    this.name = '',
    this.email = '',
    this.avatar = '',
    this.role = '',
    this.githubId = '',
    this.isActive = false,
    this.emailVerified = false,
    this.createdAt = '',
    this.updatedAt = '',
  });
}
