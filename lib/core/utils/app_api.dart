abstract class AppApi {
  static const String appName = "Syntra.Ai";
  static const String host = 'syntraai-production.up.railway.app';
  static const String baseUrl = '/api/v1';
  static const String loginEndpoint = '/auth/login';
  static const String googleEndpoint = '/auth/google';
  static const String gitHubEndpoint = '/auth/github';
  static const String registerEndpoint = '/auth/signup';
  static const String userDataEndpoint = '/auth/me';
  static const String logoutEndpoint = '/auth/logout';
  static const String forgetPasswordEndpoint = '/auth/forgot-password';
  static const String resetPasswordEndpoint = '/auth/reset-password';
  static const String uploadUserProfileImageEndpoint =
      '/user/upload-profile-photo';
  static const String temporaryToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU2MjExNjFhLTI0ZTktNDYzMy04MGFmLThjMjdmNTE4YzEzNiIsImlhdCI6MTc3NjY0MzE5NywiZXhwIjoxNzc3MjQ3OTk3fQ.qZj7o4qLHWMFIk0jqQyZsf9BuZoKJ_Oh1CV_bS5tICA';
  static const String userProfileBox = 'user-profile-box';
}
