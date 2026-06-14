import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/assigned_task_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/gradient_text_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/unassigned_tasks_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class TasksPageViewWidget extends StatelessWidget {
  final GenerateAndAssignResponseEntity generateAndAssignResponseEntity;
  const TasksPageViewWidget(
      {super.key, required this.generateAndAssignResponseEntity});

  Map<String, List<AssignedTasksEntity>> get groupedTasks {
    final Map<String, List<AssignedTasksEntity>> groups = {};

    for (var task in generateAndAssignResponseEntity.assignedTasks) {
      final memberName = task.assignedTo;
      if (!groups.containsKey(memberName)) {
        groups[memberName] = [];
      }
      groups[memberName]!.add(task);
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final isArabic = AppLocalization.isArabic();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            width: size.width * 0.55,
            decoration: BoxDecoration(
                color: Color(0xffCFF8E7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:
                      isLightMode ? Color(0xff2CB08B) : AppColors.transparent,
                )),
            child: Row(
              spacing: 6.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_alt_outlined,
                  size: 20.sp,
                  color: Color(0xff0B6B56),
                ),
                Text(
                  S.of(context).tasks_page_view_title1,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0B6B56),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
          GradientTextWidget(
            text:
                '${S.of(context).tasks_page_view_title2_part1} ${generateAndAssignResponseEntity.totalTasks} ${S.of(context).tasks_page_view_title2_part2}',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.blue.withValues(alpha: 200, blue: 120),
                AppColors.purple.withValues(alpha: 200, blue: 150),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            S.of(context).tasks_page_view_title3,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: isArabic ? FontWeight.w700 : null,
              color: isLightMode
                  ? AppColors.black.withAlpha(160)
                  : AppColors.primary.withAlpha(220),
            ),
          ),
          SizedBox(height: 24.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
            itemBuilder: (conext, index) {
              final memberName = groupedTasks.keys.toList()[index];
              final memberTasks = groupedTasks[memberName] ?? [];
              return Container(
                decoration: BoxDecoration(
                    color: AppColors.purple.withAlpha(10),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isLightMode
                          ? AppColors.purple.withAlpha(20)
                          : AppColors.secondary.withAlpha(150),
                    )),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          margin: EdgeInsets.only(left: 12.w, top: 12.h),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.blue
                                    .withValues(alpha: 150, blue: 120),
                                AppColors.purple
                                    .withValues(alpha: 150, blue: 150),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            memberName.isNotEmpty
                                ? memberName[0].toUpperCase()
                                : '',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          memberName,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 12.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: isLightMode
                                ? AppColors.blue.withAlpha(30)
                                : AppColors.blue.withAlpha(80),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            '${memberTasks.length} ${S.of(context).tasks_page_view_title4}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isLightMode
                                  ? AppColors.blue
                                  : AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Divider(
                      color: AppColors.gray.withAlpha(60),
                      thickness: 1.5,
                      indent: 24.w,
                      endIndent: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(height: 12.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, taskIndex) {
                        final assignedTask = memberTasks[taskIndex];
                        return AssignedTaskWidget(assignedTask: assignedTask);
                      },
                      itemCount: memberTasks.length,
                    )
                  ],
                ),
              );
            },
            itemCount: groupedTasks.keys.toList().length,
          ),
          SizedBox(height: 32.h),
          generateAndAssignResponseEntity.unassignedTasks.tasks.isNotEmpty
              ? UnassignedTasksWidget(
                  unassignedTasks: generateAndAssignResponseEntity.unassignedTasks,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
