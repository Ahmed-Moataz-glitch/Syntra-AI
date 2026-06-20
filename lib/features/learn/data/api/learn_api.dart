import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/core/utils/secure_storage.dart';
import 'package:syntra_ai/features/learn/data/api/api_result.dart';
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

class LearnApi {
  Future<ApiResult<StartSessionResponseDto>> startSession() async {
    var url = Uri.https(AppApi.questionsHost, AppApi.startSessionEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<StartSessionResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<StartSessionResponseDto>(
          StartSessionResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<StartSessionResponseDto>(e.toString());
    }
  }

  Future<ApiResult<AnswerResponseDto>> answer(
      AnswerRequestDto answerRequestDto) async {
    var url = Uri.https(AppApi.questionsHost, AppApi.answerEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(answerRequestDto.toJson()),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<AnswerResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<AnswerResponseDto>(AnswerResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<AnswerResponseDto>(e.toString());
    }
  }

  Future<ApiResult<GenerateRoadmapResponseDto>> generateRoadmap(
      GenerateRoadmapRequestDto generateRoadmapRequestDto) async {
    var url = Uri.https(AppApi.roadmapHost, AppApi.generateRoadmapEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(GenerateRoadmapRequestDto(
          trackName: generateRoadmapRequestDto.trackName,
          hoursPerWeek: generateRoadmapRequestDto.hoursPerWeek,
        ).toJson()),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<GenerateRoadmapResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<GenerateRoadmapResponseDto>(
          GenerateRoadmapResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<GenerateRoadmapResponseDto>(e.toString());
    }
  }

  Future<ApiResult<ExtractKeyPointsResponseDto>> extractKeyPoints(
      ExtractKeyPointsRequestDto extractKeyPointsRequestDto) async {
    var url = Uri.https(AppApi.quizHost, AppApi.extractKeyPointsEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(extractKeyPointsRequestDto.toJson()),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<ExtractKeyPointsResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<ExtractKeyPointsResponseDto>(
          ExtractKeyPointsResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<ExtractKeyPointsResponseDto>(e.toString());
    }
  }

  Future<ApiResult<GenerateQuizResponseDto>> generateQuiz(
      GenerateQuizRequestDto generateQuizRequestDto) async {
    var url = Uri.https(AppApi.quizHost, AppApi.generateQuizEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(generateQuizRequestDto.toJson()),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<GenerateQuizResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<GenerateQuizResponseDto>(
          GenerateQuizResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<GenerateQuizResponseDto>(e.toString());
    }
  }

  Future<ApiResult<RecommendedProjectsResponseDto>> recommendedProjects(
      RecommendedProjectsRequestDto recommendedProjectsRequestDto) async {
    var url = Uri.https(
        AppApi.recommendedProjectsHost, AppApi.recommendProjectsEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(recommendedProjectsRequestDto.toJson()),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<RecommendedProjectsResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<RecommendedProjectsResponseDto>(
          RecommendedProjectsResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<RecommendedProjectsResponseDto>(e.toString());
    }
  }

  Future<ApiResult<EvaluateProjectResponseDto>> evaluateProject(
      EvaluateProjectRequestDto evaluateProjectRequestDto) async {
    var url =
        Uri.https(AppApi.learningProjectHost, AppApi.evaluateProjectEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(evaluateProjectRequestDto.toJson()),
      );
      var responseBody = response.body;
      if (response.statusCode != 200) {
        return ApiError<EvaluateProjectResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<EvaluateProjectResponseDto>(
          EvaluateProjectResponseDto.fromJson(jsonDecode(responseBody)));
    } catch (e) {
      return ApiError<EvaluateProjectResponseDto>(e.toString());
    }
  }

  Future<ApiResult<EvaluationResultResponseDto>> getEvaluationResult(
      String studentId) async {
    var url = Uri.https(
        AppApi.learningProjectHost,
        AppApi.evaluationResultEndpoint + studentId,
    );
    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var responseBody = response.body;
      if (response.statusCode != 200) {
        return ApiError<EvaluationResultResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<EvaluationResultResponseDto>(
          EvaluationResultResponseDto.fromJson(jsonDecode(responseBody)));
    } catch (e) {
      return ApiError<EvaluationResultResponseDto>(e.toString());
    }
  }

  Future<ApiResult<void>> setTeam(List<SetTeamRequestDto> teamMembers) async {
    var url = Uri.https(AppApi.teamHost, AppApi.setTeamEndpoint);
    try {
      var response = await http.post(
        headers: {
          'Content-Type': 'application/json',
        },
        url,
        body: jsonEncode(
            teamMembers.map((teamMember) => teamMember.toJson()).toList()),
      );
      var responseBody = response.body;
      if (response.statusCode != 200) {
        return ApiError<void>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<void>(null);
    } catch (e) {
      return ApiError<void>(e.toString());
    }
  }

  Future<ApiResult<GenerateAndAssignResponseDto>> generateAndAssign(
      GenerateAndAssignRequestDto generateAndAssignRequestDto) async {
    var url = Uri.https(
      AppApi.teamHost,
      AppApi.generateAndAssignTasksEndpoint,
      {
        'project_description':
            generateAndAssignRequestDto.projectDescription ?? '',
        // 'num_tasks': generateAndAssignRequestDto.numOfTasks.toString(),
      },
    );
    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<GenerateAndAssignResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<GenerateAndAssignResponseDto>(
          GenerateAndAssignResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<GenerateAndAssignResponseDto>(e.toString());
    }
  }

  Future<ApiResult<AddFinishedSkillResponseDto>> addFinishedSkill(
      AddFinishedSkillRequestDto addFinishedSkillRequestDto) async {
    final token = await SecureStorage.getToken();
    var url = Uri.https(AppApi.authHost, AppApi.baseUrl + AppApi.addFinishedSkillEndpoint);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(addFinishedSkillRequestDto.toJson()),
      );
      var responseBody = response.body;
      if (response.statusCode != 200) {
        return ApiError<AddFinishedSkillResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<AddFinishedSkillResponseDto>(
          AddFinishedSkillResponseDto.fromJson(jsonDecode(responseBody)));
    } catch (e) {
      return ApiError<AddFinishedSkillResponseDto>(e.toString());
    }
  }

  Future<ApiResult<AddFinishedTrackResponseDto>> addFinishedTrack(
      AddFinishedTrackRequestDto addFinishedTrackRequestDto) async {
    final token = await SecureStorage.getToken();
    var url = Uri.https(AppApi.authHost, AppApi.baseUrl + AppApi.addFinishedTrackEndpoint);
    try {
      
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(addFinishedTrackRequestDto.toJson()),
      );
      var responseBody = response.body;
      if (response.statusCode != 200) {
        return ApiError<AddFinishedTrackResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<AddFinishedTrackResponseDto>(
          AddFinishedTrackResponseDto.fromJson(jsonDecode(responseBody)));
    } catch (e) {
      return ApiError<AddFinishedTrackResponseDto>(e.toString());
    }
  }
}
