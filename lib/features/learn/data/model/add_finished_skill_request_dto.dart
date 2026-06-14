import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_request_entity.dart';

class AddFinishedSkillRequestDto {
  String? skill;

  AddFinishedSkillRequestDto({this.skill});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skill'] = skill;
    return data;
  }

  AddFinishedSkillRequestEntity toEntity() {
    return AddFinishedSkillRequestEntity(skill: skill ?? '');
  }
}
