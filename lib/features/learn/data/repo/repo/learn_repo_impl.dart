import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/answer_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/answer_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluation_result_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/set_team_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/start_session_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/data_source/learn_data_source.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class LearnRepoImpl implements LearnRepo {
  final LearnDataSource learnDataSource;
  LearnRepoImpl(this.learnDataSource);
  @override
  Future<ApiResult<void>> setTeam(List<SetTeamRequestEntity> teamMembers) {
    return learnDataSource.setTeam(teamMembers);
  }

  @override
  Future<ApiResult<GenerateAndAssignResponseEntity>> generateAndAssign(
      GenerateAndAssignRequestEntity generateAndAssignRequestEntity) {
    return learnDataSource.generateAndAssign(generateAndAssignRequestEntity);
  }

  @override
  Future<ApiResult<StartSessionResponseEntity>> startSession() {
    return learnDataSource.startSession();
  }

  @override
  Future<ApiResult<AnswerResponseEntity>> answer(
      AnswerRequestEntity answerRequestEntity) {
    return learnDataSource.answer(answerRequestEntity);
  }

  @override
  Future<ApiResult<GenerateRoadmapResponseEntity>> generateRoadmap(
      GenerateRoadmapRequestEntity generateRoadmapRequestEntity) {
    return learnDataSource.generateRoadmap(generateRoadmapRequestEntity);
  }

  @override
  Future<ApiResult<ExtractKeyPointsResponseEntity>> extractKeyPoints(
      ExtractKeyPointsRequestEntity extractKeyPointsRequestEntity) {
    return learnDataSource.extractKeyPoints(extractKeyPointsRequestEntity);
  }

  @override
  Future<ApiResult<GenerateQuizResponseEntity>> generateQuiz(
      GenerateQuizRequestEntity generateQuizRequestEntity) {
    return learnDataSource.generateQuiz(generateQuizRequestEntity);
  }

  @override
  Future<ApiResult<EvaluateProjectResponseEntity>> evaluateProject(EvaluateProjectRequestEntity evaluateProjectRequestEntity) {
    return learnDataSource.evaluateProject(evaluateProjectRequestEntity);
  }

  @override
  Future<ApiResult<RecommendedProjectsResponseEntity>> recommendedProjects(RecommendedProjectsRequestEntity recommendedProjectsRequestEntity) {
    return learnDataSource.recommendedProjects(recommendedProjectsRequestEntity);
  }

  @override
  Future<ApiResult<EvaluationResultResponseEntity>> getEvaluationResult(String studentId) {
    return learnDataSource.getEvaluationResult(studentId);
  }

  @override
  Future<ApiResult<AddFinishedSkillResponseEntity>> addFinishedSkill(AddFinishedSkillRequestEntity addFinishedSkillRequestEntity) {
    return learnDataSource.addFinishedSkill(addFinishedSkillRequestEntity);
  }

  @override
  Future<ApiResult<AddFinishedTrackResponseEntity>> addFinishedTrack(AddFinishedTrackRequestEntity addFinishedTrackRequestEntity) {
    return learnDataSource.addFinishedTrack(addFinishedTrackRequestEntity);
  }
}
