class StartInterviewResponseEntity {
  String sessionId;
  String track;
  String language;
  String message;
  bool done;

  StartInterviewResponseEntity(
      {this.sessionId = '', this.track = '', this.language = '', this.message = '', this.done = false});
}
