abstract class AppApi {
  static const String appName = "Syntra.Ai";
  static const String authHost =
      'appealing-curiosity-production.up.railway.app';
  static const String questionsHost =
      'recommendationsystem-production-9a13.up.railway.app';
  static const String roadmapHost =
      'roadmapgeneration-production.up.railway.app';
  static const String teamHost = 'taskdistribution-production.up.railway.app';
  static const String quizHost =
      'syntra-ai-quiz-service-production.up.railway.app';
  static const String learningProjectHost =
      'syntraai-production-08b1.up.railway.app';
  static const String recommendedProjectsHost =
      'syntra-ai-projectrecommend-production.up.railway.app';
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
  static const String addFinishedSkillEndpoint = '/user/skills';
  static const String addFinishedTrackEndpoint = '/user/finish-track';
  static const String getusersFinishedTracksEndpoint = '/user/finished-tracks';
  static const String temporaryToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU2MjExNjFhLTI0ZTktNDYzMy04MGFmLThjMjdmNTE4YzEzNiIsImlhdCI6MTc3NjY0MzE5NywiZXhwIjoxNzc3MjQ3OTk3fQ.qZj7o4qLHWMFIk0jqQyZsf9BuZoKJ_Oh1CV_bS5tICA';
  static const String userProfileBox = 'user-profile-box';
  static const String userRoadmapBox = 'user-roadmap-box';
  static const String startSessionEndpoint = '/start';
  static const String answerEndpoint = '/answer';
  static const String generateRoadmapEndpoint = '/generate-roadmap';
  static const String extractKeyPointsEndpoint = '/quiz/extract-key-points';
  static const String generateQuizEndpoint = '/quiz/generate';
  static const String recommendProjectsEndpoint = '/api/projects/generate';
  static const String evaluateProjectEndpoint = '/evaluate';
  static const String calculateWeightsEndpoint = '/calculate-weights';
  static const String evaluationResultEndpoint = '/results/';
  static const String setTeamEndpoint = '/set-team';
  static const String generateAndAssignTasksEndpoint = '/generate-and-assign';
}
