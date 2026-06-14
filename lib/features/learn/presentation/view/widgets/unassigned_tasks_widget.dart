import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/unassigned_task_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class UnassignedTasksWidget extends StatelessWidget {
  final UnassignedTasksEntity unassignedTasks;
  const UnassignedTasksWidget({super.key, required this.unassignedTasks});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isLightMode ? AppColors.orange.withAlpha(20) : AppColors.orange.withAlpha(10),
        border: Border.all(
          color: AppColors.orange.withAlpha(60),
          width: 1.r,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline_outlined,
                color: isLightMode ? AppColors.orange : AppColors.orange.withAlpha(220),
              ),
              SizedBox(width: 6.w),
              Text(
                S.of(context).unassigned_task_title1,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: isLightMode ? FontWeight.w700 : FontWeight.w600,
                  color: isLightMode ? AppColors.orange : AppColors.orange.withAlpha(220),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                '(${unassignedTasks.tasks.length})',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: isLightMode ? FontWeight.w700 : FontWeight.w600,
                  color: isLightMode ? AppColors.orange : AppColors.orange.withAlpha(220),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            S.of(context).unassigned_task_title2,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isLightMode ? FontWeight.w700 : FontWeight.w600,
              color: isLightMode ? AppColors.orange : AppColors.orange.withAlpha(220),
            ),
          ),
          SizedBox(height: 24.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: unassignedTasks.tasks.length,
            itemBuilder: (context, index) {
              return UnassignedTaskWidget(unassignedTask: unassignedTasks.tasks[index]);
            },
          ),
        ],
      ),
    );
  }
}
