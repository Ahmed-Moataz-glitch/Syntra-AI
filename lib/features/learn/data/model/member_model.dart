// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class MemberModel {
  final int id;
  final TextEditingController memberNameController;
  final TextEditingController memberSkillsController;
  final String memberName;
  final List<String> memberSkills;

  MemberModel({
    required this.id,
    required this.memberNameController,
    required this.memberName,
    required this.memberSkillsController,
    required this.memberSkills,
  });

  MemberModel copyWith({
    int? id,
    TextEditingController? memberNameController,
    TextEditingController? memberSkillsController,
    String? memberName,
    List<String>? memberSkills,
  }) {
    return MemberModel(
      id: id ?? this.id,
      memberNameController: memberNameController ?? this.memberNameController,
      memberSkillsController: memberSkillsController ?? this.memberSkillsController,
      memberName: memberName ?? this.memberName,
      memberSkills: memberSkills ?? this.memberSkills,
    );
  }
}

List<MemberModel> members = [
  MemberModel(
    id: 1,
    memberNameController: TextEditingController(),
    memberName: '',
    memberSkillsController: TextEditingController(),
    memberSkills: [],
  ),
];
