// ignore_for_file: unused_field
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/data/model/user_roadmap_model.dart';
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
import 'package:syntra_ai/features/learn/domain/use_case/add_finished_skill_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/add_finished_track_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/answer_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/evaluate_project_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/evaluation_result_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/extract_key_points_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/generate_and_assign_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/generate_quiz_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/generate_roadmap_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/recommended_projects_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/set_team_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/start_session_use_case.dart';

part 'learn_state.dart';

class LearnCubit extends Cubit<LearnState> {
  final StartSessionUseCase startSessionUseCase;
  final AnswerUseCase answerUseCase;
  final GenerateRoadmapUseCase generateRoadmapUseCase;
  final ExtractKeyPointsUseCase extractKeyPointsUseCase;
  final GenerateQuizUseCase generateQuizUseCase;
  final RecommendedProjectsUseCase recommendedProjectsUseCase;
  final EvaluateProjectUseCase evaluateProjectUseCase;
  final EvaluationResultUseCase evaluationResultUseCase;
  final SetTeamUseCase setTeamUseCase;
  final GenerateAndAssignUseCase generateAndAssignUseCase;
  final AddFinishedSkillUseCase addFinishedSkillUseCase;
  final AddFinishedTrackUseCase addFinishedTrackUseCase;
  LearnCubit(
      {required this.startSessionUseCase,
      required this.answerUseCase,
      required this.generateRoadmapUseCase,
      required this.extractKeyPointsUseCase,
      required this.generateQuizUseCase,
      required this.recommendedProjectsUseCase,
      required this.evaluateProjectUseCase,
      required this.evaluationResultUseCase,
      required this.setTeamUseCase,
      required this.generateAndAssignUseCase,
      required this.addFinishedSkillUseCase,
      required this.addFinishedTrackUseCase})
      : super(LearnInitial());

  Future<void> startSession() async {
    emit(StartSessionLoading());
    final result = await startSessionUseCase.call();
    switch (result) {
      case ApiSuccess<StartSessionResponseEntity>():
        emit(StartSessionSuccess(result.data!));
        break;
      case ApiError<StartSessionResponseEntity>():
        emit(StartSessionError(result.message));
        break;
    }
  }

  Future<void> answer(
      {required int index,
      required AnswerRequestEntity answerRequestEntity}) async {
    emit(AnswerLoading());
    final result = await answerUseCase.call(answerRequestEntity);
    switch (result) {
      case ApiSuccess<AnswerResponseEntity>():
        emit(AnswerSuccess(result.data!));
        break;
      case ApiError<AnswerResponseEntity>():
        emit(AnswerError(result.message));
        break;
    }
  }

  Future<void> finalAnswer(
      {required int index,
      required AnswerRequestEntity answerRequestEntity}) async {
    emit(FinalAnswerLoading());
    final result = await answerUseCase.call(answerRequestEntity);
    switch (result) {
      case ApiSuccess<AnswerResponseEntity>():
        emit(FinalAnswerSuccess(result.data!));
        break;
      case ApiError<AnswerResponseEntity>():
        emit(FinalAnswerError(result.message));
        break;
    }
  }

  Future<void> generateRoadmap(
      GenerateRoadmapRequestEntity generateRoadmapRequestEntity) async {
    emit(GenerateRoadmapLoading());
    final result =
        await generateRoadmapUseCase.call(generateRoadmapRequestEntity);
    switch (result) {
      case ApiSuccess<GenerateRoadmapResponseEntity>():
        emit(GenerateRoadmapSuccess(result.data!));
        break;
      case ApiError<GenerateRoadmapResponseEntity>():
        emit(GenerateRoadmapError(result.message));
        break;
    }
  }

  Future<void> extractKeyPoints(
      ExtractKeyPointsRequestEntity extractKeyPointsRequestEntity) async {
    emit(ExtractKeyPointsLoading());
    final result =
        await extractKeyPointsUseCase.call(extractKeyPointsRequestEntity);
    switch (result) {
      case ApiSuccess<ExtractKeyPointsResponseEntity>():
        emit(ExtractKeyPointsSuccess(result.data!));
        break;
      case ApiError<ExtractKeyPointsResponseEntity>():
        emit(ExtractKeyPointsError(result.message));
        break;
    }
  }

  Future<void> generateQuiz(
      GenerateQuizRequestEntity generateQuizRequestEntity) async {
    emit(GenerateQuizLoading());
    final result = await generateQuizUseCase.call(generateQuizRequestEntity);
    switch (result) {
      case ApiSuccess<GenerateQuizResponseEntity>():
        emit(GenerateQuizSuccess(result.data!));
        break;
      case ApiError<GenerateQuizResponseEntity>():
        emit(GenerateQuizError(result.message));
        break;
    }
  }

