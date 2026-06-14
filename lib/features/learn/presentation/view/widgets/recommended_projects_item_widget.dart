import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_response_entity.dart';

class RecommendedProjectsItemWidget extends StatelessWidget {
  final ProjectsEntity project;
  const RecommendedProjectsItemWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isLightMode =
        Theme.of(context).brightness == Brightness.light ? true : false;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isLightMode
            ? AppColors.dividerColor.withAlpha(70)
            : AppColors.secondary.withAlpha(20),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: isLightMode
                    ? switch (project.difficulty) {
                        'Beginner' => AppColors.purple.withAlpha(30),
                        'Intermediate' => AppColors.orange.withAlpha(30),
                        'Advanced' => AppColors.red.withAlpha(30),
                        _ => AppColors.purple.withAlpha(30),
                      }
                    : switch (project.difficulty) {
                        'Beginner' => AppColors.blue.withAlpha(30),
                        'Intermediate' => AppColors.orange.withAlpha(30),
                        'Advanced' => AppColors.red.withAlpha(30),
                        _ => AppColors.blue.withAlpha(30),
                      },
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                project.difficulty,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: isLightMode
                      ? switch (project.difficulty) {
                          'Beginner' => AppColors.purple,
                          'Intermediate' => AppColors.orange,
                          'Advanced' => AppColors.red,
                          _ => AppColors.purple,
                        }
                      : switch (project.difficulty) {
                          'Beginner' => AppColors.blue,
                          'Intermediate' => AppColors.orange,
                          'Advanced' => AppColors.red,
                          _ => AppColors.blue,
                        },
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            project.projectTitle,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: isLightMode
                  ? AppColors.black
                  : AppColors.primary.withAlpha(200),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            project.overview,
            style: TextStyle(
              fontSize: 14.sp,
              color: isLightMode
                  ? AppColors.secondary.withAlpha(200)
                  : AppColors.blue.withAlpha(200),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'CORE FEATURES',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: isLightMode
                  ? AppColors.purple
                  : AppColors.primary.withAlpha(200),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: project.coreFeatures.length,
            itemBuilder: (context, index) {
              final feature = project.coreFeatures[index];
              return Padding(
                padding: EdgeInsets.all(4.w),
                child: Row(
                  children: [
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: BoxDecoration(
                        color: isLightMode ? AppColors.purple : AppColors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 14.sp,
                          height: 1.5,
                          color: isLightMode
                              ? AppColors.black
                              : AppColors.blue.withAlpha(200),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: isLightMode
                  ? AppColors.secondary.withAlpha(20)
                  : AppColors.primary.withAlpha(30),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TECH STACK',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color:
                        isLightMode ? AppColors.secondary : AppColors.primary,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  project.techStackUsage,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: isLightMode
                        ? AppColors.black
                        : AppColors.blue.withAlpha(200),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'IMPLEMENTATION STEPS',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: isLightMode
                  ? AppColors.secondary
                  : AppColors.primary.withAlpha(200),
            ),
          ),
          SizedBox(height: 4.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: project.implementationSteps.length,
            itemBuilder: (context, index) {
              final step = project.implementationSteps[index];
              return Padding(
                padding: EdgeInsets.all(4.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? AppColors.purple.withAlpha(30)
                            : AppColors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color:
                              isLightMode ? AppColors.purple : AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        step,
                        style: TextStyle(
                          fontSize: 14.sp,
                          height: 1.5,
                          color: isLightMode
                              ? AppColors.black
                              : AppColors.blue.withAlpha(200),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
