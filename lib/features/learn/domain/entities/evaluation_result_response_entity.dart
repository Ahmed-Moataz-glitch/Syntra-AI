class EvaluationResultResponseEntity {
  int score;
  String status;
  FeedbackEnity feedback;
  List<RequirementsMetEntity> requirementsMet;

  EvaluationResultResponseEntity(
      {this.score = 0, this.status = '', this.feedback = const FeedbackEnity(), this.requirementsMet = const []});
}

class FeedbackEnity {
  final List<String> strengths;
  final List<String> weaknesses;
  final String suggestions;

  const FeedbackEnity({this.strengths = const [], this.weaknesses = const [], this.suggestions = ''});
}

class RequirementsMetEntity {
  String feature;
  bool status;

  RequirementsMetEntity({this.feature = '', this.status = false});
}