  Future<void> recommendedProjects(
      RecommendedProjectsRequestEntity recommendedProjectsRequestEntity) async {
    emit(RecommendedProjectsLoading());
    final result =
        await recommendedProjectsUseCase.call(recommendedProjectsRequestEntity);
    switch (result) {
      case ApiSuccess<RecommendedProjectsResponseEntity>():
        emit(RecommendedProjectsSuccess(result.data!));
        break;
      case ApiError<RecommendedProjectsResponseEntity>():
        emit(RecommendedProjectsError(result.message));
        break;
    }
  }

  Future<void> evaluateProject(
      EvaluateProjectRequestEntity evaluateProjectRequestEntity) async {
    emit(EvaluateProjectLoading());
    final result =
        await evaluateProjectUseCase.call(evaluateProjectRequestEntity);
    switch (result) {
      case ApiSuccess<EvaluateProjectResponseEntity>():
        emit(EvaluateProjectSuccess(result.data!));
        break;
      case ApiError<EvaluateProjectResponseEntity>():
        emit(EvaluateProjectError(result.message));
        break;
    }
  }

  Future<void> getEvaluationResult(String studentId) async {
    emit(EvaluationResultLoading());
    final result = await evaluationResultUseCase.call(studentId);
    switch (result) {
      case ApiSuccess<EvaluationResultResponseEntity>():
        emit(EvaluationResultSuccess(result.data!));
        break;
      case ApiError<EvaluationResultResponseEntity>():
        emit(EvaluationResultError(result.message));
        break;
    }
  }

  Future<void> setTeam(List<SetTeamRequestEntity> teamMembers) async {
    emit(SetTeamLoading());
    final result = await setTeamUseCase.call(teamMembers);
    switch (result) {
      case ApiSuccess<void>():
        emit(SetTeamSuccess());
        break;
      case ApiError<void>():
        emit(SetTeamError(result.message));
        break;
    }
  }

  Future<void> generateAndAssign(
      GenerateAndAssignRequestEntity generateAndAssignRequestEntity) async {
    emit(GenerateAndAssignLoading());
    final result =
        await generateAndAssignUseCase.call(generateAndAssignRequestEntity);
    switch (result) {
      case ApiSuccess<GenerateAndAssignResponseEntity>():
        emit(GenerateAndAssignSuccess(result.data!));
        break;
      case ApiError<GenerateAndAssignResponseEntity>():
        emit(GenerateAndAssignError(result.message));
        break;
    }
  }

  Future<void> saveRoadmap(UserRoadmapModel userRoadmap) async {
    emit(SaveRoadmapLoading());
    try {
      var userRoadmapBox = Hive.box<UserRoadmapModel>(AppApi.userRoadmapBox);
      await userRoadmapBox.put('userRoadmap', userRoadmap);
      emit(SaveRoadmapSuccess());
    } catch (e) {
      emit(SaveRoadmapError(e.toString()));
    }
  }

  UserRoadmapModel? getUserRoadmap() {
    try {
      var userRoadmapBox = Hive.box<UserRoadmapModel>(AppApi.userRoadmapBox);
      final userRoadmap = userRoadmapBox.get('userRoadmap');
      if (userRoadmap != null) {
        emit(GetSavedRoadmapSuccess(userRoadmap));
        return userRoadmap;
      } else {
        emit(GetSavedRoadmapError('No saved roadmap found.'));
        return null;
      }
    } catch (e) {
      emit(GetSavedRoadmapError(e.toString()));
      return null;
    }
  }

  Future<void> deleteUserRoadmap() async {
    var userRoadmapBox = Hive.box<UserRoadmapModel>(AppApi.userRoadmapBox);
    await userRoadmapBox.delete('userRoadmap');
  }

  Future<void> addFinishedSkill(
      AddFinishedSkillRequestEntity addFinishedSkillRequestEntity) async {
    emit(AddFinishedSkillLoading());
    final result =
        await addFinishedSkillUseCase.call(addFinishedSkillRequestEntity);
    switch (result) {
      case ApiSuccess<AddFinishedSkillResponseEntity>():
        emit(AddFinishedSkillSuccess(result.data!));
        break;
      case ApiError<AddFinishedSkillResponseEntity>():
        emit(AddFinishedSkillError(result.message));
        break;
    }
  }

  Future<void> addFinishedTrack(
      AddFinishedTrackRequestEntity addFinishedTrackRequestEntity) async {
    emit(AddFinishedTrackLoading());
    final result =
        await addFinishedTrackUseCase.call(addFinishedTrackRequestEntity);
    switch (result) {
      case ApiSuccess<AddFinishedTrackResponseEntity>():
        emit(AddFinishedTrackSuccess(result.data!));
        break;
      case ApiError<AddFinishedTrackResponseEntity>():
        emit(AddFinishedTrackError(result.message));
        break;
    }
  }
}
