import 'package:flutter/cupertino.dart';

class ProjectModel {
  final TextEditingController projectDescriptionController;

  ProjectModel({
    required this.projectDescriptionController,
  });

  ProjectModel copyWith({
    String? projectDescriptionController,
  }) {
    return ProjectModel(
      projectDescriptionController: this.projectDescriptionController,
    );
  }
}

ProjectModel project = ProjectModel(projectDescriptionController: TextEditingController());