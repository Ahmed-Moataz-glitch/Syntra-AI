class ResetPasswordRequestEntity {
  String token;
  String password;
  String passwordConfirm;

  ResetPasswordRequestEntity({this.token = '', this.password = '', this.passwordConfirm = ''});
}
