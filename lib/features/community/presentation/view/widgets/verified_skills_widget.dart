import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class VerifiedSkillsWidget extends StatelessWidget {
  final List<String> skills;
  const VerifiedSkillsWidget({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(
              color: AppColors.secondary.withAlpha(150),
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            skills[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        );
      },
    );
  }
}
