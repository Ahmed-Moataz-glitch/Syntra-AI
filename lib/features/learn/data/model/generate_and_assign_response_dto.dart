import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';

class GenerateAndAssignResponseDto {
  int? totalTasks;
  List<AssignedTasks>? assignedTasks;
  UnassignedTasks? unassignedTasks;
  DistributionSummary? distributionSummary;

  GenerateAndAssignResponseDto(
      {this.totalTasks,
      this.assignedTasks,
      this.unassignedTasks,
      this.distributionSummary});

  GenerateAndAssignResponseDto.fromJson(Map<String, dynamic> json) {
    totalTasks = json['total_tasks'];
    if (json['assigned_tasks'] != null) {
      assignedTasks = <AssignedTasks>[];
      json['assigned_tasks'].forEach((v) {
        assignedTasks!.add(AssignedTasks.fromJson(v));
      });
    }
    unassignedTasks = json['unassigned_tasks'] != null ? UnassignedTasks.fromJson(json) : null;
    distributionSummary = json['distribution_summary'] != null
        ? DistributionSummary.fromJson(json['distribution_summary'])
        : null;
  }

  GenerateAndAssignResponseEntity toEntity() {
    return GenerateAndAssignResponseEntity(
      totalTasks: totalTasks ?? 0,
      assignedTasks: assignedTasks
              ?.map((assignedTask) => assignedTask.toEntity())
              .toList() ??
          [],
      unassignedTasks: unassignedTasks != null ? unassignedTasks!.toEntity() : UnassignedTasksEntity(),
      distributionSummary: distributionSummary != null ? distributionSummary!.toEntity() : DistributionSummaryEntity(),
    );
  }
}

class AssignedTasks {
  Task? task;
  String? assignedTo;
  int? memberId;
  double? matchScore;
  String? reason;

  AssignedTasks(
      {this.task,
      this.assignedTo,
      this.memberId,
      this.matchScore,
      this.reason});

  AssignedTasks.fromJson(Map<String, dynamic> json) {
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
    assignedTo = json['assigned_to'];
    memberId = json['member_id'];
    matchScore = json['match_score'];
    reason = json['reason'];
  }

  AssignedTasksEntity toEntity() {
    return AssignedTasksEntity(
      task: TaskEntity(
        taskName: task!.taskName ?? '',
        description: task!.description ?? '',
        requiredSkills: task!.requiredSkills ?? [],
        difficultyLevel: task!.difficultyLevel ?? 0,
      ),
      assignedTo: assignedTo ?? '',
      memberId: memberId ?? 0,
      matchScore: matchScore ?? 0.0,
      reason: reason ?? '',
    );
  }
}

class UnassignedTasks {
  List<Task>? tasks;

  UnassignedTasks({this.tasks});

  UnassignedTasks.fromJson(Map<String, dynamic> json) {
    if (json['unassigned_tasks'] != null) {
      tasks = <Task>[];
      json['unassigned_tasks'].forEach((v) {
        tasks!.add(Task.fromJson(v));
      });
    }
  }

  UnassignedTasksEntity toEntity() {
    return UnassignedTasksEntity(
      // Maps the list of tasks to a list of entities
      tasks: tasks?.map((t) => TaskEntity(
        taskName: t.taskName ?? '',
        description: t.description ?? '',
        requiredSkills: t.requiredSkills ?? [],
        difficultyLevel: t.difficultyLevel ?? 0,
      )).toList() ?? [],
    );
  }
}

class DistributionSummary {
  Map<String, dynamic>? summaryDistribution;
  DistributionSummary({this.summaryDistribution});

  DistributionSummary.fromJson(Map<String, dynamic> json) {
    summaryDistribution = json['summary_distribution'];
  }

  DistributionSummaryEntity toEntity() {
    return DistributionSummaryEntity(
      summaryDistribution: summaryDistribution ?? {},
    );
  }
}

class Task {
  String? taskName;
  String? description;
  List<String>? requiredSkills;
  int? difficultyLevel;

  Task(
      {this.taskName,
      this.description,
      this.requiredSkills,
      this.difficultyLevel});

  Task.fromJson(Map<String, dynamic> json) {
    taskName = json['Task_Name'];
    description = json['Description'];
    requiredSkills = json['Required_Skills'].cast<String>();
    difficultyLevel = json['Difficulty_Level'];
  }

  TaskEntity toEntity() {
    return TaskEntity(
      taskName: taskName ?? '',
      description: description ?? '',
      requiredSkills: requiredSkills ?? [],
      difficultyLevel: difficultyLevel ?? 0,
    );
  }

