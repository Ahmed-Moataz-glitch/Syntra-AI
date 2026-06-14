import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';

class FinishedSkillsWidget extends StatelessWidget {
  final UserDataResponseEntity userDataResponseEntity;
  const FinishedSkillsWidget({super.key, required this.userDataResponseEntity});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: isLightMode
              ? Color.fromARGB(181, 10, 170, 219)
              : AppColors.primary.withAlpha(150),
          width: 1.2.r,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isLightMode
                            ? [
                                AppColors.blue.withAlpha(130),
                                AppColors.scaffoldBackgroundColor.withAlpha(200),
                              ]
                            : [
                                AppColors.scaffoldBackgroundColor.withAlpha(200),
                                AppColors.blue.withAlpha(130),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.school_outlined,
                      size: 32.sp,
                      color: AppColors.blue,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SKILLS ACQUIRED',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: isLightMode
                              ? AppColors.secondary
                              : AppColors.primary.withAlpha(220),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        userDataResponseEntity.user.finishedTracks.first,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: isLightMode
                              ? AppColors.black
                              : AppColors.primary.withAlpha(170),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isLightMode
                      ? AppColors.blue.withAlpha(50)
                      : AppColors.blue.withAlpha(160),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  userDataResponseEntity.user.skills.length == 1
                      ? '${userDataResponseEntity.user.skills.length} Skill'
                      : '${userDataResponseEntity.user.skills.length} Skills',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue.withAlpha(220),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isLightMode
                      ? AppColors.blue.withAlpha(40)
                      : AppColors.blue.withAlpha(160),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  userDataResponseEntity.user.skills[index],
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue.withAlpha(220),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 12.h), 
            itemCount: userDataResponseEntity.user.skills.length,
          ),
        ],
      ),
    );
  }
}
