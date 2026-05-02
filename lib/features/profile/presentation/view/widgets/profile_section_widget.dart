import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/generated/l10n.dart';

class ProfileSectionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const ProfileSectionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            height: size.height * 0.05,
            width: size.width * 0.12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isLightMode ? [
                  AppColors.blue.withAlpha(50),
                  AppColors.onboardingColor.withAlpha(130),
                ] : [
                  AppColors.blue.withAlpha(150),
                  AppColors.purple.withAlpha(150),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, color: AppColors.blue.withBlue(220)),
          ),
        ),
        SizedBox(width: size.width * 0.05),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 16.sp,
                  color: isLightMode ? null : AppColors.primary.withAlpha(120),
                ),
                // style: TextStyle(
                //   fontSize: 16.sp,
                //   color: AppColors.secondary,
                //   fontWeight: FontWeight.w600,
                // ),
              ),
              Text(
                title == S.of(context).profile_page_title7 && value == '' ? S.of(context).profile_page_title7_value : value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: isLightMode ? FontWeight.w700 : FontWeight.w600,
                ),
                // style: TextStyle(
                //   fontSize: 15.sp,
                //   color: AppColors.black.withAlpha(220),
                //   fontWeight: FontWeight.w700,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
