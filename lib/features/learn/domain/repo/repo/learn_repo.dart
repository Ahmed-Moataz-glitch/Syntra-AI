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

abstract class LearnRepo {
  Future<ApiResult<StartSessionResponseEntity>> startSession();

  Future<ApiResult<AnswerResponseEntity>> answer (AnswerRequestEntity answerRequestEntity);

  Future<ApiResult<GenerateRoadmapResponseEntity>> generateRoadmap(GenerateRoadmapRequestEntity generateRoadmapRequestEntity);
  
  Future<ApiResult<ExtractKeyPointsResponseEntity>> extractKeyPoints(
      ExtractKeyPointsRequestEntity extractKeyPointsRequestEntity);
  
  Future<ApiResult<GenerateQuizResponseEntity>> generateQuiz(GenerateQuizRequestEntity generateQuizRequestEntity);
  
  Future<ApiResult<RecommendedProjectsResponseEntity>> recommendedProjects(
      RecommendedProjectsRequestEntity recommendedProjectsRequestEntity);
  
  Future<ApiResult<EvaluateProjectResponseEntity>> evaluateProject(
      EvaluateProjectRequestEntity evaluateProjectRequestEntity);
  
  Future<ApiResult<EvaluationResultResponseEntity>> getEvaluationResult(
      String studentId);
  
  Future<ApiResult<void>> setTeam(List<SetTeamRequestEntity> teamMembers);

  Future<ApiResult<GenerateAndAssignResponseEntity>> generateAndAssign(GenerateAndAssignRequestEntity generateAndAssignRequestEntity);

  Future<ApiResult<AddFinishedSkillResponseEntity>> addFinishedSkill(
      AddFinishedSkillRequestEntity addFinishedSkillRequestEntity);

  Future<ApiResult<AddFinishedTrackResponseEntity>> addFinishedTrack(
      AddFinishedTrackRequestEntity addFinishedTrackRequestEntity);
}
