import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_request_entity.dart';

class GenerateAndAssignRequestDto {
  String? projectDescription;
  int? numOfTasks;

  GenerateAndAssignRequestDto({this.projectDescription, this.numOfTasks});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_description'] = projectDescription;
    data['num_of_tasks'] = numOfTasks;
    return data;
  }

  GenerateAndAssignRequestEntity toEntity() {
    return GenerateAndAssignRequestEntity(
      projectDescription: projectDescription ?? '',
      numOfTasks: numOfTasks ?? 0,
    );
  }
}