  Task copyWith({
    String? taskName,
    String? description,
    List<String>? requiredSkills,
    int? difficultyLevel,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      requiredSkills: requiredSkills ?? this.requiredSkills,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
    );
  }
}




// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';

// class GenerateAndAssignResponseDto {
// 	int? totalTasks;
// 	List<AssignedTasks>? assignedTasks;
// 	List<UnassignedTasks>? unassignedTasks;
// 	DistributionSummary? distributionSummary;

// 	GenerateAndAssignResponseDto({this.totalTasks = 0, this.assignedTasks = const [], this.unassignedTasks = const []});

//   GenerateAndAssignResponseDto.fromJson(Map<String, dynamic> json) {
//   totalTasks = json['total_tasks'];
  
//   if (json['assigned_tasks'] != null) {
//     assignedTasks = <AssignedTasks>[];
//     json['assigned_tasks'].forEach((v) {
//       assignedTasks!.add(AssignedTasks(
//         task: Task(
//           taskName: v['task']['Task_Name'],
//           description: v['task']['Description'],
//           // FIX HERE: Safe null-check fallback
//           requiredSkills: v['task']['Required_Skills'] != null 
//               ? List<String>.from(v['task']['Required_Skills']) 
//               : [],
//           difficultyLevel: v['task']['Difficulty_Level'],
//         ),
//         assignedTo: v['assigned_to'],
//         memberId: v['member_id'],
//         matchScore: v['match_score'],
//         reason: v['reason'],
//       ));
//     });
//   }
  
//   if (json['unassigned_tasks'] != null) {
//     unassignedTasks = <UnassignedTasks>[];
//     json['unassigned_tasks'].forEach((v) {
//       unassignedTasks!.add(UnassignedTasks(
//         task: Task(
//           taskName: v['task']['Task_Name'],
//           description: v['task']['Description'],
//           // FIX HERE: Safe null-check fallback
//           requiredSkills: v['task']['Required_Skills'] != null 
//               ? List<String>.from(v['task']['Required_Skills']) 
//               : [],
//           difficultyLevel: v['task']['Difficulty_Level'],
//         ),
//       ));
//     });
//   }
  
//   distributionSummary = json['distribution_summary'] != null
//       ? DistributionSummary.fromJson(json['distribution_summary'])
//       : null;
// }
  
  
// }

// class AssignedTasks {
// 	Task? task;
// 	String? assignedTo;
// 	int? memberId;
// 	double? matchScore;
//   String? reason;

// 	AssignedTasks({this.task, this.assignedTo = '', this.memberId = 0, this.matchScore = 0, this.reason = '' });

//   AssignedTasks.fromJson(Map<String, dynamic> json) {
//   task = Task(
//     taskName: json['task']['Task_Name'],
//     description: json['task']['Description'],
//     // FIX: Guard against null or missing required_skills
//     requiredSkills: json['task']['Required_Skills'] != null
//         ? List<String>.from(json['task']['Required_Skills'])
//         : [],
//     difficultyLevel: json['task']['Difficulty_Level'],
//   );
//   assignedTo = json['assigned_to'];
//   memberId = json['member_id'];
//   matchScore = json['match_score'];
//   reason = json['reason'];
// }

  
// }

// class UnassignedTasks {
//   Task? task;

//   UnassignedTasks({this.task});

//   UnassignedTasks.fromJson(Map<String, dynamic> json) {
//   task = Task(
//     taskName: json['task']['Task_Name'],
//     description: json['task']['Description'],
//     // FIX: Guard against null or missing required_skills
//     requiredSkills: json['task']['Required_Skills'] != null
//         ? List<String>.from(json['task']['Required_Skills'])
//         : [],
//     difficultyLevel: json['task']['Difficulty_Level'],
//   );
// }

  
// }

// class Task {
// 	String? taskName;
// 	String? description;
// 	List<String>? requiredSkills;
// 	int? difficultyLevel;

// 	Task({this.taskName = '', this.description = '', this.requiredSkills = const [], this.difficultyLevel = 0});

//   Task.fromJson(Map<String, dynamic> json) {
//   taskName = json['Task_Name'] ?? '';
//   description = json['Description'] ?? '';
//   // FIX: Safe null-check fallback right at the source
//   requiredSkills = json['Required_Skills'] != null
//       ? List<String>.from(json['Required_Skills'])
//       : [];
//   difficultyLevel = json['Difficulty_Level'];
// }

  

  
// }

// class DistributionSummary {


// 	DistributionSummary();

// 	DistributionSummary.fromJson(Map<String, dynamic> json);

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		return data;
// 	}
// }
