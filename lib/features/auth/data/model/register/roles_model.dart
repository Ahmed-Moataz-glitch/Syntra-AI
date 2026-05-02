import 'package:flutter/material.dart';
import 'package:syntra_ai/generated/l10n.dart';

class RolesModel {
  final IconData iconData;
  final String Function(BuildContext context) title;
  bool isSelected;
  RolesModel({
    required this.iconData,
    required this.title,
    this.isSelected = false,
  });

  RolesModel copyWith({IconData? iconData, String Function(BuildContext context)? title, bool? isSelected}) {
    return RolesModel(
      iconData: iconData ?? this.iconData,
      title: (context) => title != null ? title(context) : this.title(context),
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

List<RolesModel> rolesList = [
  RolesModel(iconData: Icons.school, title: (context) => S.of(context).signup_role1),
  RolesModel(iconData: Icons.group, title: (context) => S.of(context).signup_role2),
  RolesModel(iconData: Icons.person_search, title: (context) => S.of(context).signup_role3),
];
