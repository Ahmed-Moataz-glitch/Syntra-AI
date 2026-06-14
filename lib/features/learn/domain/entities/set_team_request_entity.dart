class SetTeamRequestEntity {
  int id;
  String name;
  List<String> skills;
  int currentWorkload;

  SetTeamRequestEntity({this.id = 1, this.name = '', this.skills = const [], this.currentWorkload = 0});
}
