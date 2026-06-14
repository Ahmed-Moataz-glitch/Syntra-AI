part of 'learn_cubit.dart';

sealed class LearnState {}

final class LearnInitial extends LearnState {}

final class StartSessionLoading extends LearnState {}

final class StartSessionSuccess extends LearnState {
  final StartSessionResponseEntity startSessionResponseEntity;
  StartSessionSuccess(this.startSessionResponseEntity);
}

final class StartSessionError extends LearnState {
  final String message;

  StartSessionError(this.message);
}

final class AnswerLoading extends LearnState {}

final class AnswerSuccess extends LearnState {
  final AnswerResponseEntity answerResponseEntity;
  AnswerSuccess(this.answerResponseEntity);
}

final class AnswerError extends LearnState {
  final String message;
  AnswerError(this.message);
}

final class FinalAnswerLoading extends LearnState {}

final class FinalAnswerSuccess extends LearnState {
  final AnswerResponseEntity finalAnswerResponseEntity;
  FinalAnswerSuccess(this.finalAnswerResponseEntity);
}

final class FinalAnswerError extends LearnState {
  final String message;
  FinalAnswerError(this.message);
}

final class GenerateRoadmapLoading extends LearnState {}

final class GenerateRoadmapSuccess extends LearnState {
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  GenerateRoadmapSuccess(this.generateRoadmapResponseEntity);
}

final class GenerateRoadmapError extends LearnState {
  final String message;
  GenerateRoadmapError(this.message);
}

final class SaveRoadmapLoading extends LearnState {}

final class SaveRoadmapSuccess extends LearnState {}

final class SaveRoadmapError extends LearnState {
  final String message;

  SaveRoadmapError(this.message);
}

final class ExtractKeyPointsLoading extends LearnState {}

final class ExtractKeyPointsSuccess extends LearnState {
  final ExtractKeyPointsResponseEntity extractKeyPointsResponseEntity;
  ExtractKeyPointsSuccess(this.extractKeyPointsResponseEntity);
}

final class ExtractKeyPointsError extends LearnState {
  final String message;
  ExtractKeyPointsError(this.message);
}

final class GenerateQuizLoading extends LearnState {}

final class GenerateQuizSuccess extends LearnState {
  final GenerateQuizResponseEntity generateQuizResponseEntity;
  GenerateQuizSuccess(this.generateQuizResponseEntity);
}

final class GenerateQuizError extends LearnState {
  final String message;
  GenerateQuizError(this.message);
}

final class RecommendedProjectsLoading extends LearnState {}

final class RecommendedProjectsSuccess extends LearnState {
  final RecommendedProjectsResponseEntity recommendedProjectsResponseEntity;
  RecommendedProjectsSuccess(this.recommendedProjectsResponseEntity);
}

final class RecommendedProjectsError extends LearnState {
  final String message;
  RecommendedProjectsError(this.message);
}

final class EvaluateProjectLoading extends LearnState {}

final class EvaluateProjectSuccess extends LearnState {
  final EvaluateProjectResponseEntity evaluateProjectResponseEntity;
  EvaluateProjectSuccess(this.evaluateProjectResponseEntity);
}

final class EvaluateProjectError extends LearnState {
  final String message;
  EvaluateProjectError(this.message);
}

final class EvaluationResultLoading extends LearnState {}

final class EvaluationResultSuccess extends LearnState {
  final EvaluationResultResponseEntity evaluationResultResponseEntity;
  EvaluationResultSuccess(this.evaluationResultResponseEntity);
}

final class EvaluationResultError extends LearnState {
  final String message;
  EvaluationResultError(this.message);
}

final class GetSavedRoadmapSuccess extends LearnState {
  final UserRoadmapModel userRoadmapModel;
  GetSavedRoadmapSuccess(this.userRoadmapModel);
}

final class GetSavedRoadmapError extends LearnState {
  final String message;

  GetSavedRoadmapError(this.message);
}

final class SetTeamLoading extends LearnState {}

final class SetTeamSuccess extends LearnState {
  SetTeamSuccess();
}

final class SetTeamError extends LearnState {
  final String message;

  SetTeamError(this.message);
}

final class GenerateAndAssignLoading extends LearnState {}

final class GenerateAndAssignSuccess extends LearnState {
  final GenerateAndAssignResponseEntity generateAndAssignResponseEntity;
  GenerateAndAssignSuccess(this.generateAndAssignResponseEntity);
}

final class GenerateAndAssignError extends LearnState {
  final String message;

  GenerateAndAssignError(this.message);
}

final class AddFinishedSkillLoading extends LearnState {}

final class AddFinishedSkillSuccess extends LearnState {
  final AddFinishedSkillResponseEntity addFinishedSkillResponseEntity;
  AddFinishedSkillSuccess(this.addFinishedSkillResponseEntity);
}

final class AddFinishedSkillError extends LearnState {
  final String message;

  AddFinishedSkillError(this.message);
}

final class AddFinishedTrackLoading extends LearnState {}

final class AddFinishedTrackSuccess extends LearnState {
  final AddFinishedTrackResponseEntity addFinishedTrackResponseEntity;
  AddFinishedTrackSuccess(this.addFinishedTrackResponseEntity);
}

final class AddFinishedTrackError extends LearnState {
  final String message;

  AddFinishedTrackError(this.message);
}

