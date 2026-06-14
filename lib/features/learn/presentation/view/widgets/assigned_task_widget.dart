import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';
import 'package:syntra_ai/generated/l10n.dart';

class AssignedTaskWidget extends StatelessWidget {
  final AssignedTasksEntity assignedTask;
  const AssignedTaskWidget({super.key, required this.assignedTask});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      margin: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: isLightMode ? AppColors.primary : AppColors.primary.withAlpha(230),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha(100),
            blurRadius: 4.r,
            offset: const Offset(1, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0, 
              child: Container(
                width: 5.w,
                color: isLightMode ? AppColors.purple : AppColors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 12.w, right: 24.w, top: 12.h, bottom: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // VerticalDivider(
                  //   color: AppColors.purple,
                  //   thickness: 4.5,
                  //   radius: BorderRadius.circular(24.r),
                  //   indent: 0,
                  //   endIndent: 0,
                  //   width: 12.w,
                  // ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          assignedTask.task.taskName,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          assignedTask.task.description,
                          maxLines: 7,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black.withAlpha(180),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 12.h,
                            crossAxisSpacing: 12.h,
                            childAspectRatio: 5.5,
                          ),
                          itemCount: assignedTask.task.requiredSkills.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              margin: EdgeInsets.only(top: 8.h, right: 8.w),
                              decoration: BoxDecoration(
                                color: isLightMode ? AppColors.blue.withAlpha(30) : AppColors.purple.withAlpha(30),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                assignedTask.task.requiredSkills[index],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: isLightMode ? null : FontWeight.w600,
                                  color: isLightMode ? AppColors.blue : AppColors.purple,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          margin: EdgeInsets.only(right: 36.w),
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                              color: AppColors.purple.withAlpha(10),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: isLightMode ? AppColors.blue.withAlpha(100) : AppColors.purple.withAlpha(100),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${S.of(context).assigned_task_title1} ${(assignedTask.matchScore * 100).toInt().toString()}%',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w800,
                                  color: isLightMode ? AppColors.blue : AppColors.purple,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                assignedTask.reason,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
