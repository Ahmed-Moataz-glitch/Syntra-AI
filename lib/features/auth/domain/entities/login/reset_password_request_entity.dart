class ResetPasswordRequestEntity {
  String email;
  String otp;
  String password;
  String passwordConfirm;

  ResetPasswordRequestEntity(
      {this.email = '', this.otp = '', this.password = '', this.passwordConfirm = ''});
}
