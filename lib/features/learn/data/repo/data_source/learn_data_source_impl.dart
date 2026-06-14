import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/data/api/learn_api.dart';
import 'package:syntra_ai/features/learn/data/model/add_finished_skill_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/add_finished_skill_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/add_finished_track_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/add_finished_track_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/answer_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/answer_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/evaluate_project_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/evaluate_project_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/evaluation_result_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/extract_key_points_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/extract_key_points_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/generate_and_assign_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/generate_and_assign_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/generate_quiz_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/generate_quiz_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/generate_roadmap_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/generate_roadmap_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/recommended_projects_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/recommended_projects_response_dto.dart';
import 'package:syntra_ai/features/learn/data/model/set_team_request_dto.dart';
import 'package:syntra_ai/features/learn/data/model/start_session_response_dto.dart';
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

class LearnDataSourceImpl implements LearnDataSource {
  final LearnApi learnApi;
  LearnDataSourceImpl(this.learnApi);
  @override
  Future<ApiResult<void>> setTeam(List<SetTeamRequestEntity> teamMembers) {
    return learnApi.setTeam(teamMembers
        .map((teamMember) => SetTeamRequestDto(
              id: teamMember.id,
              name: teamMember.name,
              skills: teamMember.skills,
              currentWorkload: teamMember.currentWorkload,
            ))
        .toList());
  }

  @override
  Future<ApiResult<GenerateAndAssignResponseEntity>> generateAndAssign(
      GenerateAndAssignRequestEntity generateAndAssignRequestEntity) async {
    final result = await learnApi.generateAndAssign(
      GenerateAndAssignRequestDto(
        projectDescription: generateAndAssignRequestEntity.projectDescription,
        numOfTasks: generateAndAssignRequestEntity.numOfTasks,
      ),
    );
    switch (result) {
      case ApiSuccess<GenerateAndAssignResponseDto>():
        return ApiSuccess<GenerateAndAssignResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<GenerateAndAssignResponseDto>():
        return ApiError<GenerateAndAssignResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<StartSessionResponseEntity>> startSession() async {
    final result = await learnApi.startSession();
    switch (result) {
      case ApiSuccess<StartSessionResponseDto>():
        return ApiSuccess<StartSessionResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<StartSessionResponseDto>():
        return ApiError<StartSessionResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<AnswerResponseEntity>> answer(
      AnswerRequestEntity answerRequestEntity) async {
    final result = await learnApi.answer(
      AnswerRequestDto(
        sessionId: answerRequestEntity.sessionId,
        selectedAnswer: answerRequestEntity.selectedAnswer,
      ),
    );
    switch (result) {
      case ApiSuccess<AnswerResponseDto>():
        return ApiSuccess<AnswerResponseEntity>((result.data?.toEntity()));
      case ApiError<AnswerResponseDto>():
        return ApiError<AnswerResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<GenerateRoadmapResponseEntity>> generateRoadmap(
      GenerateRoadmapRequestEntity generateRoadmapRequestEntity) async {
    final result = await learnApi.generateRoadmap(
      GenerateRoadmapRequestDto(
        trackName: generateRoadmapRequestEntity.trackName,
        hoursPerWeek: generateRoadmapRequestEntity.hoursPerWeek,
      ),
    );
    switch (result) {
      case ApiSuccess<GenerateRoadmapResponseDto>():
        return ApiSuccess<GenerateRoadmapResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<GenerateRoadmapResponseDto>():
        return ApiError<GenerateRoadmapResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<ExtractKeyPointsResponseEntity>> extractKeyPoints(
      ExtractKeyPointsRequestEntity extractKeyPointsRequestEntity) async {
    final result = await learnApi.extractKeyPoints(
      ExtractKeyPointsRequestDto(
        trackName: extractKeyPointsRequestEntity.trackName,
        urls: extractKeyPointsRequestEntity.urls,
      ),
    );
    switch (result) {
      case ApiSuccess<ExtractKeyPointsResponseDto>():
        return ApiSuccess<ExtractKeyPointsResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<ExtractKeyPointsResponseDto>():
        return ApiError<ExtractKeyPointsResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<GenerateQuizResponseEntity>> generateQuiz(
      GenerateQuizRequestEntity generateQuizRequestEntity) async {
    final result = await learnApi.generateQuiz(
      GenerateQuizRequestDto(
        trackName: generateQuizRequestEntity.trackName,
        keyPoints: generateQuizRequestEntity.keyPoints,
      ),
    );
    switch (result) {
      case ApiSuccess<GenerateQuizResponseDto>():
        return ApiSuccess<GenerateQuizResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<GenerateQuizResponseDto>():
        return ApiError<GenerateQuizResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<EvaluateProjectResponseEntity>> evaluateProject(EvaluateProjectRequestEntity evaluateProjectRequestEntity) async {
    final result = await learnApi.evaluateProject(
      EvaluateProjectRequestDto(
        projectDescription: evaluateProjectRequestEntity.projectDescription,
        projectLink: evaluateProjectRequestEntity.projectLink,
        studentId: evaluateProjectRequestEntity.studentId,
        trackId: evaluateProjectRequestEntity.trackId,
      ),
    );
    switch (result) {
      case ApiSuccess<EvaluateProjectResponseDto>():
        return ApiSuccess<EvaluateProjectResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<EvaluateProjectResponseDto>():
        return ApiError<EvaluateProjectResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<RecommendedProjectsResponseEntity>> recommendedProjects(RecommendedProjectsRequestEntity recommendedProjectsRequestEntity) async {
    final result = await learnApi.recommendedProjects(
      RecommendedProjectsRequestDto(
        track: recommendedProjectsRequestEntity.track,
        technologies: recommendedProjectsRequestEntity.technologies,
      ),
    );
    switch (result) {
      case ApiSuccess<RecommendedProjectsResponseDto>():
        return ApiSuccess<RecommendedProjectsResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<RecommendedProjectsResponseDto>():
        return ApiError<RecommendedProjectsResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<EvaluationResultResponseEntity>> getEvaluationResult(String studentId) async {
    final result = await learnApi.getEvaluationResult(studentId);
    switch (result) {
      case ApiSuccess<EvaluationResultResponseDto>():
        return ApiSuccess<EvaluationResultResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<EvaluationResultResponseDto>():
        return ApiError<EvaluationResultResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<AddFinishedSkillResponseEntity>> addFinishedSkill(AddFinishedSkillRequestEntity addFinishedSkillRequestEntity) async {
    final result = await learnApi.addFinishedSkill(
      AddFinishedSkillRequestDto(
        skill: addFinishedSkillRequestEntity.skill,
      ),
    );
    switch (result) {
      case ApiSuccess<AddFinishedSkillResponseDto>():
        return ApiSuccess<AddFinishedSkillResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<AddFinishedSkillResponseDto>():
        return ApiError<AddFinishedSkillResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<AddFinishedTrackResponseEntity>> addFinishedTrack(AddFinishedTrackRequestEntity addFinishedTrackRequestEntity) async {
    final result = await learnApi.addFinishedTrack(
      AddFinishedTrackRequestDto(
        track: addFinishedTrackRequestEntity.track,
      ),
    );
    switch (result) {
      case ApiSuccess<AddFinishedTrackResponseDto>():
        return ApiSuccess<AddFinishedTrackResponseEntity>(
            (result.data?.toEntity()));
      case ApiError<AddFinishedTrackResponseDto>():
        return ApiError<AddFinishedTrackResponseEntity>(result.message);
    }
  }
}
