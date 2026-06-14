import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';

class UnassignedTaskWidget extends StatelessWidget {
  final TaskEntity unassignedTask;
  const UnassignedTaskWidget({super.key, required this.unassignedTask});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      margin: EdgeInsets.all(12.h),
      padding: EdgeInsets.only(right: 16.w, left: 24.w, bottom: 16.h),
      decoration: BoxDecoration(
        color:
            isLightMode ? AppColors.primary : AppColors.primary.withAlpha(230),
        boxShadow: isLightMode
            ? [
                BoxShadow(
                  color: AppColors.orange.withAlpha(100),
                  blurRadius: 4.r,
                  offset: const Offset(1, 2),
                ),
              ]
            : null,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(
            unassignedTask.taskName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            unassignedTask.description,
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
            itemCount: unassignedTask.requiredSkills.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                margin: EdgeInsets.only(top: 8.h, right: 8.w),
                decoration: BoxDecoration(
                  color: isLightMode ? AppColors.blue.withAlpha(30) : AppColors.purple.withAlpha(20),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  unassignedTask.requiredSkills[index],
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: isLightMode ? null : FontWeight.w600,
                    color: isLightMode ? AppColors.blue : AppColors.purple,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
