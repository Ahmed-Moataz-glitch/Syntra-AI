class ResetPasswordResponseEntity {
  bool success;
  String token;
  ResetPasswordUserEntity user;
  String message;

  ResetPasswordResponseEntity(
      {this.success = false, this.token = '', this.user = const ResetPasswordUserEntity(), this.message = ''});
}

class ResetPasswordUserEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;

  const ResetPasswordUserEntity({this.id = '', this.name = '', this.email = '', this.avatar = '', this.role = ''});
}
