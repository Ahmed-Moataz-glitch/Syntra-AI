class InterviewChatResponseEntity {
  String sessionId;
  String message;
  bool done;
  Null rating;
  Null evaluation;

  InterviewChatResponseEntity(
      {this.sessionId = '', this.message = '', this.done = false, this.rating, this.evaluation});
}
