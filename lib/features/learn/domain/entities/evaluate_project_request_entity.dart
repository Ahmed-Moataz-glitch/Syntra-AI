class EvaluateProjectRequestEntity {
  String projectLink;
  String trackId;
  String studentId;
  String projectDescription;

  EvaluateProjectRequestEntity(
      {this.projectLink = '',
      this.trackId = '',
      this.studentId = '',
      this.projectDescription = ''});
}
