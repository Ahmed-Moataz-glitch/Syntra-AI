part of 'learn_cubit.dart';

sealed class LearnState {}

final class LearnInitial extends LearnState {}

final class LearnLoading extends LearnState {}

final class LearnLoaded extends LearnState {

  LearnLoaded();
}

final class LearnError extends LearnState {
  final String message;

  LearnError(this.message);
}

