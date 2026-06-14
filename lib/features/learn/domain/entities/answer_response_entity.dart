class AnswerResponseEntity {
  String sessionId;
  String question;
  Map<String, String> options;
  int questionNumber;
  bool isFinished;
  RecommendationEntity recommendation;

  AnswerResponseEntity(
      {this.sessionId = '',
      this.question = '',
      this.options = const {
        'A': '',
        'B': '',
        'C': '',
        'D': '',
      },
      this.questionNumber = 1,
      this.isFinished = false,
      this.recommendation = const RecommendationEntity()});
}

class RecommendationEntity {
  final String trackName;
  final String reasoning;

  const RecommendationEntity({this.trackName = '', this.reasoning = ''});
}

