import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';
import 'package:syntra_ai/features/profile/presentation/view/widgets/profile_section_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class UserItemWidget extends StatelessWidget {
  final UserDataEntity user;
  const UserItemWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            user.name,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: isLightMode ? AppColors.purple : AppColors.blue,
                ),
            // style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            user.email,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
            // style: TextStyle(fontSize: 14.sp, color: AppColors.secondary, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: size.height * 0.015),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: isLightMode
                  ? AppColors.secondary.withAlpha(15)
                  : Theme.of(context).primaryColor.withAlpha(20),
              border: Border.all(color: AppColors.dividerColor, width: 1.4.r),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              user.role == 'learner'
                  ? S.of(context).signup_role1
                  : user.role == 'team'
                      ? S.of(context).signup_role2
                      : user.role == 'recruiter'
                          ? S.of(context).signup_role3
                          : user.role,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: isLightMode ? null : AppColors.blue,
                  ),
              textAlign: TextAlign.center,
              // style: TextStyle(fontSize: 16.sp, color: AppColors.purple, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            padding: EdgeInsets.all(12.r),
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            height: size.height * 0.68,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: isLightMode
                  ? AppColors.secondary.withAlpha(15)
                  : Theme.of(context).primaryColor.withAlpha(20),
              border: Border.all(
                  color: AppColors.dividerColor,
                  width: isLightMode ? 1.r : 0.4.r),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              spacing: size.height * 0.03,
              children: [
                ProfileSectionWidget(
                  icon: Icons.person,
                  title: S.of(context).profile_page_title4,
                  value: user.name,
                ),
                ProfileSectionWidget(
                  icon: Icons.email_outlined,
                  title: S.of(context).profile_page_title5,
                  value: user.email,
                ),
                ProfileSectionWidget(
                  icon: Icons.security_outlined,
                  title: S.of(context).profile_page_title6,
                  value: user.role == 'learner'
                      ? S.of(context).signup_role1
                      : user.role == 'team'
                          ? S.of(context).signup_role2
                          : user.role == 'recruiter'
                              ? S.of(context).signup_role3
                              : user.role,
                ),
                ProfileSectionWidget(
                  icon: Icons.code,
                  title: S.of(context).profile_page_title7,
                  value: user.githubId,
                ),
                ProfileSectionWidget(
                  icon: Icons.verified_outlined,
                  title: S.of(context).profile_page_title8,
                  value: user.emailVerified
                      ? S.of(context).profile_page_title8_value1
                      : S.of(context).profile_page_title8_value2,
                ),
                ProfileSectionWidget(
                  icon: Icons.security_outlined,
                  title: S.of(context).profile_page_title9,
                  value: user.isActive
                      ? S.of(context).profile_page_title9_value1
                      : S.of(context).profile_page_title9_value2,
                ),
                ProfileSectionWidget(
                  icon: Icons.calendar_today_outlined,
                  title: S.of(context).profile_page_title10,
                  value: user.createdAt,
                ),
                ProfileSectionWidget(
                  icon: Icons.calendar_today_outlined,
                  title: S.of(context).profile_page_title11,
                  value: user.updatedAt,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
