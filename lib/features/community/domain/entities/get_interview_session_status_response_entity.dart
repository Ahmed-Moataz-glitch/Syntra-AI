class GetInterviewSessionStatusResponseEntity {
  String sessionId;
  String track;
  String language;
  bool done;
  Null rating;
  Null evaluation;

  GetInterviewSessionStatusResponseEntity(
      {this.sessionId = '',
      this.track = '',
      this.language = '',
      this.done = false,
      this.rating,
      this.evaluation});
}
