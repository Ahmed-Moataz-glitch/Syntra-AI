class GenerateAndAssignResponseEntity {
	int totalTasks;
	List<AssignedTasksEntity> assignedTasks;
	UnassignedTasksEntity unassignedTasks;
	DistributionSummaryEntity distributionSummary;

	GenerateAndAssignResponseEntity({this.totalTasks = 0, this.assignedTasks = const [], this.unassignedTasks = const UnassignedTasksEntity(), this.distributionSummary = const DistributionSummaryEntity()});
}

class AssignedTasksEntity {
	TaskEntity task;
	String assignedTo;
	int memberId;
	double matchScore;
	String reason;

	AssignedTasksEntity({this.task = const TaskEntity(), this.assignedTo = '', this.memberId = 0, this.matchScore = 0.0, this.reason = '' });
}

class UnassignedTasksEntity {
  final List<TaskEntity> tasks;

  const UnassignedTasksEntity({this.tasks = const []});
}

class TaskEntity {
	final String taskName;
	final String description;
	final List<String> requiredSkills;
	final int difficultyLevel;

	const TaskEntity({this.taskName = '', this.description = '', this.requiredSkills = const [], this.difficultyLevel = 0});
}

class DistributionSummaryEntity {
  final Map<String, dynamic> summaryDistribution;

	const DistributionSummaryEntity({this.summaryDistribution = const {}});

	// DistributionSummary.fromJson(Map<String, dynamic> json) {
	// }

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	return data;
	// }
}
