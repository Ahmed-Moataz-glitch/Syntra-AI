import 'package:syntra_ai/features/learn/domain/entities/set_team_request_entity.dart';

class SetTeamRequestDto {
  int? id;
  String? name;
  List<String>? skills;
  int? currentWorkload;

  SetTeamRequestDto({this.id, this.name, this.skills, this.currentWorkload});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['skills'] = skills;
    data['current_workload'] = currentWorkload;
    return data;
  }

  SetTeamRequestEntity toEntity() {
    return SetTeamRequestEntity(
      id: id ?? 1,
      name: name ?? '',
      skills: skills ?? [],
      currentWorkload: currentWorkload ?? 0,
    );
  }
}
