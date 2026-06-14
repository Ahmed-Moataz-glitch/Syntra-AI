class StartSessionResponseEntity {
  String sessionId;
  String question;
  Map<String, String> options;
  int questionNumber;
  bool isFinished;

  StartSessionResponseEntity(
      {this.sessionId = '',
      this.question = '',
      this.options = const {
        'A': '',
        'B': '',
        'C': '',
        'D': '',
      },
      this.questionNumber = 0,
      this.isFinished = false});
}
